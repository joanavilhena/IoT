<template>
  <v-app>
    <div style="padding: 5%; padding-bottom: 0">
      <br />
      <br />
      <v-card-title class="display-1" style="justify-content: rigth; padding-left: 0">Sensors</v-card-title>
      <v-divider style="width: 90%   margin: auto"></v-divider>
      <template>
        <v-text-field v-model="search" append-icon="mdi-magnify-scan" label="Search"></v-text-field>
        <v-data-table
          v-model="selected"
          :headers="sensorsTableHeaders"
          :items="sensors"
          single-select
          item-key="id"
          show-select
          :search="search"
        >
          <template v-slot:top>
            <v-toolbar flat color="white">
              <v-spacer></v-spacer>
              <v-dialog v-model="dialog" max-width="500px">
                <v-card>
                  <v-card-text>
                    <v-container>
                      <v-row>
                        <v-col cols="12" sm="6" md="4">
                          <v-text-field v-model="editedItem.name" label="Name"></v-text-field>
                        </v-col>
                        <v-col cols="12" sm="6" md="4">
                          <v-text-field v-model="editedItem.value" label="Value"></v-text-field>
                        </v-col>
                        <v-col cols="12" sm="6" md="4">
                          <v-text-field v-model="editedItem.threshold" label="Threshold"></v-text-field>
                        </v-col>
                        <v-col cols="12" sm="6" md="4">
                          <v-text-field v-model="editedItem.min_value" label="Min Value"></v-text-field>
                        </v-col>
                        <v-col cols="12" sm="6" md="4">
                          <v-text-field v-model="editedItem.max_value" label="Max Value"></v-text-field>
                        </v-col>
                      </v-row>
                    </v-container>
                  </v-card-text>

                  <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
                    <v-btn color="blue darken-1" text @click="save">Save</v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
            </v-toolbar>
          </template>
          <template v-slot:item.action="{ item }">
            <v-icon small class="mr-2" @click="editItem(item)">mdi-lead-pencil</v-icon>
            <v-icon small @click="deleteItem(item)">mdi-delete</v-icon>
          </template>
        </v-data-table>
      </template>
      <br />
      <br />
      <br />
      <v-row>
        <v-col cols="12" md="4">
          <v-card-title
            class="display-1"
            style="justify-content: rigth; padding-left: 0"
          >Sensor Progression</v-card-title>
        </v-col>
        <v-col cols="12" md="8">
          <h4
            style="text-align: right"
          >{{this.selected[0] != undefined ? "Sensor: " + this.selected[0].name : "No sensor selected" }}</h4>
          <h4
            style="text-align: right"
            v-if="this.selected[0] != undefined"
          >{{ "Solution: " + this.selected[0].solution_id }}</h4>
        </v-col>
      </v-row>
      <v-divider style="width: 90%   margin: auto"></v-divider>
      <div>
        <apexchart width="100%" type="line" :options="options" :series="series" :search="search" />
      </div>
    </div>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      search: "",
      sensors: [],
      selected: [],
      sensorsTableHeaders: [
        {
          text: "ID",
          value: "id"
        },
        {
          text: "Name",
          value: "name"
        },
        {
          text: "Greenhouse ID",
          value: "solution_id"
        },
        {
          text: "Value",
          value: "value"
        },
        {
          text: "Threshold",
          value: "threshold"
        },{
          text: "Min Value",
          value: "min_value"
        },
        {
          text: "Max Value",
          value: "max_value"
        },
        { text: "Actions", value: "action", sortable: false }
      ],
      options: {
        chart: {
          id: "chartSensor"
        },
        xaxis: {
          categories: []
        }
      },
      series: [
        {
          name: "",
          data: []
        }
      ],

      //Edit
      dialog: false,
      editedItem: {
        id: "",
        name: "",
        value: 0,
        threshold: 0,
        min_value: 0,
        max_value: 0
      },
      defaultItem: {
        id: "",
        name: "",
        value: 0,
        threshold: 0,
        min_value: 0,
        max_value: 0
      }
    };
  },
  watch: {
    selected: function(val) {
      this.handleselection();
    },
    dialog: function(val) {
      val || this.close();
    }
  },

  mounted() {
    this.getSensors();
  },
  methods: {
    getSensors() {
      axios
        .get("/api/sensorData")
        .then(response => {
          this.sensors = response.data;
        })
        .catch(error => {
          if (error.response) {
            console.log(error.response);
          }
        });
    },

    handleselection() {
      if (this.selected.length < 1) {
        this.series = [
          {
            name: "",
            data: []
          }
        ];

        this.options = {
          chart: {
            id: "chartSensor"
          },
          xaxis: {
            categories: []
          }
        };
        return;
      }
      this.getSensorsProgression();
    },
    getSensorsProgression() {
      let data = [];
      axios
        .get(
          "/api/sensorData/history/solution/" +
            this.selected[0].solution_id +
            "/sensor/" +
            this.selected[0].name
        )
        .then(response => {
          let sensor = response.data;

          this.generateTimeSeries(response.data);
          for (let index = 0; index < sensor.length; index++) {
            data.push(sensor[index].value);
          }
          this.series = [
            {
              name: "sensor",
              data: data
            }
          ];
        })
        .catch(error => {
          if (error.response) {
            console.log(error.response);
          }
        });
    },

    generateTimeSeries(response) {
      let series = [];
      let seriesDate;
      let i = 0;
      const options = {
        minute: "numeric",
        hour: "numeric",
        second: "numeric",
        day: "numeric",
        month: "long",
        year: "numeric"
      };

      while (i < response.length) {
        seriesDate = new Date(response[i].created_at).getTime();
        series.push(new Date(seriesDate).toLocaleDateString("pt", options));
        i++;
      }
      this.options = {
        chart: {
          id: "ok"
        },
        xaxis: {
          categories: series
        }
      };
    },

    editItem(item) {
      this.editedIndex = this.sensors.indexOf(item);
      this.editedItem = item;
      this.dialog = true;
    },

    deleteItem(item) {
      const index = this.sensors.indexOf(item);

      if (
        !confirm(
          "This action will result in the deletion of all information regarding this sensor and its history \nAre you sure that this is the intended action ?"
        )
      ) {
        return;
      }
      this.sensors.splice(index, 1);
      axios
        .post(
          "/api/sensorData/delete/solution/" +
            item.solution_id +
            "/sensor/" +
            item.name
        )
        .then(response => {})
        .catch(error => {
          if (error.response) {
            console.log(error.response);
          }
        });
    },

    close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    },

    save() {
      if (this.editedIndex > -1) {
        axios
          .post("/api/sensorData/update", this.editedItem)
          .then(response => {
            let item = {
              id: "",
              name: "",
              value: 0,
              threshold: 0,
              min_value: 0,
              max_value: 0
            };
            item.id = response.data.id;
            item.name = response.data.name;
            item.value = response.data.value;
            item.threshold = response.data.threshold;
            item.min_value = response.data.min_value;
            item.max_value = response.data.max_value;
            let editedIndex = this.sensors.indexOf(this.editedItem);
            Object.assign(this.sensors[editedIndex], item);
          })
          .catch(error => {
            if (error.response) {
              console.log(error.response);
            }
          });
      } else {
        this.desserts.push(this.editedItem);
      }
      this.close();
    }
  }
};
</script>
