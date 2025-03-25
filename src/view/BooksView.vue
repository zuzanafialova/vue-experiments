<script>
import BookList from '../components/books/BookList.vue';
import WelcomeSignDialog from '../components/books/WelcomeSignDialog.vue';
import FavBooksDialog from '../components/books/FavBooksDialog.vue';
export default {
  components: {
    FavBooksDialog,
    WelcomeSignDialog,
    BookList,
  },
  data() {
    return {
      title: 'Modal app',
      showModal: false,
      showFavourite: false,
      showBooks: true,
      testDialog: false,
      books: [
        { title: 'Lord of the Rings: The Fellowship of the ring',
          author: 'J. R. R. Tolkien',
          img: 'src/assets/img/circle-outline.svg',
          isFav: true },
        { title: 'Harry Potter and the philosopher\'s stone',
          author: 'J. K. Rowling',
          img: 'src/assets/img/lightning-bolt-outline.svg',
          isFav: true },
        { title: 'Bible',
          author: 'hromada divných týpků',
          img: 'src/assets/img/pentagram.svg',
          isFav: false  },
      ],
    };
  },
  methods: {
    toggleShowBook() {
      this.showBooks = !this.showBooks;
    },
    toggleIsFav(book) {
      book.isFav = !book.isFav;
    },
  },
};
</script>

<template>
  <div>
    <button @click="toggleShowBook">
      <span v-if="showBooks">Hide Books</span>
      <span v-else>Show Books</span>
    </button>
    <BookList
      :books="books"
      :show-books="showBooks"
      @toggle-fav="(b) => toggleIsFav(b)"
    />

    <WelcomeSignDialog />

    <FavBooksDialog :books="books" />
  </div>
</template>

<style lang="scss" scoped>
</style>
