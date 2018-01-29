<template>
<div
  class="sidebar-filter"
  v-bind:class="{ 'hide-options': !visible }">
  <div
    class="filter-handle"
    v-bind:class="{ 'active': visible }"
    v-on:click="visible = !visible">
    <h2 class="filter-label">{{ filterLabel }}</h2>
  </div>
  <ul class="filter-list">
    <filter-option
      class="filter-option"
      v-bind:filter-label="filterLabel"
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
    filterLabel: {
      type: String,
    },
    filterType: {
      type: String,
    },
    labelField: {
      type: String,
      default: '',
    },
    valueField: {
      type: String,
      default: '',
    },
    childrenField: {
      type: String,
      default: '',
    },
    initialOptions: {
      type: Array,
    },
  },
  data: function () {
    return {
      visible: false,
      filterOptions: this.initialOptions,
    }
  },
  methods: {
    clear: function () {
      store.commit('clearFilterCategory', this.filterOptions[filterType]);
    }
  },
  components: {
    'filter-option': FilterOption,
  },
  mounted: function () {
    const urlParams = getURLParameters();

    if (this.filterType in urlParams) {
      let filters = urlParams[this.filterType].split(',');

      for (let i = 0; i < filters.length; i++) {
        const filterId = 'f-' + filters[i];
        const f = document.getElementById(filterId);
        f.setAttribute('checked', 'checked');

        let filterObj = {
          value: filters[i],
          category: this.filterType,
        };

        store.commit('toggleFilter', filterObj);
      }
    }
  }
};
</script>