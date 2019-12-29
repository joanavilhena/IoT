<template>
  <div class="container">

    <br>
      <div>
        <b-jumbotron bg-variant="" text-variant="black"  border-variant="">
            <template v-slot:header>Edit Sensor</template>
        </b-jumbotron>
    </div>
    <div>
        <hr>
        <div class="form-group">
            <label>Name</label>
            <input disabled type="text" class="form-control" v-model="currentSensor.name">
        </div>
        <div class="form-group">
            <label>Last Update</label>
            <input disabled type="text" class="form-control" v-model="currentSensor.lastUpdate">
        </div>
        <div class="form-group">
            <label>ID</label>
            <input disabled type="text" class="form-control" v-model="currentSensor.id"></input>
        </div>
        <div class="form-group">
            <label>Value</label>
            <input disabled type="text" class="form-control" v-model="currentSensor.value">
        </div>
        <div class="form-group">
            <label>Min. Value</label>
            <input type="text" class="form-control" v-model="currentSensor.minVal">
        </div>
        <div class="form-group">
            <label>Max Value</label>
            <input type="text" class="form-control" v-model="currentSensor.maxVal">
        </div>

        <div class="">
          <button  v-on:click.prevent="show()" class="btn btn-xs btn-success">Editar</button>
          <button class="btn btn-xs btn-warning">Cancelar</button>
        </div>
    </div>
    <br>
  </div>
</template>

<script>
module.exports = {
    //props:["currentUser"],
    data: function(){
      return{
        id: this.$route.params.id,
        currentSensor:[],
      }
    },
    methods: {

      show()
      {
        console.log(this.currentSensor);
      axios.patch('api/update/', this.currentSensor)
      .then(response=>{
      
       console.log(response)
     
      console.log(this.currentSensor)
      }).catch(error=>{
        console.log(error);
      });

      },

       back()
        {
            this.$router.push('/sensors');
        }
      
    },
    mounted()
    {
      console.log("Sensor");
      axios.get('api/sensor/', this.$route.params.id)
      .then(response=>{
      
       console.log(response.data);
      this.currentSensor = response.data.data;
      console.log(this.currentSensor)
      }).catch(error=>{
        console.log(error);
      });
    }


  }
</script>