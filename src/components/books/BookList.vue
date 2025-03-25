<script setup>
import { toRefs } from 'vue';

const emit = defineEmits([ 'toggle-fav' ]);

const props = defineProps({
  books: {
    type: Array,
    required: true,
  },
  showBooks: {
    type: Boolean,
    required: true,
  },
});

const { books, showBooks } = toRefs(props);

</script>

<template>
  <div>
    <div v-if="showBooks">
      <ul>
        <li
          v-for="(book,i) in books"
          :key="i"
          :class="{ fav: book.isFav}"
          @click="emit('toggle-fav', book)"
        >
          <img
            :src="book.img"
            :alt="book.title"
            style="max-width: 4rem"
          >
          <h3>{{ book.title }}</h3>
          <p>{{ book.author }}</p>
        </li>
      </ul>
    </div>
  </div>
</template>

<style lang="scss" scoped>
</style>
