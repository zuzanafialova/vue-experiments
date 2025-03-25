<script>
export default {
  data() {
    return {
      email: '',
      password: '',
      role: 'none',
      terms: false,
      names: [],
    };
  },
};
</script>

<template>
  <form action="">
    <label>E-mail:</label>
    <input
      v-model="email"
      type="email"
      required
    >
    <label>Password:</label>
    <input
      v-model="password"
      type="password"
      required
    >
    <label>Role:</label>
    <select v-model="role">
      <option value="none">
        --
      </option>
      <option value="developer">
        Web developer
      </option>
      <option value="designer">
        Web designer
      </option>
    </select>
    
    <div>
      <input
        v-model="names"
        type="checkbox"
        value="Peter"
      >
      <label>Peter</label>
    </div>
    <div>
      <input
        v-model="names"
        type="checkbox"
        value="Paul"
      >
      <label>Paul</label>
    </div>
    <div>
      <input
        v-model="names"
        type="checkbox"
        value="Mary"
      >
      <label>Mary</label>
    </div>
    
    <div class="terms">
      <input
        v-model="terms"
        type="checkbox"
        required
      >
      <label>Accept Terms and Conditions</label>
    </div>
  </form>
  <p>Email: {{ email }}</p>
  <p>Password: {{ password }}</p>
  <p>Role: {{ role }}</p>
  <p>Terms accepted: {{ terms }}</p>
</template>