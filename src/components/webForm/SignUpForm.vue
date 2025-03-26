<script>
export default {
  data() {
    return {
      email: '',
      password: '',
      role: 'none',
      terms: false,
      names: [],
      tempSkill: '',
      skills: [],
      passwordError: '',
      submited: false,
    };
  },
  methods: {
    adSkill(e) {
      if (e.key === ' ' && this.tempSkill) {
        if (!this.skills.includes(this.tempSkill)) {
          this.skills.push(this.tempSkill);
        }
        this.tempSkill = '';
      }
    },
    removeSkill(skill) {
      this.skills.splice(this.skills.indexOf(skill), 1);
    },
    handleSubmit() {
      // validate password
      this.passwordError = this.password.length > 5 ?
        '' : 'Invalid password, must be at least 6 characters long.';

      if (!this.passwordError) {
        console.log('email: ', this.email);
        console.log('password: ', this.password);
        console.log('role: ', this.role);
        console.log('skills: ', this.skills);
        console.log('terms accepted: ', this.terms);
        this.submited = true;
      }
    },
  },
};
</script>

<template>
  <form @submit.prevent="handleSubmit">
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
    <div
      v-if="passwordError"
      class="error"
    >
      {{ passwordError }}
    </div>

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

    <label>Skills:</label>
    <input
      v-model="tempSkill"
      type="text"
      @keyup="adSkill"
    >
    <div
      v-for="skill in skills"
      :key="skill"
      class="pill"
      @click="removeSkill(skill)"
    >
      {{ skill }}
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 24 24"
        style="width: 20px"
      ><title>close</title>
        <path
          d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"
        />
      </svg>
    </div>
    <br>

    <label>Who do you like?</label>
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

    <label>Please accept our terms and conditions. We can't do anything about them. They just were, are and will
      be.</label>
    <div class="terms">
      <input
        v-model="terms"
        type="checkbox"
        required
      >
      <label>Accept Terms and Conditions</label>
    </div>
    
    <button class="submit">
      Submit
    </button>
    <br>
    <label v-if="submited">Thanks for your submition</label>
  </form>
</template>