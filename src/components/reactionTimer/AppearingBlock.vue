<script>
export default {
  props: {
    delay: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      showBlock: false,
      timer: null,
      reactionTime: 0,
    };
  },
  mounted() {
    setTimeout(() => {
      this.showBlock = true;
      this.startTimer();
    }, this.delay);
  },
  methods: {
    startTimer() {
      this.timer = setInterval(() => {
        this.reactionTime += 10;
      }, 10);
    },
    stopTimer() {
      clearInterval(this.timer);
      this.$emit('end', this.reactionTime);
    },
  },
};
</script>

<template>
  <div
    v-if="showBlock"
    class="block"
    @click="stopTimer"
  >
    Click me
  </div>
</template>