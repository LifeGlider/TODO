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
export default {
  name: "AddTask",
  data() {
    return {
      todo: ''
    }
  },
  methods: {
    addTask() {
      const newTask = {
        todo: this.todo
      }
      this.$emit('add-task', newTask);
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
