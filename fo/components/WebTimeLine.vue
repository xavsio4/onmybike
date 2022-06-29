<template>
  <ul ref="timeline" class="timeline">
    <slot></slot>
  </ul>
</template>

<script>
  export default {
    name: "WebTimeLine",

    props: {
      timelineTheme: {
        type: String,
        default: "#000",
      },
      timelineBg: {
        type: String,
        default: "#fff",
      },
    },

    mounted() {
      const timeline = this.$refs.timeline;
      timeline.style.setProperty("--timelineTheme", this.timelineTheme);
      timeline.style.setProperty("--timelineBg", this.timelineBg);
    },
  };
</script>

<style>
  .timeline {
    padding: 0;
    position: relative;
    list-style: none;
    -webkit-font-smoothing: antialiased;
    margin: 10px 20px;
  }

  .timeline:after {
    position: absolute;
    content: "";
    left: -4px;
    top: 0;
    width: 6px;
    height: 100%;
    background-color: var(--timelineTheme);
  }

  .timeline-item {
    position: relative;
    margin: 1.5em 0 0 28px;
    padding-bottom: 1.5em;
    border-bottom: 1px dotted var(--timelineTheme);
  }
  .timeline-item:last-child {
    border-bottom: none;
  }
  .timeline-circle {
    position: absolute;
    top: 0.28em;
    left: -34px;
    width: 10px;
    height: 10px;
    /* border-radius: 50%; */
    border: 1px solid var(--timelineTheme);
    background-color: var(--timelineTheme);
    z-index: 1;
    /* box-sizing: content-box; */
  }

  .timeline-circle.hollow {
    background-color: var(--timelineBg);
  }

  .timeline-title {
    position: relative;
    display: inline-block;
    cursor: crosshair;
    margin: -0.15em 0 15px 28px;
  }
  .timeline-title:not(:first-child) {
    margin-top: 28px;
  }
  .timeline-title-circle {
    left: -36px;
    top: 0.15em;
    width: 16px;
    height: 16px;
  }
  .timeline-others {
    width: 40px;
    height: auto;
    top: 0.2em;
    left: -48px;
    line-height: 1;
    padding: 2px 0;
    text-align: center;
    border: none;
    background-color: var(--timelineBg);
  }
</style>
