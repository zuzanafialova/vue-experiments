<script>
import BooksView from './view/BooksView.vue';
import ReactionTimerView from './view/ReactionTimerView.vue';
export default {
  components: {
    BooksView,
    ReactionTimerView,
  },
  data() {
    return {
      showBooksPage: false,
      showReactionPage: true,
    };
  },
};
</script>

<template>
  <div v-if="showBooksPage">
    <BooksView />
  </div>
  <div v-if="showReactionPage">
    <ReactionTimerView />
  </div>
</template>

<style lang="scss" scoped>
</style>
