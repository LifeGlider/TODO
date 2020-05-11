import axios from 'axios'
import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    tasks: null
  },

  getters: {
    TASKS: state => {
      return state.tasks;
    },
  },

  mutations: {
    SET_TASKS: (state, payload) => {
      state.tasks = payload;
    },

    ADD_TASK: (state, payload) => {
      state.tasks.unshift(payload)
    },

    EDIT_TASK: (state, payload) => {
      state.tasks = state.tasks.filter(task => task.id !== payload.id);
      state.tasks.unshift(payload)
    },

    REMOVE_TASK: (state, payload) => {
      state.tasks = state.tasks.filter(task => task.id !== payload.id);
    }
  },

  actions: {
    GET_TASKS: async (context, payload) => {
      let {data} = await axios.get('/tasks');
      context.commit('SET_TASKS', data);
    },

    SORT_TASKS: async (context, payload) => {
      let {data} = await axios.get(`/tasks?sort_type=${payload.sort_type}&sort_direction=${payload.sort_direction}`);
      context.commit('SET_TASKS', data);
    },

    SAVE_TASK: async (context, payload) => {
      let {data} = await axios.post('/tasks/',
      { important: payload.important, todo: payload.todo });
      context.commit('ADD_TASK', data);
    },

    UPDATE_TASK: async (context, payload) => {
      let {data} = await axios.patch(`/tasks/${payload.id}`, 
      { done: payload.done, todo: payload.todo, important: payload.important })
      context.commit('EDIT_TASK', data)      
    },

    DELETE_TASK: async (context, payload) => {
      let {data} = await axios.delete(`/tasks/${payload.id}`)
      context.commit('REMOVE_TASK', data)
    }
  },
})



/*axios.get('http://localhost:3000/')
  .then(function (response) {
  console.log(response);
  })
  .catch(function (error) {
  console.log(error);
})*/
