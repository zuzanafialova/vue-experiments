<script>
export default {
  props: {
    theme: {
      type: String,
      required: true,
    },
  },
  methods: {
    closeModal() {
      this.$emit('close');
    },
  },
};
</script>

<template>
  <div
    class="backdrop"
    @click.self="closeModal"
  >
    <div
      class="modal"
      :class="{ books: theme === 'books'}"
    >
      <slot name="title" />
      <slot>Sorry, you have no favourite books selected.</slot>
    </div>
  </div>
</template>