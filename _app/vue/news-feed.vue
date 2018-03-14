<template>
<div class="news-feed-component" v-if="isLoading">
  <div class="loader">Loading...</div>
</div>
<div class="news-feed-component" v-else>
  <div class="results-counter">Showing {{ newsfeed.length }} of {{ totalResults }} news items</div>
  <div v-if="newsfeed.length === 0">
    <div class="no-results-message">No news items found.</div>
  </div>
  <ul class="news-feed" v-else>
    <li class="news-list-item" v-for="(news, index) in newsfeed">
      <article class="news-card">
        <h1 class="news-heading">
          <a :href="(( news.url ))" target="_blank">{{ news.title }}</a>
        </h1>
        <span class="news-date">{{ news.created_at }}</span>
        <span class="info-divider">|</span>
        <span class="news-author">{{ news.organization }}</span>
        <div class="news-description">{{ news.description }}</div>
      </article>
    </li>
  </ul>
</div>
</template>

<script>
export default {
  props: {
    newsfeed: {
      type: Array,
    },
    totalResults: {
      type: Number,
      required: true,
    },
    isLoading: {
      type: Boolean,
      default: true,
    },
  },
};
</script>