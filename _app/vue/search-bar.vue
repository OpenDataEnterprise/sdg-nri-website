<template>
<div class="search-bar">
  <form class="search-bar-controls" role="search" v-on:submit.prevent="submitSearch">
    <input type="text" class="search-field" placeholder="Enter Search" v-model="searchQuery">
    <input type="text" style="display: none;">
    <button type="button" class="search-submit" v-on:click.prevent="submitSearch">
      <span><i class="fa fa-search" aria-hidden="true"></i></i></span>
      <span>SEARCH</span>
    </button>
  </form>
</div>
</template>

<script>
export default {
  data: function () {
    return {
      searchQuery: '',
    };
  },
  methods: {
    submitSearch: function () {
      this.$emit('submitSearch', this.searchQuery);
    }
  },
  watch: {
    searchQuery: function () {
      console.log(this.searchQuery);
    }
  }
};
</script>