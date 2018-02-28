<template>
<div>
  <div class="results-counter" v-if="isFilterable">Showing {{ resources.length }} of {{ totalResults }} resources</div>
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
  <div v-if="isFilterable !== true && resources.length === 0">
    <div class="no-results-message">There are no resources available for this topic. Please help us by <a href="submit-resource">contributing a resource</a>.</div>
  </div>
  <ul class="resource-list">
    <li class="resource-list-item" v-for="(resource, index) in resources">
      <article class="resource-card">
        <img class="resource-image"
          :src="resource.image_url"
          v-if="resource.image_url">
        <h1 class="resource-title">
          <a :href="(( resource.url ))" target="_blank">{{ resource.title }}</a>
        </h1>
        <span class="resource-organization">{{ resource.organization }}</span>
        <span class="info-divider">|</span>
        <span class="resource-publication-date">{{ resource.date_published }}</span>
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
    isFilterable: {
      type: Boolean,
      default: false,
    }
  },
  watch: {
    tags: function (val) {
      this.tags = val;
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
    }
  },
};
</script>