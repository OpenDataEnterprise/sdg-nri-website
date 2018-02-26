import Config from 'config'; // Aliased via WebPack.
import Vue from 'vue';
import VueRouter from 'vue-router';
import * as Utility from 'scripts/utility';
import ResourceList from 'vue/resource-list.vue';
import Pagination from 'vue/pagination.vue';

(function () {
  Vue.use(VueRouter);
      
  const apiPath = Config.apiPath;

  const router = new VueRouter({
    mode: 'history',
    routes: [
      { path: '/topic/:tag' }
    ]
  });

  new Vue ({
    router,
    el: '#directory',
    data: function () {
      return {
        resources: [],
        tag: '',
        pagination: {
          currentPage: 1,
          resultsPerPage: 5,
          totalResults: 0,
        },
      };
    },
    methods: {
      getQueryString: function (pageNumber) {
        const limit = this.pagination.resultsPerPage;
        const offset = this.pagination.resultsPerPage * (pageNumber - 1);

        let queryString = '?limit=' + limit + '&offset=' + offset +
          '&topic=' + this.tag;

        return queryString;
      },
      refresh: function (pageNumber = 1) {
        let self = this;

        const query = apiPath + 'resources' + self.getQueryString(pageNumber);

        Utility.loadJSON(query).then((results) => {
          Vue.set(self.pagination, 'totalResults', results.count);

          const resources = Utility.formatResults(
            results.rows,
            ['date_published'],
            false);

          Vue.set(self, 'resources', resources);
        });

        Vue.set(self.pagination, 'currentPage', pageNumber);
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
      let resourceQuery = apiPath + 'resources' + self.getQueryString(1);
      requestPromises.push(Utility.loadJSON(resourceQuery));

      Promise.all(requestPromises).then(function (results) {
        const resourceResults = results[0];

        self.resources = Utility.formatResults(
          resourceResults.rows,
          ['date_published'],
          false);
      });
    },
    delimiters: ["((", "))"],
  });
})();