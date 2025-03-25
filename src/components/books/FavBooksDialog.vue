<script setup>
import DialogComponent from '../common/DialogComponent.vue';
import { computed, toRefs } from 'vue';

const props = defineProps({
  books: {
    type: Array,
    required: true,
  },
});

const { books } = toRefs(props);

const filteredBooks = computed(() => {
  return books.value.filter((book) => book.isFav);
});

</script>

<template>
  <DialogComponent
    theme="books"
  >
    <template #activator="{ toggle }">
      <button @click="toggle">
        Open fav books
      </button>
    </template>
    <template #default>
      <h2>Fav books</h2>
      <ul>
        <li
          v-for="(book,i) in filteredBooks"
          :key="i"
          :class="{ fav: book.isFav}"
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
    </template>
  </DialogComponent>
</template>
