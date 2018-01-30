import Config from 'config'; // Aliased via WebPack.
import Vue from 'vue';
import Vuex from 'vuex';
import { store } from 'js/global-store';
import NewsList from 'vue/newsfeed.vue';
import Pagination from 'vue/pagination.vue';
import * as Utility from 'js/utility';

(function () {
  const apiPath = Config.apiPath;

  new Vue({
    store,
    el: '#news-updates',
    data: function () {
      return {
        news: [],
        events: [],
        tags: [],
        filterTags: {},
        pagination: {
          currentPage: 1,
          resultsPerPage: 10,
          totalResults: 0,
        },
      };
    },
    methods: {
      addTag: function (tag) {
        if (tag in this.filterTags) {
          return;
        }

        Vue.set(this.filterTags, tag, true);
        console.log(Object.keys(this.filterTags));
        this.refresh();
      },
      removeTag: function (tag) {
        if (tag in this.filterTags) {
          Vue.delete(this.filterTags, tag);
        }
        console.log(Object.keys(this.filterTags));
        this.refresh();
      },
      refresh: function (pageNumber = 1) {
        let self = this;

        const offset = self.pagination.resultsPerPage * (pageNumber - 1);
        let query = apiPath + 'news' +
          '?limit=' + self.pagination.resultsPerPage +
          '&offset=' + offset;

        if (Object.keys(self.filterTags).length > 0) {
          query = query + '&tags=' + Object.keys(self.filterTags);
        }

        Utility.loadJSON(query)
        .then(function (results) {
          self.pagination.totalResults = results.count;

          const news = Utility.formatResults(
            results.rows,
            ['created_at'],
            true);

          self.news = news;
        });

        self.pagination.currentPage = pageNumber;
        console.log('Current news page: ' + self.pagination.currentPage);
      },
      clearAll: function () {
        console.log('Clearing filters.');
        store.commit('clearFilters');
        console.log(store.state);
      },
    },
    components: {
      'newsfeed': NewsList,
      'pagination': Pagination,
    },
    created: function () {
      let self = this;

      // Load data.
      let requestPromises = [];

      let newsQuery = 'news' +
        '?limit=' + self.pagination.resultsPerPage;

      if (Object.keys(self.filterTags).length > 0) {
        newsQuery = newsQuery + '&tags=' + Object.keys(self.filterTags);
      }

      requestPromises.push(Utility.loadJSON(apiPath + newsQuery));
      requestPromises.push(Utility.loadJSON(apiPath + 'events'));
      requestPromises.push(Utility.loadJSON(apiPath + 'tags/news'));
      
      Promise.all(requestPromises).then(function (results) {
        const newsResults = results[0];
        const eventsResults = results[1];
        const tags = results[2];

        const news = Utility.formatResults(
          newsResults.rows,
          ['created_at'],
          true
        );

        const events = Utility.formatResults(
          eventsResults,
          ['start_time', 'end_time'],
          true
        );

        self.pagination.totalResults = newsResults.count;
        self.news = news;
        self.events = events;
        self.tags = tags;
      });
    },
    delimiters: ["((", "))"],
  });
})();