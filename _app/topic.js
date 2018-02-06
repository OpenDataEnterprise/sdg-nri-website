import Config from 'config'; // Aliased via WebPack.
import Vue from 'vue';
import VueRouter from 'vue-router';
import ResourceList from 'vue/resource-list.vue';
import Pagination from 'vue/pagination.vue';
import * as Utility from 'js/utility';

(function () {
  Vue.use(VueRouter);
      
  const apiPath = Config.apiPath;

  const router = new VueRouter({
    mode: 'history',
    routes: [
      { path: '/topic/:tag' }
    ]
  });

  const TopicComponent = {
    router,
    el: '#directory',
    data: function () {
      return {
        resources: [],
        topics: [],
        tag: '',
        pagination: {
          currentPage: 1,
          resultsPerPage: 5,
          totalResults: 0,
        },
      };
    },
    methods: {
      isActive: function (tag) {
        return (this.tag === tag)
      },
      changePage: function (pageNumber) {
        const offset = this.pagination.resultsPerPage * (pageNumber - 1);

        Utility.loadJSON(apiPath + 'resources' +
          '?limit=' + this.pagination.resultsPerPage +
          '&offset=' + offset +
          '&topic=' + this.tag)
        .then((results) => {
          // Check whether resource count has been updated.
          if (results.count !== this.pagination.totalResults) {
            this.pagination.totalResults = results.count;
          }

          this.resources = Utility.formatResults(
            results.rows,
            ['date_published'],
            false);
        });

        this.pagination.currentPage = pageNumber;
        console.log('Current resources page: ' + this.pagination.currentPage);
      },
    },
    components: {
      'resource-list': ResourceList,
      'pagination': Pagination,
    },
    created: function () {
      let self = this;

      self.tag = self.$route.params.tag;

      // Load data.
      let requestPromises = [];

      let resourceQuery = apiPath + 'resources' +
        '?limit=' + this.pagination.resultsPerPage +
        '&topic=' + self.tag;

      requestPromises.push(Utility.loadJSON(resourceQuery));
      requestPromises.push(Utility.loadJSON(apiPath + 'topics'));

      Promise.all(requestPromises).then(function (results) {
        const resourceResults = results[0];
        self.topics = results[1];

        const resources = Utility.formatResults(
          resourceResults.rows,
          ['date_published'],
          false);
        self.resources = resources;

        console.log(self.topics);
      });
    },
    delimiters: ["((", "))"],
  };

  new Vue(TopicComponent);
})();