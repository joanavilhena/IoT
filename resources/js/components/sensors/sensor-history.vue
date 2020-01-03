<template>
  <v-app>
    <v-container>
      <br />
      <br />
      <br />
      <v-card-title
        class="display-1"
        style="justify-content: rigth; padding-left: 0"
      >Sensors History</v-card-title>
      <v-divider style="width: 90%   margin: auto"></v-divider>
      <template>
        <v-text-field v-model="search" append-icon="mdi-magnify-scan" label="Search"></v-text-field>
        <v-data-table :headers="sensorsHistoryTableHeaders" :items="sensorsHistory" />
      </template>
    </v-container>
  </v-app>
</template>


<script>
export default {
  data() {
    return {
      search: "",
      sensorsHistory: [],
      sensorsHistoryTableHeaders: [
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
          text: "Min Value",
          value: "min_value"
        },
        {
          text: "Max Value",
          value: "max_value"
        }
      ],

    };
  },
  mounted() {
    this.getSensorsHistory();
  },
  methods: {
   
    getSensorsHistory() {
      axios
        .get("/api/sensorData/history")
        .then(response => {
          this.sensorsHistory = response.data;
          
        })
        .catch(error => {
          if (error.response) {
            console.log(error.response);
          }
        });
    },

  }
};
</script>
