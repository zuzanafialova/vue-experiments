<script>
import DialogComponent from '../common/DialogComponent.vue';
export default {
  components: {
    DialogComponent,
  },
  props: {
    books: {
      type: Array,
      required: true,
    },
  },
  computed: {
    filteredBooks() {
      return this.books.filter((book) => book.isFav);
    },
  },
};
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
