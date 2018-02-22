<template>
<section class="events-section">
  <h2 class="events-heading">Events</h2>
  <ul>
    <li class="event" v-for="event in events">
      <article class="event-card">
        <div class="event-heading">
          <a href="{{ event.link }}" target="_blank">(( event.title ))</a>
        </div>
        <div class="event-dates">
          <span class="event-start">
            <span class="icon-calendar" aria-hidden="true"></span>
            <span>(( event.start_time ))</span>
          </span>
          <span class="event-end" v-if="event.end_time"> - (( event.end_time ))</span>
        </div>
        <p class="event-description">(( event.description ))</p>
        <span class="icon-location" aria-hidden="true"></span>
        <ul class="event-locations">
          <li class="event-location" v-for="location in event.locations">(( location ))</li>
        </ul>
      </article>
    </li>
  </ul>
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
  data: {
    return {
      currentPage: 1,
    }
  },
  computed: {
    items: function(pageNumber) {
      return this.events.filter(function(item) {
        return item.price > 10;
      });
    },
  },
};
</script>