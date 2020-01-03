<template>
<div>
  <b-navbar toggleable="lg" type="dark" variant="info">
   <router-link class="nav-link" to="/home">Estufa 4.0</router-link>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>
      <b-navbar-nav>
        <b-nav-item><router-link class="nav-link" to="/overview">Overview</router-link></b-nav-item>
        <b-nav-item><router-link class="nav-link" to="/solution">Solutions</router-link></b-nav-item>
        <b-nav-item><router-link class="nav-link" to="/sensors">Sensors</router-link></b-nav-item>
        <b-nav-item><router-link class="nav-link" to="/sensor-history">Sensors History</router-link></b-nav-item>
        
        
      </b-navbar-nav>

      <!-- Right aligned nav items -->
      <b-navbar-nav class="ml-auto">
        <b-nav-item-dropdown right>
          <!-- Using 'button-content' slot -->
          <template v-slot:button-content>
          </template>
          <b-dropdown-item href="#">Profile</b-dropdown-item>
          <b-dropdown-item href="#">Sign Out</b-dropdown-item>
        </b-nav-item-dropdown>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</div>
</template>
<script>
export default {
  
}
</script>