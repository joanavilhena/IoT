<template>
  <v-col cols="12" md="4" offset-md="4">
    <v-card color="#87CEEB" dark style="padding: 2%">
      <v-row no-gutters>
        <v-col sm="4" class="parent">
          <h1 v-show="curTempDisplay" class="display-3 temperatur">{{ curTempDisplay }}&deg;C</h1>
        </v-col>
        <v-col sm="8" style="text-align: right">
          <h1 class="headline">{{ city }}</h1>
          <h2 style="padding: 5% margin-left: 10%">{{ weatherDesc.toUpperCase() }}</h2>
        </v-col>
      </v-row>
    </v-card>
  </v-col>
</template>
<script>
export default {
  data: function() {
    return {
      latitude: 0.0,
      longitude: 0.0,
      city: "Searching",
      curTemp: 273.2,
      dataObj: null,
      weatherDesc: "Searching",
      errorMsg: ""
    };
  },

  mounted() {
    this.getLocation();
  },

  computed: {
    curTempDisplay: function() {
      if (this.curTemp != null) {
        return (this.curTemp - 273.15).toFixed(1);
      } else {
        return null;
      }
    }
  },
  methods: {
    getTemp: function(option) {
      this.displayMode = option;
    },
    getLocation: function() {
      var options = { timeout: 60000 };
      navigator.geolocation.getCurrentPosition(
        this.success,
        this.error,
        options
      );
    },
    success: function(position) {
      this.latitude = position.coords.latitude;
      this.longitude = position.coords.longitude;
      this.latitude = parseFloat(this.latitude).toFixed(2);
      this.longitude = parseFloat(this.longitude).toFixed(2);

      this.getWeather();
    },
    error: function(err) {
      console.warn(err);
    },
    getWeather: function() {
      var reqURL =
        "https://cors-anywhere.herokuapp.com/http://api.openweathermap.org/data/2.5/weather?lat=" +
        this.latitude +
        "&lon=" +
        this.longitude +
        "&APPID=69d3cf86b46f19cf3e049339355533aa";
      axios.get(reqURL).then(response => {
        this.dataObj = response.data;
        this.curTemp = this.dataObj.main.temp;
        this.city = this.dataObj.name;
        this.weatherDesc = this.dataObj.weather[0].description;
      });
    }
  }
};
</script>

<style scoped>

.parent {
  display: table;
  width: 100%;
  height: 100px;
  text-align: center;
}

.temperatur {
  display: table-cell;
  vertical-align: middle;
}
</style>