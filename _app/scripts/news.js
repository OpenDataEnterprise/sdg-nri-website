import Config from 'config'; // Aliased via WebPack.
import Vue from 'vue';
import * as Utility from 'scripts/utility';
import NewsFeed from 'vue/news-feed.vue';
import EventFeed from 'vue/event-feed.vue';
import Pagination from 'vue/pagination.vue';

(function () {
  const apiPath = Config.apiPath;

  new Vue({
    el: '#news-updates',
    data: function () {
      return {
        news: [],
        events: [],
        pagination: {
          currentPage: 1,
          resultsPerPage: 5,
          totalResults: 0,
        },
        isLoading: true,
      };
    },
    methods: {
      refresh: function (pageNumber = 1) {
        let self = this;

        const offset = self.pagination.resultsPerPage * (pageNumber - 1);
        let query = apiPath + 'news' +
          '?limit=' + self.pagination.resultsPerPage +
          '&offset=' + offset;

        Utility.loadJSON(query).then(function (results) {
          self.pagination.totalResults = results.count;

          const news = Utility.formatResults(
            results.rows,
            ['created_at'],
            true);

          self.news = news;
        }).finally(() => {
          self.isLoading = false;
        });

        self.pagination.currentPage = pageNumber;
      },
    },
    components: {
      'news-feed': NewsFeed,
      'event-feed': EventFeed,
      'pagination': Pagination,
    },
    created: function () {
      let self = this;

      // Load data.
      let requestPromises = [];

      let newsQuery = 'news' +
        '?limit=' + self.pagination.resultsPerPage;

      requestPromises.push(Utility.loadJSON(apiPath + newsQuery));
      requestPromises.push(Utility.loadJSON(apiPath + 'events'));
      
      Promise.all(requestPromises).then(function (results) {
        const newsResults = results[0];
        const eventsResults = results[1];

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
      }).finally(() => {
        self.isLoading = false;
      });
    },
    delimiters: ["((", "))"],
  });
})();