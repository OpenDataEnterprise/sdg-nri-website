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
import Vuex from 'vuex';
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
    isExpandable: function () {
      if (!this.childrenField ||
        !(this.childrenField in this.model)) {
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
      var value = this.model[this.valueField];
      var flag = e.target.checked;
      var category = this.filterType;
      console.log("Selected " + value + ":" + flag + " in " + category);

      var filter = {
        value: value,
        flag: flag,
        category: category
      };

      store.commit('toggleFilter', filter);
      console.log(store.state.selectedFilters);
    }
  }
};
</script>
