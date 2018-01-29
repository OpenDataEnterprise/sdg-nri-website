<template>
<ul class="news-feed">
  <span>Showing {{ newsfeed.length }} of {{ totalResults }} news items</span>
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
          <li class="subject-tag" v-for="tag in news.tags">{{ tag }}</li>
        </ul>
      </div>
    </article>
  </li>
</ul>
</template>

<script>
export default {
  props: {
    newsfeed: Array,
    totalResults: Number,
  }
};
</script>
