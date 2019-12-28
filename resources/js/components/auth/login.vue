<template>
<div class="">
    <div class="jumbotron">
      <h1 align="center">{{title}}</h1>
    </div>
  <div class = "container">
      <div class="signup-form">
        <div class="alert" :class="typeofmsg" v-if="showMessage">
            <button type="button" class="close-btn" v-on:click="showMessage=false">&times;</button>
            <strong>{{ message }}</strong>
        </div>


          <div class="form-group">
      			<div class="input-group">
      				<span class="input-group-addon"><i class="fa fa-paper-plane"></i></span>
      				<input type="type" class="form-control" name="text" placeholder="Email Address" required="required" v-model="user.email">
      			</div>
          </div>
    		<div class="form-group">
    			<div class="input-group">
    				<span class="input-group-addon"><i class="fa fa-lock"></i></span>
    				<input type="password" class="form-control" name="password" placeholder="Password" required="required" v-model="user.password">
    			</div>
        </div>
    	<div class="text-center">
        <b-button variant="success" v-on:click.prevent="login">Login</b-button>
      </div>
    </div>
  </div>
</div>
</template>

<script>
export default {
    data: function(){
        return {
            user: {
                email:"",
                password:""
            },
            typeofmsg: "alert-success",
            showMessage: false,
            message: "",
            title:"Login"
        }
    },
    methods: {
        login() {
            this.showMessage = false;
            axios.post('api/login', this.user)
                .then(response => {
                    this.$store.commit('setToken',response.data.access_token);
                    this.$store.commit('setUser',this.user);
                    this.typeofmsg = "alert-success";
                    this.message = "User authenticated correctly";
                    this.showMessage = true;

                  
                    console.log(this.$store.state.user);
                    console.log(this.$store.state.user.email)
                })            
                .catch(error => {
                    this.$store.commit('clearUserAndToken');
                    this.typeofmsg = "alert-danger";
                    this.message = "Invalid credentials";
                    this.showMessage = true;
                   // console.log(error);
                })
        }
    },
}
</script>

<style lang="css">
</style>