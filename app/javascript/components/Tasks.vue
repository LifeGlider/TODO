<template>
  <div>
    <Header />
    <AddTask />
    <div :key="task.id" v-for="task in tasks">
      <Task :task="task" />
    </div>
  </div>
</template>

<script>
import axios from 'axios-on-rails'
import Header from './layout/Header.vue';
import AddTask from './AddTask.vue';
import Task from './Task.vue';

export default {
  name: "Tasks",
  components: { Header, AddTask, Task },
  props: ['tasks'],
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
