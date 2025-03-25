<script>
export default {
  data() {
    return {
      showBooks: true,
      title: 'Anna Karenina',
      author: 'Lev Nikolajevic Tolstoj',
      age: 82,
    }
  },
  methods: {
    changeTitle(author) {
      this.title = 'War and Peace';
      this.author = author;
    },
    toggleShowBook() {
      this.showBooks = !this.showBooks;
    },
  },
};
</script>

<template>
  <div>
    <div v-if="showBooks">
      <p>{{ title }} - {{ author }} - {{ age }}</p>
    </div>

    <button @click="age++">
      Increase age
    </button>
    <br>
    <br>
    <button @click="age--">
      Decrease age
    </button>
    <br>
    <br>
    <button @click="changeTitle('autorem je taky Lev')">
      Change book
    </button>
    <br>
    <br>
    <button @click="toggleShowBook">
      <span v-if="showBooks">Hide Books</span>
      <span v-else>Show Books</span>
    </button>
    <div v-show="showBooks">
      currently showing books
    </div>
  </div>
</template>
