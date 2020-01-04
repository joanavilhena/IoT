<template>
  <v-app>
    <v-form v-model="valid">
      <v-container>
        <v-card-title
          class="display-1"
          style="justify-content: rigth; padding-left: 0"
        >Create new Account</v-card-title>
        <v-divider style="width: 90%   margin: auto"></v-divider>
        <form>
          <v-text-field v-model="name" :rules="nameRules" label="Name" required></v-text-field>
          <v-text-field v-model="email" :rules="emailRules" label="E-mail" required></v-text-field>
          <v-text-field v-model="password" label="Password" required></v-text-field>
          <v-text-field v-model="passwordConfirm" label="Confirm Password" required></v-text-field>
          <v-btn class="mr-4" @click="submit">submit</v-btn>
          <v-btn @click="clear">clear</v-btn>
        </form>
      </v-container>
    </v-form>
  </v-app>
</template>

<script>
export default {
  data: () => ({
    valid: false,
    name: "",
    email: "",
    password: "",
    passwordConfirm: "",
    nameRules: [
      v => !!v || "Name is required",
      v => v.length <= 10 || "Name must be less than 10 characters"
    ],
    emailRules: [
      v => !!v || "E-mail is required",
      v => /.+@.+/.test(v) || "E-mail must be valid"
    ]
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
        //  this.$router.push({ name: "login" });
        })
        .catch(error => {
          console.log(error);
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
      this.passwordConfirm = "";
    }
  }
};
</script>