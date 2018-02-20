<template>
<li v-if="isExpandable">
  <label class="filter-option-expandable-label">
    <input
      class="checkbox"
      type="checkbox"
      v-bind:id="'f-' + filterType + '-' + filterModel[valueField]"
      v-bind:value="filterModel[valueField]"
      v-bind:checked="isChecked"
      v-on:click="toggleFilter">
    <span>{{ filterModel[labelField] }}</span>
  </label>
  <span class="filter-expansion-indicator"
    v-on:click="toggle">[{{ expanded ? '-' : '+' }}]</span>
  <ul class="filter-list" v-show="expanded">
    <filter-option
      class="filter-option"
      v-for="subfilterModel in filterModel[childField]"
      v-bind:filter-type="filterType"
      v-bind:label-field="labelField"
      v-bind:value-field="valueField"
      v-bind:child-field="childField"
      v-bind:filter-model="subfilterModel"
      v-bind:key="subfilterModel[labelField]"
      v-on:filter-update="updateCheck">
    </filter-option>
  </ul>
</li>
<li v-else>
  <label class="filter-option-label">
    <input
      class="checkbox"
      type="checkbox"
      v-bind:id="'f-' + filterType + '-' + filterModel[valueField]"
      v-bind:value="filterModel[valueField]"
      v-bind:checked="isChecked"
      v-on:click="toggleFilter">
    <span>{{ filterModel[labelField] }}</span>
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
    childField: {
      type: String,
      default: ''
    },
    filterType: {
      type: String,
    },
    filterModel: {
      type: Object,
      required: true,
    },
  },
  data: function () {
    return {
      filterValue: this.filterModel[this.valueField],
      expanded: true,
    };
  },
  computed: {
    selectedFilters: function () {
      return this.$store.state.filters.selectedFilters;
    },
    isExpandable: function () {
      if (!(this.childField in this.filterModel)
        || !this.childField) {
        return false;
      }

      return this.filterModel[this.childField];
    },
    isChecked: function () {
      if (this.filterType in this.selectedFilters
        && this.filterValue in this.selectedFilters[this.filterType]
        && this.selectedFilters[this.filterType][this.filterValue] === true) {
        return true;
      }

      return false;
    },
  },
  methods: {
    toggle: function () {
      if (this.isExpandable) {
        this.expanded = !this.expanded;
      }
    },
    toggleFilter: function () {
      console.log('toggleFilter called');

      const selectedFilters = this.selectedFilters[this.filterType];
      const filter = {
        value: this.filterValue,
        category: this.filterType,
      };

      this.$store.commit('toggleFilter', filter);

      // If the selected filter is currently unselected and not all its children
      // are selected, then activate the selected filter and all its children.

      if (this.childField in this.filterModel
        && this.filterModel[this.childField]) {
        if (selectedFilters[this.filterValue]) {
          const children = this.filterModel[this.childField];
          const childCount = children.length;

          for (let i = 0; i < childCount; i++) {
            const child = children[i];
            const subfilter = {
              value: child[this.valueField],
              category: this.filterType,
            };

            this.$store.commit('activateFilter', subfilter);
          }
        } else {
          if (this.areAllChildrenSelected()) {
            const children = this.filterModel[this.childField];
            const childCount = children.length;

            for (let i = 0; i < childCount; i++) {
              const child = children[i];

              const subfilter = {
                value: child[this.valueField],
                category: this.filterType,
              };

              this.$store.commit('deactivateFilter', subfilter);
            }
          }
        }
      }

      this.$emit('filter-update');
    },
    updateCheck: function () {
      const selectedFilters = this.selectedFilters[this.filterType];

      if (selectedFilters[this.filterValue]
        && this.childField in this.filterModel
        && this.filterModel[this.childField].length > 0) {
        const children = this.filterModel[this.childField];
        const childCount = children.length;

        // Flag to see if all suboptions are selected.
        let areAllSelected = true;

        if (!this.areAllChildrenSelected()) {
          const filter = {
            value: this.filterValue,
            category: this.filterType,
          };

          this.$store.commit('deactivateFilter', filter);
        }
      }

      this.$emit('filter-update');
    },
    areAllChildrenSelected: function () {
      if (!(this.childField in this.filterModel)) {
        return true;
      }

      const selectedFilters = this.selectedFilters[this.filterType];
      const children = this.filterModel[this.childField];
      const childCount = children.length;

      // Flag to see if all suboptions are selected.
      let areAllSelected = true;

      for (let i = 0; i < childCount; i++) {
        const child = children[i];

        if (!(child[this.valueField] in selectedFilters)) {
          areAllSelected = false;
        }
      }

      return areAllSelected;
    },
  }
};
</script>