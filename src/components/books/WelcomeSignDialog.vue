<script>
import DialogComponent from '../common/DialogComponent.vue';
export default {
  components: {
    DialogComponent,
  },
  data() {
    return {
      felcomeDialog: true,
      header: 'Welcome to the dark side!',
      text: 'Lorem ipsum dolor sit amet.',
    };
  },
};
</script>

<template>
  <DialogComponent
    v-model="felcomeDialog"
    theme="sale"
  >
    <template #activator="{ toggle }">
      <button @click="toggle">
        Open felcome sign
      </button>
    </template>
    <template #default>
      <h1>{{ header }}</h1>
      <p>{{ text }}</p>
    </template>
  </DialogComponent>
</template>
