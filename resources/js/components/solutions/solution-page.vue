<template>
  <v-app>
    <div style="padding: 5%; padding-bottom: 0">
      <br />
      <br />
      <v-card-title class="display-1" style="justify-content: rigth; padding-left: 0">Greenhouses</v-card-title>
      <v-divider style="width: 90%   margin: auto"></v-divider>
      <template>
        <v-text-field v-model="search" append-icon="mdi-magnify-scan" label="Search"></v-text-field>
        <v-data-table :headers="solutionTableHeaders" :items="solutions" :search="search">
          <template v-slot:top>
            <v-toolbar flat color="white">
              <v-spacer></v-spacer>
              <v-dialog v-model="dialog" max-width="500px">
                <v-card>
                  <v-card-text>
                    <v-container>
                      <v-row style="text-align: center">
                        <v-col cols="12" sm="12" md="12">
                          <v-select
                            v-model="editedItem.terra"
                            :items="terraTypes"
                            readonly
                            label="Terra Type"
                          ></v-select>
                        </v-col>
                        <v-col cols="6" sm="6" md="6">
                          <v-btn
                            x-small
                            color="secondary"
                            dark
                            @click="waterForce"
                          >Force Water Disposal</v-btn>
                        </v-col>
                        <v-col cols="6" sm="6" md="6">
                          <v-btn
                            x-small
                            color="secondary"
                            dark
                            @click="fanForce"
                          >Force Fan Ramp Up</v-btn>
                        </v-col>
                      </v-row>
                    </v-container>
                  </v-card-text>

                  <v-card-actions style="text-align: center">
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1"  text @click="close">Cancel</v-btn>
                    <v-btn color="blue darken-1"  text @click="save">Save</v-btn>
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
    </div>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      search: "",
      solutions: [],
      solutionTableHeaders: [
        {
          text: "ID",
          value: "id"
        },
        {
          text: "Vip",
          value: "vip"
        },
        {
          text: "Ground State",
          value: "terra"
        },
        {
          text: "Number of Sensors",
          value: "sensor_number"
        },
        {
          text: "Percentage Of Water (0 - 1)",
          value: "water_percentage"
        },
        { text: "Actions", value: "action", sortable: false }
      ],
      terraTypes: ["Wet", "Dry"],
      //Edit
      dialog: false,
      editedItem: {
        token: "",
        terra: ""
      },
      defaultItem: {
        token: "",
        terra: ""
      },
      //Edit
      dialog: false
    };
  },
  watch: {
    dialog: function(val) {
      val || this.close();
    }
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

    deleteItem(item) {
      const index = this.solutions.indexOf(item);

      if (
        !confirm(
          "This action will result in the deletion of all information regarding this Greenhouse in conjunction with its sensors \nAre you sure that this is the intended action ?"
        )
      ) {
        return;
      }
      this.solutions.splice(index, 1);
      axios
        .post("/api/solution/delete/" + item.token)
        .then(response => {})
        .catch(error => {
          if (error.response) {
            console.log(error.response);
          }
        });
    },
    waterForce(item) {
      axios
        .post("/api/solution/water/"+ this.editedItem.token)
        .then(response => {
          console.log()
        });
    },
    fanForce(item) {
      axios
        .post("/api/solution/fan/"+ this.editedItem.token)
        .then(response => {
          console.log()
        });
    },
    editItem(item) {
      this.editedIndex = this.solutions.indexOf(item);
      this.editedItem = item;
      this.dialog = true;
    },

    save() {
      if (this.editedIndex > -1) {
        axios
          .post("/api/solution/update", this.editedItem)
          .then(response => {
            let item = {
              terra: ""
            };
            item.terra = response.data.terra;
            let editedIndex = this.solutions.indexOf(this.editedItem);
            Object.assign(this.solutions[editedIndex], item);
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
    },

    close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    }
  }
};
</script>
