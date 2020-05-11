<template>
  <div class="edit-task">
    <form @submit="editTask">
      <input type="checkbox" v-model="task.done" name="done">
      <input type="checkbox" v-model="task.important" name="important">
      <input type="text" v-model="task.todo" name="todo" placeholder="Edit here...">
      <input type="submit" value="Submit" class="btn">
    </form>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    name: "EditTask",
    props: ["task"],
    data() {
      return {
        visible: false
      }
    },
    methods: {
      editTask(e) {
        e.preventDefault();
        let visible = false;
        this.$store.dispatch('UPDATE_TASK', 
        {id: this.task.id, done: this.task.done, important: this.task.important, todo: this.task.todo});
        return visible;
      }
    }
  }
</script>

<style scoped>
    form {
    display: flex;
  }

  .edit-task {
    background: white;
    padding: 10px;
    border-bottom: 1px #ccc dotted;
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
