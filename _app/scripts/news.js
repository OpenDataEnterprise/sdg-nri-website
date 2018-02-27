import Config from 'config'; // Aliased via WebPack.
import Vue from 'vue';
import * as Utility from 'scripts/utility';
import NewsFeed from 'vue/newsfeed.vue';
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
        tags: [],
        filterTags: {},
        pagination: {
          currentPage: 1,
          resultsPerPage: 5,
          totalResults: 0,
        },
      };
    },
    methods: {
      addTag: function (tag) {
        if (tag in this.filterTags) {
          return false;
        }

        Vue.set(this.filterTags, tag, true);
        this.refresh();
        return true;
      },
      removeTag: function (tag) {
        if (!(tag in this.filterTags)) {
          return false;
        }

        Vue.delete(this.filterTags, tag);
        this.refresh();
        return true;
      },
      checkTag: function (tag, event) {
        if (tag in this.filterTags) {
          return this.removeTag(tag);
        } else {
          return this.addTag(tag);
        }
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

        Utility.loadJSON(query).then(function (results) {
          self.pagination.totalResults = results.count;

          const news = Utility.formatResults(
            results.rows,
            ['created_at'],
            true);

          self.news = news;
        });

        self.pagination.currentPage = pageNumber;
      },
    },
    components: {
      'newsfeed': NewsFeed,
      'event-feed': EventFeed,
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