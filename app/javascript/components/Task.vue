<template>
  <div class="task-item" v-bind:class="{'is-important': task.important}">
    <p v-bind:class="{'is-done': task.done}">
      <input type="checkbox" v-model="task.done" :id="task.id" v-on:change="taskDone">
      {{task.todo}}
      <label class="date">{{task.created_at.substring(0, 10)}}</label>
      <button class="edit" v-on:click="visible=!visible">Edit</button>
      <button class="del" @click="deleteTask">Delete</button>
    </p><br>
    <form class="edit-task" @submit="editTask" v-show="visible">
      <input type="checkbox" v-model="task.done" name="done">
      <label class="lbl" for="done">Done</label>
      <input type="checkbox" v-model="task.important" name="important">
      <label class="lbl" for="important">Important</label>
      <input type="text" v-model="task.todo" name="todo" placeholder="Edit here...">
      <input type="submit" value="Submit" class="btn" @click="hideEdit">
    </form>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    name: "Task",

    props: ["task"],

    data() {
      return {
        visible: false
      }
    },

    methods: {
      showEdit() {
        this.visible = true
      },

      hideEdit() {
        this.visible = false
      },

      taskDone(e) {
        e.preventDefault();
        this.$store.dispatch('UPDATE_TASK', {
          id: this.task.id,
          done: this.task.done
        });
      },

      editTask(e) {
        e.preventDefault();
        let visible = false;
        this.$store.dispatch('UPDATE_TASK', {
          id: this.task.id,
          done: this.task.done,
          important: this.task.important,
          todo: this.task.todo
        });
        return visible;
      },

      deleteTask(e) {
        e.preventDefault();
        this.$store.dispatch('DELETE_TASK', { id: this.task.id });
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
    flex: 0.5;
    padding: 10px;
  }

  input[type="checkbox"] {
    border: 1px #333;
    margin: auto;
  }

  .task-item {
    background: white;
    padding: 10px;
    border-bottom: 1px #ccc dotted;
  }

  .edit-task {
    background: white;
    padding: 10px;
    border-bottom: 1px #ccc dotted;
  }

  input[type="text"] {
    flex: 10;
    padding: 5px;
  }

  .is-done {
    text-decoration: line-through;
  }

  .is-important {
    background-color: tomato;
  }

  .date {
    border: none;
    padding: 5px 9px;
    margin: auto;
    float: right;
  }

  .edit {
    background: #b9b026;
    color: #fff;
    border: none;
    padding: 5px 9px;
    cursor: pointer;
    float: right;
  }

  .del {
    background: #ff0000;
    color: #fff;
    border: none;
    padding: 5px 9px;
    cursor: pointer;
    float: right;
  }
</style>
