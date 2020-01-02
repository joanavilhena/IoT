<template>
  <v-app >
    <v-container>
      <v-card-title class="display-1" style="justify-content: rigth; padding-left: 0">Edit the Greenhouse  </v-card-title>
      <v-divider style="width: 90%   margin: auto"></v-divider>
      <form>
        <v-text-field v-model="currentSolution.name" label="Name" required>{{currentSolution.name}}</v-text-field>
        <v-text-field v-model="currentSolution.state" required>{{currentSolution.state}}</v-text-field>
        <v-text-field disabled v-model="currentSolution.vip" required>{{currentSolution.vip}}</v-text-field>
        <v-text-field disabled v-model="currentSolution.sensor_number">{{currentSolution.sensor_number}}</v-text-field>

        <v-btn class="mr-4" @click="submit">submit</v-btn>
        <v-btn @click="clear">clear</v-btn>
      </form>
    </v-container>
  </v-app>
</template>

<script>
module.exports = {
  //props:["currentUser"],
  data: function() {
    return {
      id: this.$route.params.id,
      currentSolution: {}
    };
  },
  mounted() {
    this.getSelectedSolution();
  },
  methods: {
    getSelectedSolution() {
      axios
        .get("api/solution/" + this.$route.params.id)
        .then(response => {
          this.currentSolution = response.data.data;
        })
        .catch(error => {
          console.log(error);
        });
    },
  }
};
</script>