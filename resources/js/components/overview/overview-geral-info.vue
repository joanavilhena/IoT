<template>
  <div style="padding: 5%; padding-bottom: 0">
    <v-card-title class="display-1" style="justify-content: rigth; padding-left: 0">Overview</v-card-title>
    <v-divider style="width: 90%   margin: auto"></v-divider>
    <br />
    <br />
    <v-row>
      <v-col cols="12" md="4">
        <v-card color="#A6C16A" dark style="padding: 2%">
          <v-row no-gutters justify="center">
            <v-col sm="3" style="text-align: center">
              <v-icon style="font-size: 100px ">mdi-leaf</v-icon>
            </v-col>
            <v-col sm="9">
              <h1 class="headline">Greenhouses</h1>
              <h2 style="padding: 5% margin-left: 10%">{{this.countSolutions}} Connected</h2>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
      <weather />

      <v-col cols="12" md="4" offset-md="4">
        <v-card color="#5B723C" dark style="padding: 2%">
          <v-row no-gutters justify="center">
            <v-col sm="3" style="text-align: center">
              <v-icon style="font-size: 100px ">mdi-star</v-icon>
            </v-col>
            <v-col sm="9">
              <h1 class="headline">V.I.P</h1>
              <h2 style="padding: 5% margin-left: 10%">{{this.countVips}} V.I.P Greenhouses</h2>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
     
    </v-row>
  </div>
</template>
<script>
export default {};
</script>

<script>
export default {
  data: function() {
    return {
      countSolutions: 0,
      countVips: 0,
      waterPercentage: 50
    };
  },
  mounted() {
    this.getSolutions();
  },
  methods: {
    getSolutions() {
      axios
        .get("/api/solution/hub/user/" + this.$store.state.user.id)
        .then(response => {
          let solucoes = response.data;
          this.countSolutions = solucoes.length;

          let countVip = 0;
          solucoes.forEach(element => countVip += element.vip );
          this.countVips = countVip;
        })
        .catch(error => {
          if (error.response) {
            console.log(error.response);
          }
      });
    }
  }
};
</script>

