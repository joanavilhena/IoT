<template>
  <v-app>
    <v-container>
      <v-form v-model="isFormValid" style="text-align:center">
        <v-text-field
          v-model="token"
          :rules="tokenRules"
          label="Reference"
          data-vv-name="Reference"
          required
          style="margin-top: 25%"
        ></v-text-field>

        <v-btn :disabled="!isFormValid" class="mr-4" @click="submit">submit</v-btn>
        <v-btn @click="clear">clear</v-btn>
      </v-form>
    </v-container>
  </v-app>
</template>


<script>
export default {
  data: () => ({
    isFormValid: false,
    token: "",
    tokenRules: [v => v.length > 2 || "Reference must be bigger than 5 characters long"]
  }),
  mounted() {
  },
  methods: {
    submit() {
      let user = {
        "user_id": this.$store.state.user.id, 
        "token_hub": this.token
      }
      axios
        .post("api/hub", user)
        .then(response => {
          console.log(response);
        })
        .catch(error => {
          console.log(error);
        });
    },
    clear() {
      this.reference = "";
    }
  }
};
</script>