function() {

  var config = {
		    env: '',
		    externalGatewayUrl: '',
		    client_id: '',
		    client_secret: ''
		  };  
  karate.configure('connectTimeout', 500000);
  karate.configure('readTimeout', 500000);
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);
  karate.configure('report' , { showLog: true, showAllSteps: false });
  
  return config;
}