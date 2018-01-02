<template>
<div
  class="sidebar-filter"
  v-bind:class="{ 'hide-options': !visible }"
  v-on:filter-update="updateFilter">
  <div
    class="filter-handle"
    v-bind:class="{ 'active': visible }"
    v-on:click="visible = !visible">
    <label class="filter-label">{{ filterType }}</label>
    <button
      class="filter-clear"
      type="button"
      v-on:click="clear">Clear</button>
  </div>
  <ul class="filter-list">
    <filter-option
      class="filter-option"
      v-bind:filter-type="filterType"
      v-bind:label-field="labelField"
      v-bind:value-field="valueField"
      v-bind:children-field="childrenField"
      v-bind:model="option"
      v-for="option in filterOptions"
      v-bind:key="option[labelField]">
    </filter-option>
  </ul>
</div>
</template>

<script>
import FilterOption from 'vue/filter-option.vue';

export default {
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
    filterOptions: {
      type: Array
    }
  },
  data: function () {
    return {
      visible: false,
      filterValues: [],
    }
  },
  /*watch: {
    filterValues: function (v) {
      Vue.set(this.sharedState.selectedFilters, this.filterType, v);
    }
  },*/
  methods: {
    updateFilter: function (value) {
      console.log("Detected " + value + "!");
      this.filterValues.push(value);
    },
    clear: function () {
      this.filterValues = [];
    }
  },
  components: {
    'filter-option': FilterOption
  }
};
</script>
