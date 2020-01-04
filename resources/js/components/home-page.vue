<template>
  <v-app>
    <v-row align="center" justify="center">
      <v-img
        src="https://images.pexels.com/photos/60006/spring-tree-flowers-meadow-60006.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
        aspect-ratio="1"
        class="grey lighten-2"
        max-width="100%"
        max-height="900px"
        gradient="to top right, rgba(100,115,201,.33), rgba(25,32,72,.4)"
      >
        <v-card class="mx-auto" dark max-width="600" style=" margin-top: 300px" :elevation="7">
          <br />
          <v-card-title style="justify-content: center; ">
            <span
              class="title font-weight-light"
              style="font-size: 45px !important"
            >Customized Greenhouse</span>
          </v-card-title>
          <br />
          <v-card-text
            class="headline font-weight-bold"
            style="text-align: center"
          >"Create the perfect garden, without leaving your house" - Greenhouse Team</v-card-text>
          <div style="justify-content: center; text-align: center; font-size: 50px">
            <router-link class="nav-link" to="/login">
              <v-btn rounded color="#708090" dark>
                <div>Come and Join Us</div>
              </v-btn>
            </router-link>
          </div>
          <br />
        </v-card>

        <v-row no-gutters style="bottom: 0px; bottom: 0px; position: absolute; width: 100%;">
          <v-col cols="12" sm="4">
            <div class="cardStyle">
              <v-card-title
                class="headline"
                style=" justify-content: center; padding-top: 5% "
              >All you Greenhouses in 1 place</v-card-title>

              <v-icon style="font-size: 80px;" color="black">mdi-arrow-collapse-all</v-icon>
            </div>
          </v-col>
          <v-col cols="12" sm="4">
            <div class="cardStyle">
              <v-card-title
                class="headline"
                style=" justify-content: center; padding-top: 5%; font-size: 40px !important"
              >Do More</v-card-title>

              <v-icon  style="font-size: 80px;" color="black">mdi-weight-lifter</v-icon>
            </div>
          </v-col>
          <v-col cols="12" sm="4">
            <div class="cardStyle">
              <v-card-title
                class="headline"
                style=" justify-content: center; padding-top: 5% "
              >See the change</v-card-title>

              <v-icon style="font-size: 80px;" color="black">mdi-chart-bell-curve-cumulative</v-icon>
            </div>
          </v-col>
        </v-row>
      </v-img>
    </v-row>
  </v-app>
</template>

<script>
export default {
  data() {
    return {};
  }
};
</script>

<style  scoped>
.cardStyle {
  text-align: center;
  align-content: center;
  font-size: 30px;
  background-color: rgb(245, 245, 245, 0.5);
  min-height: 200px;
}
</style>