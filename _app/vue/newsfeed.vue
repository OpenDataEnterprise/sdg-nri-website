<template>
<div>
  <div class="results-counter">Showing {{ newsfeed.length }} of {{ totalResults }} news items</div>
  <ul class="news-tags" v-if="Object.keys(filterTags).length > 0">
    <li
      class="subject-tag"
      v-for="(item, tag) in filterTags"
      @click="tagDeselect(tag)">
      <span class="icon-close" aria-hidden="true"></span>
      <span>{{ tag }}</span>
    </li>
  </ul>
  <ul class="news-feed">
    <li class="news-list-item" v-for="(news, index) in newsfeed" tabindex="0">
      <article class="news-card">
        <div class="news-date">{{ news.created_at }}</div>
        <h1 class="news-header">
          <a :href="(( news.url ))" target="_blank">{{ news.title }}</a>
        </h1>
        <div class="news-author">{{ news.organization }}</div>
        <div class="news-description">{{ news.description }}</div>
        <div class="resource-tags" v-if="news.tags.length > 0">
          <ul class="resource-tags-list">
            <li class="subject-tag"
              v-for="tag in news.tags"
              @click="tagSelect(tag)">
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
    newsfeed: Array,
    filterTags: Object,
    totalResults: Number,
  },
  methods: {
    tagSelect: function (tag, event) {
      console.log('Selected ' + tag);
      this.$emit('select-filter-tag', tag);
    },
    tagDeselect: function (tag, event) {
      console.log('Deselected ' + tag);
      this.$emit('deselect-filter-tag', tag);
    }
  },
};
</script>