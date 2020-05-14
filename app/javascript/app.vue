<template>
  <div id="app">
  </div>
</template>

<script>
  import Tasks from './components/Tasks.vue'

  export default {
    name: "app",

    components: { Tasks },

    data() {
      return {
        tasks: tasks
      }
    }
  }  
</script>
