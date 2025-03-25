<script>
import BooksView from './view/BooksView.vue';
import ReactionTimerView from './view/ReactionTimerView.vue';
import WebFormView from './view/WebFormView.vue';


export default {
  components: {
    BooksView,
    ReactionTimerView,
    WebFormView,
  },
  data() {
    return {
      showBooksPage: false,
      showReactionPage: false,
      showWebForm: true,
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
  <div v-if="showWebForm">
    <WebFormView />
  </div>
</template>

<style lang="scss" scoped>
</style>
