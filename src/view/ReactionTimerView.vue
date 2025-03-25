<script>
import AppearingBlock from '../components/AppearingBlock.vue';
import BlockResults from '../components/BlockResults.vue';
export default {
  components: { AppearingBlock,
    BlockResults },
  data() {
    return {
      isPlaying: false,
      delay: null,
      score: null,
      showResults: false,
      buttonText: 'Start the game',
    };
  },
  methods: {
    start() {
      this.delay = 2000 + Math.random() * 3000;
      this.isPlaying = true;
      this.showResults = false;
      this.buttonText = 'wait for it...';
    },
    endGame(reactionTime) {
      this.score = reactionTime;
      this.isPlaying = false;
      this.showResults = true;
      this.buttonText = 'Start new game';
    },
  },
};
</script>

<template>
  <div>
    <h1>Reaction Timer</h1>
    <button
      :disabled="isPlaying"
      @click="start"
    >
      {{ buttonText }}
    </button>
    <AppearingBlock
      v-if="isPlaying"
      :delay="delay"
      @end="endGame"
    />
    <BlockResults
      v-if="showResults"
      :score="score"
    />
  </div>
</template>