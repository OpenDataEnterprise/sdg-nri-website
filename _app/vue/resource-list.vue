<template>
<div class="resources-list-component" v-if="isLoading">
  <div class="loader">Loading...</div>
</div>
<div class="resources-list-component" v-else>
  <div class="results-counter" v-if="(isFilterable && this.resources.length > 0)">
    Showing results <b>{{ firstResultIndex }} - {{ lastResultIndex }}</b> out of <b>{{ totalResults }}</b>
  </div>
  <ul class="resource-tags" v-if="Object.keys(tags).length > 0">
    <li class="subject-tag"
      v-for="(item, tag) in tags"
      v-on:click="tagDeselect(tag)">
      <span class="icon-close" aria-hidden="true"></span>
      <span>{{ tag }}</span>
    </li>
  </ul>
  <div v-if="isFilterable === true && resources.length === 0">
    <div class="no-results-heading">No results.</div>
    <div class="no-results-message">Try narrowing your search or <span class="reset-resource-list" v-on:click="viewAll">view all resources</span>.</div>
  </div>
  <div v-else-if="isFilterable !== true && resources.length === 0">
    <div class="no-results-message">There are no resources available for this topic. Please help us by <a href="submit-resource">contributing a resource</a>.</div>
  </div>
  <ul class="resource-list" v-else>
    <li class="resource-list-item" v-for="(resource, index) in resources">
      <article class="resource-card">
        <img class="resource-image"
          v-bind:src="resource.image_url"
          v-if="resource.image_url">
        <h1 class="resource-title">
          <a target="_blank"
            v-bind:href="resource.url"
            v-on:click="trackResource(resource.url)">
            {{ resource.title }}
          </a>
        </h1>
        <span class="resource-organization">{{ resource.organization }}</span>
        <span class="info-divider"
          v-if="resource.date_published">|</span>
        <span class="resource-publication-date"
          v-if="resource.date_published">
          {{ resource.date_published }}
        </span>
        <div class="resource-description">{{ resource.description }}</div>
        <div class="resource-tags" v-if="hasTags(resource)">
          <ul class="resource-tags-list">
            <li class="subject-tag"
              v-for="tag in resource.tags"
              v-on:click="tagSelect(tag)">
              {{ tag }}
            </li>
          </ul>
        </div>
      </article>
    </li>
  </ul>
</div>
</template>

<script>
export default {
  props: {
    resources: {
      type: Array,
      default: function () {
        return [];
      },
    },
    tags: {
      type: Object,
      required: false,
      default: function () {
        return {};
      },
    },
    totalResults: {
      type: Number,
      required: true,
    },
    currentPage: {
      type: Number,
    },
    resultsPerPage: {
      type: Number,
    },
    isFilterable: {
      type: Boolean,
      default: false,
    },
    isLoading: {
      type: Boolean,
      default: true,
    },
  },
  watch: {
    tags: function (val) {
      this.tags = val;
    },
  },
  computed: {
    firstResultIndex: function () {
      if (this.resources.length > 0) {
        return ((this.currentPage - 1) * this.resultsPerPage) + 1;
      }

      return 0;
    },
    lastResultIndex: function () {
      let lastIndex = (this.firstResultIndex + this.resources.length) - 1;

      // Return a minimum of 0.
      return Math.max(lastIndex, 0);
    },
  },
  methods: {
    tagSelect: function (tag, event) {
      this.$emit('select-filter-tag', tag);
    },
    tagDeselect: function (tag, event) {
      this.$emit('deselect-filter-tag', tag);
    },
    hasTags: function (resource) {
      if (Array.isArray(resource.tags)) {
        return resource.tags.length > 0;
      } else {
        return false;
      }
    },
    viewAll: function () {
      this.$emit('view-all');
    },
    trackResource: function (url, event) {
      this.$ga.query('send', 'event', 'resources', 'click', url, {
        transport: 'beacon',
      });
    },
  },
};
</script>
