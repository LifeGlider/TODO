<template>
  <div>
    <form @submit="addTask">
      <input type="checkbox" v-model="important" name="important">
      <label class="lbl" for="important">Important</label>
      <input type="text" v-model="todo" name="todo" placeholder="Add Task...">
      <input type="submit" value="Submit" class="btn">
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: "AddTask",
  data() {
    return {
      important: false,
      todo: ''
    }
  },
  methods: {
    addTask(e) {
      e.preventDefault();
      this.$store.dispatch('SAVE_TASK', {important: this.important, todo: this.todo});
      e.target.reset();
    }
  }
}
</script>

<style scoped>
  form {
    display: flex;
  }

  .lbl {
    margin: auto;
    flex: 1;
    padding: 5px;
  }

  input[type="checkbox"] {
    border: 1px #333;
    margin: auto;
    padding: 5px;
    flex: 0.5;
  }

  input[type="text"] {
    flex: 10;
    padding: 5px;
  }

  input[type="submit"] {
    flex: 2;
  }
</style>
