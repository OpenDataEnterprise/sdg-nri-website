<template>
<div class="events-feed-component" v-if="isLoading">
  <div class="loader">Loading...</div>
</div>
<div class="events-feed-component" v-else>
  <div v-if="events.length === 0">
    <div class="no-results-message">No events found.</div>
  </div>
  <ul v-else>
    <li class="event" v-for="event in filteredEvents">
      <article class="event-card">
        <div class="event-heading">
          <a v-bind:href="event.url" target="_blank">{{ event.title }}</a>
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
          <li class="event-location" v-for="(location, index) in event.assigned_locations">
            <span v-if="index < event.assigned_locations.length - 1">
              {{ location }},
            </span>
            <span v-else>
              {{ location }}
            </span>
          </li>
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
</div>
</template>

<script>
export default {
  props: {
    events: {
      type: Array,
      required: true,
    },
    isLoading: {
      type: Boolean,
      default: true,
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
