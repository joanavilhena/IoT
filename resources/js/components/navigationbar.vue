<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="info">
      <v-row v-if="this.$store.state.token != '' ? false : true" style="color: white">
        <v-col cols="12" md="2">
          <router-link
            class="nav-link"
            to="/home"
            style="background: none;
    color: inherit;"
          >Home Page</router-link>
        </v-col>
        <v-col cols="12" md="2">
          <router-link
            class="nav-link"
            to="/login"
            style="background: none;
    color: inherit;"
          >Login</router-link>
        </v-col>
      </v-row>
      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <div v-if="this.$store.state.token == '' ? false : true">
          <b-navbar-nav>
            <b-nav-item>
              <router-link class="nav-link" to="/overview">Overview</router-link>
            </b-nav-item>
            <b-nav-item>
              <router-link class="nav-link" to="/solution">Solutions</router-link>
            </b-nav-item>
            <b-nav-item>
              <router-link class="nav-link" to="/sensors">Sensors</router-link>
            </b-nav-item>
            <b-nav-item>
              <router-link class="nav-link" to="/sensor-history">Sensors History</router-link>
            </b-nav-item>
          </b-navbar-nav>
        </div>
        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto" v-if="this.$store.state.token == '' ? false : true">
          <b-nav-item-dropdown right>
            <!-- Using 'button-content' slot -->
            <template v-slot:button-content></template>
            <b-dropdown-item @click="logout()">Sign Out</b-dropdown-item>
          </b-nav-item-dropdown>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>
<script>
export default {};
</script>
<script>
export default {
  data() {
    return {};
  },
  mounted() {
    console.log("1");
    console.log(this.$store.state);
  },
  methods: {
    logout() {
      this.$store.commit("clearUserAndToken");
      this.$router.push({ name: "login" });
    }
  }
};
</script>
                       