import Config from 'config'; // Aliased via WebPack.
import Vue from 'vue';
import { store } from 'scripts/global-store';
import * as Utility from 'scripts/utility';
import ResourceList from 'vue/resource-list.vue';
import Filter from 'vue/filter.vue';
import Pagination from 'vue/pagination.vue';
import SearchBar from 'vue/search-bar.vue';

Vue.component('search-bar', SearchBar);

(function () {
  const apiPath = Config.apiPath;

  new Vue({
    store,
    el: '#directory',
    data: function () {
      return {
        searchQuery: '',
        resources: [],
        filterOptions: {
          country: [],
          language: [],
          topic: [],
          type: [],
        },
        pagination: {
          currentPage: 1,
          resultsPerPage: 10,
          totalResults: 0,
        },
        isLoading: true,
      };
    },
    computed: {
      selectedFilters: function () {
        return this.$store.state.filters.selectedFilters;
      },
    },
    methods: {
      search: function (search, event) {
        this.refresh();
      },
      getQueryString: function (pageNumber) {
        const limit = this.pagination.resultsPerPage;
        const offset = this.pagination.resultsPerPage * (pageNumber - 1);

        let queryString = '?limit=' + limit + '&offset=' + offset;

        const categories = Object.keys(this.selectedFilters);
        const categoryCount = categories.length;

        for (let i = 0; i < categoryCount; ++i) {
          const category = categories[i];

          let selectedOptions = [];
          if (category in this.selectedFilters) {
            selectedOptions = Object.keys(this.selectedFilters[category]);
          }

          const selectedOptionsCount = selectedOptions.length;

          // Skip filters with no values.
          if (!(selectedOptions.length > 0)) {
            continue;
          }

          for (let j = 0; j < selectedOptionsCount; j++) {
            // Replace spaces in query parameters with '+'.
            const formattedValue = selectedOptions[j].replace(/\s/g, '+');

            queryString += '&' + category + '=' + formattedValue;
          }
        }

        if (this.searchQuery) {
          queryString += '&search=' + this.searchQuery.replace(/\s/g, '+');
        }

        return queryString;
      },
      addTag: function (tag) {
        if (!('tags' in this.selectedFilters)) {
          this.selectedFilters.tags = {};
        }

        if (tag in this.selectedFilters.tags) {
          return;
        }

        Vue.set(this.selectedFilters.tags, tag, true);

        this.refresh();
      },
      removeTag: function (tag) {
        if (tag in this.selectedFilters.tags) {
          Vue.delete(this.selectedFilters.tags, tag);
        }

        this.refresh();
      },
      refresh: function (pageNumber = 1) {
        let self = this;

        const query = apiPath + 'resources' + self.getQueryString(pageNumber);

        self.isLoading = true;

        Utility.loadJSON(query).then((results) => {
          Vue.set(self.pagination, 'totalResults', results.count);

          const resources = Utility.formatResults(
            results.rows,
            ['date_published'],
            false);

          Vue.set(self, 'resources', resources);
          Vue.set(self.pagination, 'currentPage', pageNumber);
        }).finally(() => {
          self.isLoading = false;
        });
      },
      clearAllFilters: function () {
        this.$store.commit('clearAllFilters');
        this.refresh();
      },
    },
    components: {
      'resource-list': ResourceList,
      'resource-filter': Filter,
      'pagination': Pagination,
    },
    mounted: function () {
      let self = this;

      // Load data.
      let requestPromises = [];
      requestPromises.push(Utility.loadJSON(apiPath + 'resources?limit='
        + self.pagination.resultsPerPage));
      requestPromises.push(Utility.loadJSON(apiPath + 'countries'));
      requestPromises.push(Utility.loadJSON(apiPath + 'languages'));
      requestPromises.push(Utility.loadJSON(apiPath + 'topics'));
      requestPromises.push(Utility.loadJSON(apiPath + 'content_types'));

      Promise.all(requestPromises).then(function (results) {
        const resourceResults = results[0];
        const countries = results[1];
        const languages = results[2];
        const topics = results[3];
        const content_types = results[4];

        const resourceCount = resourceResults.count;
        const resources = Utility.formatResults(
          resourceResults.rows,
          ['date_published'],
          false);

        Vue.set(self, 'resources', resources);
        Vue.set(self.pagination, 'totalResults', resourceCount);
        Vue.set(self.filterOptions, 'country', countries);
        Vue.set(self.filterOptions, 'language', languages);
        Vue.set(self.filterOptions, 'topic', topics);
        Vue.set(self.filterOptions, 'type', content_types);
      }).finally(() => {
        self.isLoading = false;
      });
    },
  });
})();