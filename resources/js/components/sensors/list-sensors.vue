<template>
    <v-container>
      <v-card-title
        class="display-1"
        style="justify-content: rigth; padding-left: 0"
      >Greenhouses Overview</v-card-title>
      <v-divider style="width: 90%   margin: auto"></v-divider>
      <v-row no-gutters justify="center">
        <v-col
          sm="3"
          class="container"
          style="margin-top: 5%"
          v-for="(solutions,index) in solutions"
          :key="solutions.id"
        >
          <v-card class="mx-auto" max-width="344">
            <v-list-item-content>
              <v-list-item-title
                class="headline text-center"
                style="font-size: 30px"
              >Solution {{solutions.id}}</v-list-item-title>
            </v-list-item-content>
            <v-row no-gutters justify="center" class="text-center" v-if="solutions != undefined">
              <v-col sm="6" class="identifierCardColl">
                <v-card :elevation="2">
                  <h2 class="identifierCardInfoTitle">ID</h2>
                  <div class="identifierCardInfoText">{{solutions.id}}</div>
                </v-card>
              </v-col>
              <v-col sm="6" class="identifierCardColl">
                <v-card :elevation="2">
                  <h2 class="identifierCardInfoTitle">State</h2>
                  <div
                    class="identifierCardInfoText"
                  >{{solutions.state == 1 ? "Online" : "Offline"}}</div>
                </v-card>
              </v-col>
            </v-row>
            <div style="background-color: #f5f5f5; "  :style= "[solutions.sensor_data.length > 0 ? {cursor: 'pointer'} : '']"
                  @click="solutions.sensor_data.length > 0 ? timeToShow(solutions.id): ''" >
              <h2
                class="identifierCardSensorTitle text-center"
                style="padding-bottom: 15px"
              >Number of Sensors: {{solutions.sensor_data.length}}</h2>
              <div class="identifierCardInfoAction">
                  <v-icon v-if="solutions.sensor_data.length > 0">{{ show == solutions.id ? 'mdi-chevron-up' : 'mdi-chevron-down' }}</v-icon>
              </div>
              <v-expand-transition>
                <div v-show="show == solutions.id ">
                  <v-divider></v-divider>
                  <v-row no-gutters class="text-center" justify="center">
                    <v-col
                      sm="4"
                      class="identifierCardSensorData"
                      v-for="(sensors,index) in solutions.sensor_data"
                      :key="sensors.id"
                    >
                      <h2 class="identifierCardInfoTitle">{{sensors.name}}</h2>
                      <div>{{sensors.value}}</div>
                    </v-col>
                  </v-row>
                </div>
              </v-expand-transition>
            </div>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
</template>
<script>
export default {
  data: function() {
    return {
      show: -1,
      sensorsProperties: [],
      solutions: []
    };
  },
  mounted() {
    this.getSensorData();
  },

  methods: {
    editSensor($id) {
      this.$router.push("/edit-sensor/" + $id);
    },

    getSensorData() {
      axios
        .get("/api/solution/sensorData")
        .then(response => {
          this.solutions = response.data;
        })
        .catch(error => {
          if (error.response) {
            console.log(error.response);
          }
        });
    },

    deleteSensor($id) {
      axios
        .delete("/api/delete/" + $id)
        .then(response => {
          this.sensors = response.data;
          axios
            .get("/api/sensors")
            .then(response => {
              this.sensors = response.data;
            })
            .catch(error => {});
        })
        .catch(error => {});
    },
    timeToShow: function($id) {
      if (this.show == $id) {
        this.show = -1;
      } else {
        this.show = $id;
      }
    }
  }
};
</script>

<style scoped>
.identifierCardColl {
  padding: 5% !important;
}

.identifierCardInfoTitle {
  font-size: 120%;
  color: grey;
}

.identifierCardInfoText {
  font-size: 23px;
  color: #00ced1;
}

.identifierCardSensorTitle {
  font-size: 20px;
  color: #212121;
  padding-top: 5%;
}

.identifierCardSensorData {
  padding: 5% !important;
}

.identifierCardInfoAction {
  width: 100%;
  text-align: center;
  margin-top: -25px; /* killing me is a violent act that should not be taken into consideration*/
}
</style>