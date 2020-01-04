<template>
  <v-container>
    <v-card-title
      class="display-1"
      style="justify-content: rigth; padding-left: 0"
    >Create new Account</v-card-title>
    <v-divider style="width: 90%   margin: auto"></v-divider>
    <form>
      <v-text-field v-model="user.name" label="Name" required></v-text-field>
      <v-text-field v-model="user.email" label="E-mail" required></v-text-field>
      <v-text-field v-model="user.password" label="Password" required></v-text-field>

      <v-btn class="mr-4" @click="submit">submit</v-btn>
      <v-btn @click="clear">clear</v-btn>
    </form>
  </v-container>
</template>

<script>
import { ValidationProvider, extend } from "vee-validate";
import { required } from "vee-validate/dist/rules";
export default {
  data: () => ({
    user: {
      name: "",
      email: "",
      password: ""
    },

    errors: []
  }),

  mounted() {},

  methods: {
    submit() {
      this.showMessage = false;
      axios
        .post("api/register", this.user)
        .then(response => {
            console.log(response)
          this.$store.commit("setToken", response.data.access_token);
        })
        .catch(error => {
            console.log(error)
          this.$store.commit("clearUserAndToken");
          this.typeofmsg = "alert-danger";
          this.message = "Invalid credentials";
          this.showMessage = true;
        });
    },
    clear() {
      this.name = "";
      this.email = "";
      this.password = "";
    }
  }
};
</script>