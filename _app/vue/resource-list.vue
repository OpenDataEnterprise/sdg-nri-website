<template>
<div>
  <div class="results-counter">Showing {{ resources.length }} of {{ totalResults }} resources</div>
  <ul class="resource-tags" v-if="Object.keys(tags).length > 0">
    <li class="subject-tag"
      v-for="(item, tag) in tags"
      v-on:click="tagDeselect(tag)">
      <span class="icon-close" aria-hidden="true"></span>
      <span>{{ tag }}</span>
    </li>
  </ul>
  <div v-if="resources.length === 0">
    <div class="no-results-heading">No results.</div>
    <div class="no-results-message">Try narrowing your search or view all resources.</div>
  </div>
  <ul class="resource-list">
    <li class="resource-list-item" v-for="(resource, index) in resources" tabindex="0">
      <article class="resource-card">
        <img class="resource-image"
          :src="resource.image_url"
          v-if="resource.image_url">
        <h1 class="resource-title">
          <a :href="(( resource.url ))" target="_blank">{{ resource.title }}</a>
        </h1>
        <span class="resource-organization">{{ resource.organization }}</span>
        <span class="resource-publication-date">| {{ resource.date_published }}</span>
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
  },
};
</script>