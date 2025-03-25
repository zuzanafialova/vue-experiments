<script>
export default {
  props: {
    modelValue: {
      type: Boolean,
      required: false,
      default: () => false,
    },
    theme: {
      type: String,
      required: false,
      default: () => 'sale',
    },
  },
  emits: [ 'update:modelValue' ],
  data() {
    return {
      dialog: false,
    };
  },
  watch: {
    modelValue(v) {
      this.dialog = v;
    },
  },
  methods: {
    closeDialog() {
      this.dialog = false;
      this.$emit('update:modelValue', this.dialog);
    },
    toggle() {
      this.dialog = !this.dialog;
      this.$emit('update:modelValue', this.dialog);
    },
  },
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
