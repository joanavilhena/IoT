require('./bootstrap');

window.Vue = require('vue');
import store from './store';

import BootstrapVue from 'bootstrap-vue';

Vue.use(BootstrapVue);
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

import VueRouter from 'vue-router';
Vue.use(VueRouter);


import Vue from 'vue';


const test = Vue.component('test', require('./components/test.vue').default);
const navigation = Vue.component('navigation', require('./components/navigationbar.vue').default);
const login = Vue.component('login', require('./components/auth/login.vue').default);
const sensors = Vue.component('sensors', require('./components/sensors/list-sensors.vue').default);
const editsensor = Vue.component('edit-sensor', require('./components/sensors/edit-sensor.vue').default);
const routes = [
    {path:'/', redirect:'/home'},
    {path:'/home', component:login},
    {path:'/sensors', component:sensors},
    {path:'/edit-sensor/:id', component:editsensor},
    

];
const router = new VueRouter({
    
    
    routes: routes 
  });



const app = new Vue({
    el: '#app',
    store,
    router:router
    
    
});


