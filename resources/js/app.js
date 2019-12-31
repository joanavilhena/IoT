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

//const test = Vue.component('test', require('./components/test.vue').default);

Vue.component('overview-list-sensor', require('./components/sensors/list-sensors.vue').default);
Vue.component('overview-sensors', require('./components/sensors/overview-sensors.vue').default);
Vue.component('overview-solutions', require('./components/sensors/overview-solutions.vue').default);
Vue.component('weather', require('./components/plugins/weather-plugin.vue').default);

const navigation = Vue.component('navigation', require('./components/navigationbar.vue').default);
const login = Vue.component('login', require('./components/auth/login.vue').default);
const overview = Vue.component('overview', require('./components/overviewPage.vue').default);
const editsensor = Vue.component('edit-sensor', require('./components/sensors/edit-sensor.vue').default);
const routes = [
    {path:'/', redirect:'/home'},
    {path:'/home', component:login},
    {path:'/overview', component:overview},
    {path:'/edit-sensor/:id', component:editsensor},
];
const router = new VueRouter({
    routes: routes 
});

const app = new Vue({
    el: '#app',
    store,
    vuetify: new Vuetify(),
    router:router
});


