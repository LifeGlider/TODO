<template>
  <div>
    <Header /><br>
    <center><p>
      <button class="btn">Sort by Alphabet</button>
      <button class="btn"> Sort by Date</button>
    </p></center><br>
    <AddTask /><br>
    <div v-for="task in tasks" :key="task.id">
      <Task :task="task" v-on:edit-task="$emit('edit-task', false)"/>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';
  import Header from './layout/Header';
  import AddTask from './AddTask';
  import Task from './Task.vue';

  export default {
    name: "Tasks",
    components: { Header, AddTask, Task },
    created() {
      this.$store.dispatch('GET_TASKS');
    },
    computed: {
      tasks(){
        return this.$store.getters.TASKS;
      }
    }
  }
</script>

<style>
  * {
    box-sizing: border-box;
    margin: 0px;
    padding: 0px;
  }

  body {
    font-family:Arial, Helvetica, sans-serif;
    line-height: 1.4;
  }

  .btn {
    display: inline-block;
    border: none;
    background: #555;
    color: #fff;
    padding: 7px 20px;
    cursor: pointer;
  }

  .btn:hover {
    background: #666;
  }
</style>
