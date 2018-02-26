<template>
<section class="events-section">
  <h2 class="events-heading">Events</h2>
  <ul>
    <li class="event" v-for="event in filteredEvents">
      <article class="event-card">
        <div class="event-heading">
          <a v-bind:href="event.link" target="_blank">{{ event.title }}</a>
        </div>
        <div class="event-dates">
          <span class="event-start">
            <span class="icon-calendar" aria-hidden="true"></span>
            <span>{{ event.start_time }}</span>
          </span>
          <span class="event-end" v-if="event.end_time"> - {{ event.end_time }}</span>
        </div>
        <p class="event-description">{{ event.description }}</p>
        <span class="icon-location" aria-hidden="true"></span>
        <ul class="event-locations">
          <li class="event-location" v-for="location in event.locations">{{ location }}</li>
        </ul>
      </article>
    </li>
  </ul>
  <button class="more-events-button button"
    v-if="areRemainingEvents"
    v-on:click="currentPage += 1">
    <span class="more-events-button-text">More Events</span>
    <span class="icon-plus-for-buttons"></span>
  </button>
</section>
</template>

<script>
export default {
  props: {
    events: {
      type: Array,
      required: true,
    },
  },
  data: function () {
    return {
      resultsPerPage: 3,
      currentPage: 1,
    };
  },
  computed: {
    // Check whether there are any events that are not shown yet.
    areRemainingEvents: function () {
      const lastIndex = this.currentPage * this.resultsPerPage;

      if (lastIndex >= this.events.length) {
        return false;
      }

      return true;
    },
    filteredEvents: function() {
      // Calculate window end index.
      let end = this.currentPage * this.resultsPerPage;

      // Cap window end index.
      if (end > this.events.length) {
        end = this.events.length;
      }

      const events = this.events.slice(0, end);

      return events;
    },
  },
};
</script>