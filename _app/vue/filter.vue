<template>
<div
  class="sidebar-filter"
  v-bind:class="{ 'hide-options': !visible }">
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
import { store } from 'js/global-store';
import { getURLParameters } from 'js/utility';

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
    initialOptions: {
      type: Array
    },
    nested: {
      type: Boolean,
      default: false
    }
  },
  data: function () {
    return {
      visible: false,
      filterOptions: this.initialOptions,
    }
  },
  methods: {
    buildHierarchy: function (pathField) {
      let filters = [];

      const docsCount = this.filterOptions.length;
      for (let i = 0; i < docsCount; i++) {
        const doc = this.filterOptions[i];
        const path = doc[pathField];
        const pathTokens = path.split('.');
        const pathTokenCount = pathTokens.length;

        let filter = {};
        filters.push(filter);
        let currentPath = filter;
        for (let j = 0; j < pathTokenCount; j++) {
          let pathToken = pathTokens[j];

          if (!(pathToken in currentPath)) {
            currentPath[pathToken] = {};
            currentPath[pathToken][this.labelField] = doc[this.labelField];
            currentPath[pathToken][this.valueField] = doc[this.valueField];
          }

          if (!('children' in currentPath[pathToken])) {
            currentPath[pathToken].children = [];
          }
    
          currentPath = currentPath[pathToken].children;
        }
      }

      return filters;
    },
    clear: function () {
      store.commit('clearFilterType', this.filterType);
    }
  },
  components: {
    'filter-option': FilterOption
  },
  mounted: function () {
    /*if (this.nested) {
      this.filterOptions = this.buildHierarchy('path');
      console.log(this.filterOptions);
    }*/

    let params = getURLParameters();
    let type = this.filterType.toLowerCase();

    if (type in params) {
      let filters = params[type].split(',');
      console.log(filters);
      for (let i = 0; i < filters.length; i++) {
        let filterId = 'f-' + filters[i];
        let f = document.getElementById(filterId);
        f.setAttribute('checked', 'checked');

        let filterObj = {
          value: filters[i],
          category: this.filterType
        };

        store.commit('toggleFilter', filterObj);
      }
    }
  }
};
</script>
