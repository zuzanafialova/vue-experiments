<script>
import Books from '../components/BooksArticle.vue';
import Modal from '../components/ModalApp.vue';
import BookModal from '../components/ModalFavouriteBooks.vue';
export default {
  components: {
    Modal,
    Books,
    BookModal,
  },
  data() {
    return {
      title: 'Modal app',
      header: 'Welcome to the dark side!',
      text: 'Lorem ipsum dolor sit amet.',
      showModal: true,
      showFavourite: false,
      showBooks: true,
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
  computed: {
    filteredBooks() {
      return this.books.filter((book) => book.isFav);
    },
  },
  methods: {
    toggleModal() {
      this.showModal = !this.showModal;
    },
    toggleFavourite() {
      this.showFavourite = !this.showFavourite;
    },
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
    <Books>
      <div v-if="showBooks">
        <ul>
          <li
            v-for="(book,i) in books"
            :key="i"
            :class="{ fav: book.isFav}"
            @click="toggleIsFav(book)"
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
    </Books>
    <teleport
      v-if="showModal"
      to=".modals"
    >
      <Modal
        :header="header"
        :text="text"
        theme="sale"
        @close="toggleModal"
      />
    </teleport>
    <teleport
      v-if="showFavourite"
      to=".modals"
    >
      <BookModal
        theme="books"
        @close="toggleFavourite"
      >
        <template #title>
          <h2>Favourite books</h2>
        </template>
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
      </BookModal>
    </teleport>
    <button @click="toggleModal">
      Open welcome sign
    </button>
    <button @click="toggleFavourite">
      Show favourite books
    </button>
  </div>
</template>

<style lang="scss" scoped>
</style>
