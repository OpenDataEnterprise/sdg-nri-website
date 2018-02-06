<template>
<li v-if="isExpandable">
    <input
      class="filter-option-checkbox"
      type="checkbox"
      v-bind:id="'f-' + filterType + '-' + model[valueField]"
      v-bind:value="model[valueField]"
      v-bind:checked="isChecked"
      v-on:click="emitFilterUpdate">
    <label class="filter-option-label"
      v-bind:for="'f-' + filterType + '-' + model[valueField]"
      v-on:click="toggle">{{ model[labelField] }}</label>
    <span class="filter-expansion-indicator">[{{ expanded ? '-' : '+' }}]</span>
  <ul class="filter-list" v-show="expanded">
    <filter-option
      class="filter-option"
      v-for="model in model[childrenField]"
      v-bind:filter-type="filterType"
      v-bind:label-field="labelField"
      v-bind:value-field="valueField"
      v-bind:children-field="childrenField"
      v-bind:model="model"
      v-bind:key="model[labelField]"
      v-on:filter-update="emitFilterUpdate">
    </filter-option>
  </ul>
</li>
<li v-else>
  <input
    class="filter-option-checkbox"
    type="checkbox"
    v-bind:id="'f-' + filterType + '-' + model[valueField]"
    v-bind:value="model[valueField]"
    v-bind:checked="isChecked"
    v-on:click="emitFilterUpdate">
  <label class="filter-option-label"
    v-bind:for="'f-' + filterType + '-' + model[valueField]">
    {{ model[labelField] }}
  </label>
</li>
</template>

<script>
export default {
  name: 'filter-option',
  props: {
    valueField: {
      type: String,
      default: '',
    },
    labelField: {
      type: String,
      default: '',
    },
    childrenField: {
      type: String,
      default: '',
    },
    filterType: {
      type: String,
    },
    model: {
      type: Object,
      required: true,
    },
    selectedOptions: {
      type: Object,
      default: function () {
        return {};
      },
    }
  },
  data: function () {
    return {
      expanded: true,
    };
  },
  computed: {
    isExpandable: function () {
      if (!(this.childrenField in this.model)
        || !this.childrenField) {
        return false;
      }

      return this.model[this.childrenField];
    },
    isChecked: function () {
      const value = this.model[this.valueField];

      if (value in this.selectedOptions
        && this.selectedOptions[value] === true) {
        return true;
      }

      return false;
    }
  },
  methods: {
    toggle: function () {
      if (this.isExpandable) {
        this.expanded = !this.expanded;
      }
    },
    emitFilterUpdate: function (event) {
      let filterObj = {
        value: this.model[this.valueField],
        category: this.filterType,
      };

      console.log('Emitting filter-update event for ', filterObj.value);
      this.$emit('filter-update', filterObj);
    }
  }
};
</script>