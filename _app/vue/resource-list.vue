<template>
<ul class="resource-list">
  <li class="resource-list-item" v-for="(resource, index) in filteredData" tabindex="0">
    <img class="resource-image">
    <section class="resource-info">
      <h1 class="resource-title">
          <a :href="(( resource.url ))" target="_blank">{{ resource.title }}</a>
      </h1>
      <div class="resource-organization">{{ resource.organization }}</div>
      <div class="resource-description">{{ resource.description }}</div>
      <div class="resource-tags" v-if="resource.tags.length > 0">
        <ul class="resource-tags-list">
          <li class="subject-tag" v-for="tag in resource.tags">{{ tag }}</li>
        </ul>
      </div>
    </section>
  </li>
</ul>
</template>

<script>
export default {
  props: {
    resources: Array,
    index: Object,
    filterKey: String,
    filters: Array,
  },
  computed: {
    filteredData: function () {
      var data = [];
      var resources = this.resources;
      var filterKey = this.filterKey;
      var filters = this.filters.join(' ');
      var query = [filterKey, filters].filter(function (val) { return val.toLowerCase(); }).join(' ');
  
      if (query) {
        var results = index.search(query);

        if (results) {
          results.forEach(function (result) {
            var index = parseInt(result.ref);
            data.push(resources[index]);
          });
        }
      } else {
        data = this.resources;
      }
 
      return data;
    }
  },
};
</script>
