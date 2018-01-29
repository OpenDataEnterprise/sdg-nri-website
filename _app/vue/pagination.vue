<template>
<div class="pagination" v-if="lastPage > 1">
  <ul>
    <li v-if="currentPage > 1">
      <a href="#" @click.prevent="pageChanged(1)" aria-label="Back"><span aria-hidden="true">&laquo;</span></a>
    </li>
    <li v-if="currentPage > 1">
      <a href="#" @click.prevent="pageChanged(currentPage - 1)" aria-label="Previous"><span aria-hidden="true">Previous</span></a>
    </li>
    <li v-for="n in paginationRange">
      <a :class="activePage(n)" href="#" @click.prevent="pageChanged(n)">{{ n }}</a>
    </li>
    <li v-if="currentPage < lastPage">
      <a href="#" @click.prevent="pageChanged(currentPage + 1)" aria-label="Next"><span aria-hidden="true">Next</span></a>
    </li>
    <li v-if="currentPage < lastPage">
      <a href="#" @click.prevent="pageChanged(lastPage)" aria-label="Forward"><span aria-hidden="true">&raquo;</span></a>
    </li>
  </ul>
</div>
</template>

<script>
export default {
  props: {
    currentPage: {
      type: Number,
      required: true,
    },
    itemsPerPage: Number,
    totalItems: Number,
    visiblePages: {
      type: Number,
      default: 5,
      coerce: (val) => parseInt(val),
    }
  },
  computed: {
    lastPage () {
      return this.totalItems % this.itemsPerPage === 0
        ? this.totalItems / this.itemsPerPage
        : Math.floor(this.totalItems / this.itemsPerPage) + 1;
    },
    paginationRange () {
      let start =
        this.currentPage - this.visiblePages / 2 <= 0
        ? 1 : this.currentPage + this.visiblePages / 2 > this.lastPage
        ? Math.max(this.lastPage - this.visiblePages + 1, 1)
        : Math.ceil(this.currentPage - this.visiblePages / 2);

      let range = [];

      for (let i = 0; i < this.visiblePages && i < this.lastPage; i++) {
        range.push(start + i);
      }

      return range;
    }
  },
  methods: {
    activePage (pageNumber) {
      return this.currentPage === pageNumber ? 'active' : '';
    },
    pageChanged (pageNumber) {
      // Set a numerical floor for the page numbers.
      pageNumber = Math.max(pageNumber, 1);

      if (pageNumber !== this.currentPage) {
        this.$emit('page-changed', pageNumber);
      }
    }
  }
}
</script>