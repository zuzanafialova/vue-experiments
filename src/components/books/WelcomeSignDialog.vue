<script setup>
import DialogComponent from '../common/DialogComponent.vue';
import { ref } from 'vue';

const felcomeDialog = ref(true);
const header = 'Welcome to the dark side!';
const text = 'Lorem ipsum dolor sit amet.';

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
