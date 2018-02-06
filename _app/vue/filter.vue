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
      v-for="option in filterOptions"
      v-bind:filter-label="filterLabel"
      v-bind:filter-type="filterType"
      v-bind:label-field="labelField"
      v-bind:value-field="valueField"
      v-bind:children-field="childrenField"
      v-bind:selected-options="selectedOptions"
      v-bind:model="option"
      v-bind:key="option[labelField]"
      v-on:filter-update="emitFilterUpdate">
    </filter-option>
  </ul>
</div>
</template>

<script>
import Vue from 'vue';
import FilterOption from 'vue/filter-option.vue';
import { getURLParameters } from 'js/utility';

export default {
  props: {
    filterLabel: {
      type: String,
      required: true,
    },
    filterType: {
      type: String,
      required: true,
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
    filterOptions: {
      type: Array,
      default: function () {
        return [];
      }
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
      visible: false,
    }
  },
  methods: {
    emitFilterUpdate: function (filterObj, event) {
      console.log('Captured filter click');
      this.$emit('filter-update', filterObj);
    },
    clear: function () {
      Vue.set(this.selectedFilters, {});
    },
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

        console.log('Emitting update');
        this.$emit('filter-update', filterObj);
      }
    }
  }
};
</script>