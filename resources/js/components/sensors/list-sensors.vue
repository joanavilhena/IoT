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
                    <p>Min. Value: {{sensor.minVal}}</p>
                    <p>Max. Value: {{sensor.maxVal}}</p>
                    <p>Last Update: {{sensor.lastUpdate}}</p>
                </b-card-text>

                <b-button href="#" variant="info" v-on:click.prevent="editSensor(sensor.id)">Edit</b-button>
                <b-button href="#" variant="danger" v-on:click.prevent="deleteSensor(sensor.id)" >Delete</b-button>
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

    methods: {
       editSensor($id)
       {
            this.$router.push('/edit-sensor/'+ $id);
       },

       deleteSensor($id)
       {
        axios.delete('/api/delete/'+ $id )
        .then(response=>{
      
            console.log(response)
            this.sensors = response.data.data;
            console.log(this.sensors)

            axios.get('/api/sensors')
            .then(response=>{
      
            console.log(response)
            this.sensors = response.data.data;
            console.log(this.sensors)
            }).catch(error=>{
       
      })
       
      }).catch(error=>{
       
      })

      }



      
    },

    mounted()
    {
        console.log("Im here")
        axios.get('/api/sensors')
        .then(response=>{
      
            console.log(response)
            this.sensors = response.data.data;
            console.log(this.sensors)
      }).catch(error=>{
       
      })
    }
    
}
</script>