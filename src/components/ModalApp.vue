<script>
export default {
  props: {
    header: {
      type: String,
      required: true,
    },
    text: {
      type: String,
      required: true,
    },
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
      :class="{ sale: theme === 'sale'}"
    >
      <h1>{{ header }}</h1>
      <p>{{ text }}</p>
    </div>
  </div>
</template>