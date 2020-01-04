<template>
  <v-app>
    <div style="padding: 5%; padding-bottom: 0">
      <br />
      <br />
      <v-card-title class="display-1" style="justify-content: rigth; padding-left: 0">Sensors</v-card-title>
      <v-divider style="width: 90%   margin: auto"></v-divider>
      <template>
        <v-text-field v-model="search" append-icon="mdi-magnify-scan" label="Search"></v-text-field>
        <v-data-table :headers="solutionTableHeaders" :items="solutions" :search="search">
          <template v-slot:item.action="{ item }">
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
          text: "Ip",
          value: "ip"
        },
        {
          text: "Vip",
          value: "vip"
        },
        {
          text: "State",
          value: "state"
        },
        {
          text: "Number of Sensors",
          value: "sensor_number"
        },
        { text: "Actions", value: "action", sortable: false }
      ],
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
