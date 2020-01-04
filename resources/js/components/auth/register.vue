<template>
  <v-app>
    <v-form v-model="isFormValid">
      <v-container>
        <v-card-title
          class="display-1"
          style="justify-content: rigth; padding-left: 0"
        >Create new Account</v-card-title>
        <v-divider style="width: 90%   margin: auto"></v-divider>
        <form>
          <v-text-field v-model="name" :rules="nameRules" label="Name" required></v-text-field>
          <v-text-field v-model="email" :rules="emailRules" label="E-mail" required></v-text-field>
          <v-text-field
            v-model="password"
            :rules="[rules.required, rules.min]"
            :type="'password'"
            name="input-10-1"
            label="Password"
            hint="At least 6 characters"
            counter
          ></v-text-field>
        
          <v-btn class="mr-4" @click="submit" :disabled="!isFormValid">submit</v-btn>
          <v-btn @click="clear">clear</v-btn>
        </form>
      </v-container>
    </v-form>
  </v-app>
</template>

<script>
export default {
  data: () => ({
    isFormValid: false,
    name: "",
    email: "",
    password: "",
    passwordConfirm: "",
    nameRules: [
      v => !!v || "Name is required",
      v => v.length <= 25 || "Name must be less than 25 characters"
    ],
    emailRules: [
      v => !!v || "E-mail is required",
      v => /.+@.+/.test(v) || "E-mail must be valid"
    ],
    rules: {
      required: value => !!value || "Required.",
      min: v => v.length >= 6 || "Min 6 characters"
    }
  }),

  mounted() {},
  methods: {
    submit() {
      this.showMessage = false;
      let user = {
        name: this.name,
        email: this.email,
        password: this.password
      };
      axios
        .post("api/register", user)
        .then(response => {
          this.$store.commit("setToken", response.data.access_token);
          this.$router.push({ name: "login" });
          
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