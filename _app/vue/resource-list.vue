<template>
<ul class="resource-list">
  <li class="resource-list-item" v-for="(resource, index) in resources" tabindex="0">
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
import { store } from 'js/global-store';
import { mapGetters } from 'vuex';

export default {
  computed: {
    resources: function () {
      return this.$store.state.resources;
    }
  }
};
</script>
