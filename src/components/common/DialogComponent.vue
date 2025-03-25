<script setup>

import { ref, toRefs, watch } from 'vue';


const modelValue = defineModel({
  type: Boolean,
  default: false,
});

const dialog = ref(modelValue.value);

const props = defineProps({
  theme: {
    type: String,
    required: false,
    default: 'sale',
  },
});

const { theme } = toRefs(props);

watch(modelValue, (v) => {
  dialog.value = v;
});

const closeDialog = () => {
  dialog.value = false;
  modelValue.value = false;
};

const toggle = () => {
  dialog.value = !dialog.value;
  modelValue.value = dialog.value;
};
</script>

<template>
  <div>
    <slot
      name="activator"
      :toggle="toggle"
      :close="closeDialog"
    >
      <button @click="toggle">
        Open default dialog
      </button>
    </slot>
  </div>
  <div
    v-if="dialog"
    class="backdrop"
    @click.self="closeDialog"
  >
    <div
      class="modal"
      :class="[ theme ]"
    >
      <slot>
        show empty dialog
      </slot>
    </div>
  </div>
</template>
