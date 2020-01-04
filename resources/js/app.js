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

import Vuetify from 'vuetify'

Vue.use(Vuetify)


import 'vuetify/dist/vuetify.min.css';

import VueApexCharts from 'vue-apexcharts'


//const test = Vue.component('test', require('./components/test.vue').default);

//Vue.component('overview-solutions', require('./components/sensors/overview-solutions.vue').default);

// Plug in

Vue.component('weather', require('./components/plugins/weather-plugin.vue').default);
Vue.component('apexchart', VueApexCharts)


// Components

Vue.component('overview-solutions', require('./components/overview/overview-solutions.vue').default);
Vue.component('overview-sensors', require('./components/overview/overview-geral-info.vue').default);

Vue.component('navigation', require('./components/navigationbar.vue').default);
const login = Vue.component('login', require('./components/auth/login.vue').default);
const register = Vue.component('register', require('./components/auth/register.vue').default);
const overview = Vue.component('overview', require('./components/overview/overview-page.vue').default);
const sensor = Vue.component('sensor', require('./components/sensors/sensor-page.vue').default);
const sensorHistory = Vue.component('sensor-history', require('./components/sensors/sensor-history.vue').default);
const solution = Vue.component('solution', require('./components/solutions/solution-page.vue').default);
const home = Vue.component('home-page', require('./components/home-page.vue').default);
//const editsensor = Vue.component('edit-sensor', require('./components/sensors/edit-sensor.vue').default);
//const editGreenHouse = Vue.component('edit-green-house', require('./components/sensors/green-house-edit.vue').default); 
const routes = [
    {path:'/', redirect:'/login'},
    {path:'/login', component:login, name: 'login'},
    {path:'/register', component:register},
    {path:'/overview', component:overview},
    {path:'/solution', component:solution},
    {path:'/sensors', component:sensor},
    {path:'/sensor-history', component:sensorHistory},
    {path:'/home', component:home},
   // {path:'/edit-sensor/:id', component:editsensor},
   // {path:'/edit-green-house/:id', component:editGreenHouse},
];
const router = new VueRouter({
    routes: routes
});

const app = new Vue({
    el: '#app',
    store,
    vuetify: new Vuetify(),
    router: router
});


