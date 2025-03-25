<script>
export default {
  props: {
    score: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      rank: null,
    };
  },
  mounted() {
    if (this.score < 280) {
      this.rank = 'WTF, how did you do that?!';
    } else if (this.score < 400) {
      this.rank = 'Quite the ordinary. Try again!';
    } else {
      this.rank = 'Are you a snail or something?!';
    }
  },
};
</script>

<template>
  <div>
    <p>Reaction time: {{ score }} ms</p>
    <p class="rank">
      {{ rank }}
    </p>
  </div>
</template>