<script>
export default {
  data() {
    return {
      showBooks: true,
      title: 'Anna Karenina',
      author: 'Lev Nikolajevic Tolstoj',
      age: 82,
      x: 0,
      y: 0,
    };
  },
  methods: {
    changeTitle(author) {
      this.title = 'War and Peace';
      this.author = author;
    },
    toggleShowBook() {
      this.showBooks = !this.showBooks;
    },
    handleEvent(e, data) {
      console.log(e, e.type);
      if (data) {
        console.log(data);
      }
    },
    handleMouseMove(e) {
      this.x = e.offsetX;
      this.y = e.offsetY;
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
    <br>
    <!--    mouse events-->
    <div
      class="box"
      @mouseover="handleEvent($event, 5)"
    >
      mouse over
    </div>
    <div
      class="box"
      @mouseleave="handleEvent"
    >
      mouse leave
    </div>
    <div
      class="box"
      @dblclick="handleEvent"
    >
      double click
    </div>
    <div
      class="box"
      @mousemove="handleMouseMove"
    >
      position: {{ x }}, {{ y }}
    </div>
  </div>
</template>

<style lang="scss" scoped>
.box {
  padding: 100px 0;
  width: 400px;
  text-align: center;
  background: #ddd;
  margin: 20px;
  display: inline-block;
}
</style>
