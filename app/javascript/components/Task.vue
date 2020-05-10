<template>
  <div class="task-item" v-bind:class="{'is-important': task.important, 'is-done': task.done}">
    <table>
      <tr>
        <td><input type="checkbox" v-on:change="taskDone"></td>
        <td>{{task.todo}}</td>
        <td align="right"><button @click="deleteItem">Delete</button></td>
      </tr>
    </table>
  </div>
</template>

<script>
  import axios from 'axios-on-rails'

  export default {
    props: ["task"],
    methods: {
      taskDone() {
        
      },
      deleteItem() {

      }
    }
  }
</script>

<style scoped>
  input[type="checkbox"] {
    flex: 1;
    padding: 10px;
    margin: auto;
  }

  .task-item {
    background: white;
    padding: 10px;
    border-bottom: 1px #ccc dotted;
  }

  .is-done {
    text-decoration: line-through;
  }

  .is-important {
    background-color: tomato;
  }
</style>
