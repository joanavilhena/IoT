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
        v-for="solution in solutions"
        :key="solution.id"
      >
        <v-card class="mx-auto" max-width="344">
          <v-list-item-content>
            <v-list-item-title
              class="headline text-center"
              style="font-size: 30px"
            >Greenhouse {{solution.id}}</v-list-item-title>
          </v-list-item-content>
          <v-row no-gutters justify="center" class="text-center" v-if="solution != undefined">
            <v-col sm="6" class="identifierCardColl">
              <v-card :elevation="2">
                <h2 class="identifierCardInfoTitle">IP</h2>
                <div class="identifierCardInfoText">{{solution.ip}}</div>
              </v-card>
            </v-col>
            <v-col sm="6" class="identifierCardColl">
              <v-card :elevation="2">
                <h2 class="identifierCardInfoTitle">State</h2>
                <div class="identifierCardInfoText">{{solution.state == 1 ? "Online" : "Offline"}}</div>
              </v-card>
            </v-col>

            <v-col sm="12" class="identifierCardColl">
              <v-btn
                depressed
                color="error"
                style="width: 100%; color: white; text-decoration: none;"
                @click="deleteSolution(solution.token)"
              >Delete Greenhouse</v-btn>
            </v-col>
          </v-row>
          <div
            style="background-color: #f5f5f5; "
            :style="[solution.sensor_number > 0 ? {cursor: 'pointer'} : '']"
            @click="solution.sensor_number> 0 ? getSolutionsSensorData(solution.id): ''"
          >
            <h2
              class="identifierCardSensorTitle text-center"
              style="padding-bottom: 15px"
            >Number of Sensors: {{solution.sensor_number}}</h2>
            <div class="identifierCardInfoAction">
              <v-icon
                v-if="solution.sensor_number > 0"
              >{{ show == solution.id ? 'mdi-chevron-up' : 'mdi-chevron-down' }}</v-icon>
            </div>
            <v-expand-transition>
              <div v-show="show == solution.id ">
                <v-divider></v-divider>
                <v-row no-gutters class="text-center" justify="center">
                  <v-col
                    sm="4"
                    class="identifierCardSensorData"
                    v-for="sensors in availSearch()"
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
      solutions: [],
      sensorDataBySolution: []
    };
  },
  mounted() {
    this.getSolutions();
  },

  methods: {
    getSolutions() {
      axios
        .get("/api/solution")
        .then(response => {
          this.solutions = response.data;
        })
        .catch(error => {
          if (error.response) {
            console.log(error.response);
          }
        });
    },

    getSolutionsSensorData(id) {
      if (this.show == id) {
        this.show = -1;
      } else {
        this.show = id;
        axios
          .get("/api/sensorData/solution/" + id)
          .then(response => {
            this.sensorDataBySolution = response.data;
          })
          .catch(function(error) {
            if (error.response) {
              console.log(error.response);
            }
          });
      }
    },
    deleteSolution(token) {
      axios
        .post("/api/solution/delete/" + token)
        .then(response => {
          console.log(this.solutions)
          let indexToBeDeleted = -1;
          this.solutions.filter(function(element, index) {
            if (element.token == token) {
              indexToBeDeleted = index;
              return true;
            }
            return false;
          });

          this.solutions.splice(indexToBeDeleted, 1);

          console.log(solutionToBeDeleted)
        })
        .catch(error => {
          if (error.response) {
            console.log(error.response);
          }
        });
    },

    availSearch() {
      return this.sensorDataBySolution;
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