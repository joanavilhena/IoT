<template>
    <div class="container">
        <br>
        <div>
            <b-jumbotron bg-variant="" text-variant="black"  border-variant="">
                <template v-slot:header>Sensors</template>
            </b-jumbotron>
        </div>
        <hr>
        <b-card-group deck>
            <b-card v-for="(sensor,index) in sensors" :key="sensor.id"
                :title="sensor.name"
                tag="article"
                style="max-width: 20rem;"
                class="mb-2">
                <b-card-text>
                    <p>ID: {{sensor.id}}</p>
                    <p>State: {{sensor.state}}</p>
                    <p>Name: {{sensor.name}}</p>
                    <p>IP: {{sensor.ip}}</p>
                    <p>Min. Value: {{sensor.minVale}}</p>
                    <p>Max. Value: {{sensor.maxVale}}</p>
                    <p>Last Update: {{sensor.lastUpdate}}</p>
                </b-card-text>

                <b-button href="#" variant="info"><router-link class="nav-link" to="/edit-sensor">Edit</router-link></b-button>
                <b-button href="#" variant="danger">Delete</b-button>
            </b-card>
        </b-card-group>
    </div>
</template>
<script>
export default {

     data: function(){
      return {
       
          sensors:[],

      }
    },

    mounted()
    {
        console.log("Im here")
        axios.get('/api/sensors')
        .then(response=>{
      
            console.log(response)
            this.sensors = response.data.data
            console.log(this.sensors)
      }).catch(error=>{
       
      })
    }
    
}
</script>