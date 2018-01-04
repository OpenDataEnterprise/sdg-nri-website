<template>
<li v-if="isExpandable">
  <div v-on:click="toggle">
    {{ model[labelField] }}
    <span>[{{ expanded ? '-' : '+' }}]</span>
  </div>
  <ul class="filter-list" v-show="expanded">
    <filter-option
      class="filter-option"
      v-bind:filter-type="filterType"
      v-bind:label-field="labelField"
      v-bind:value-field="valueField"
      v-bind:children-field="childrenField"
      v-bind:model="model"
      v-for="model in model[childrenField]"
      v-bind:key="model[labelField]">
    </filter-option>
  </ul>
</li>
<li v-else>
  <input
    type="checkbox"
    v-bind:id="'f-' + model[valueField]"
    v-bind:value="model[valueField]"
    v-on:click="emitFilterUpdate">
  <label v-bind:for="'f-' + model[valueField]">{{ model[labelField] }}</label>
</li>
</template>

<script>
import { store } from 'js/global-store';

export default {
  name: 'filter-option',
  props: {
    valueField: {
      type: String,
      default: ''
    },
    labelField: {
      type: String,
      default: ''
    },
    childrenField: {
      type: String,
      default: ''
    },
    filterType: {
      type: String
    },
    model: {
      type: Object
    }
  },
  data: function () {
    return {
      expanded: false
    };
  },
  computed: {
    check: function () {
      if (store.state.selectedFilters[this.filterType][this.valueField]) {
        this.$attrs.checked = 'checked';
      } else {
        delete this.$attrs.checked;
      }

      return true;
    },
    isExpandable: function () {
      if (!(this.childrenField in this.model)
        || !this.childrenField) {
        return false;
      }

      return this.model[this.childrenField] &&
        this.model[this.childrenField].length;
    }
  },
  methods: {
    toggle: function () {
      if (this.isExpandable) {
        this.expanded = !this.expanded;
      }
    },
    emitFilterUpdate: function (e) {
      let filterObj = {
        value: this.model[this.valueField],
        category: this.filterType
      };

      store.commit('toggleFilter', filterObj);
    }
  }
};
</script>
