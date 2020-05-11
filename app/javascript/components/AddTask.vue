<template>
  <div>
    <form @submit="addTask">
      <input type="checkbox" v-model="important" name="important">
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
    }
  }
}
</script>

<style scoped>
  form {
    display: flex;
  }

  input[type="checkbox"] {
    flex: 1;
    border: 1px #333;
    margin: auto;
  }

  input[type="text"] {
    flex: 10;
    padding: 5px;
  }

  input[type="submit"] {
    flex: 2;
  }
</style>
