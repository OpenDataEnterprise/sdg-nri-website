<template>
<div class="sidebar-filter"
  v-bind:class="{ 'hide-options': !visible }">
  <div class="filter-handle"
    tabindex="0"
    v-bind:class="{ 'active': visible }"
    v-on:click="visible = !visible"
    v-on:focus="visible = true">
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
      v-bind:child-field="childField"
      v-bind:filter-model="option"
      v-bind:key="option[labelField]"
      v-on:filter-update="passFilterUpdate">
    </filter-option>
  </ul>
</div>
</template>

<script>
import FilterOption from 'vue/filter-option.vue';

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
    childField: {
      type: String,
      default: '',
    },
    filterOptions: {
      type: Array,
      default: function () {
        return [];
      }
    },
  },
  data: function () {
    return {
      visible: false,
    }
  },
  methods: {
    passFilterUpdate: function () {
      this.$emit('filter-update');
    },
  },
  components: {
    'filter-option': FilterOption,
  },
};
</script>