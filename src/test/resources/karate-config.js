function() {
	var env = karate.env;
	if (!env) {
	    env = 'dev'; // set default environment
	    karate.log('karate.env system property is null, default env:', env);
	}else{
		karate.log('karate.env system property is:', karate.env);
	}
	var config = {
			env: karate.env,
			baseURI: 'https://stage-host/v1/auth',
		    apiLocation: "classpath:"+env+"/api/",
		    requestLocation: "classpath:"+env+"/data/request/",
			responseLocation: "classpath:"+env+"/data/response/",
			inputDataLocation: "classpath:"+env+"/data/input/"
		}; 
	if (env == 'sit') {
	    config.baseURI = 'http://petstore-demo-endpoint.execute-api.com';
	  } else if (env == 'e2e') {
	    config.baseURI = 'http://dummy.restapiexample.com';
	  } else {
		  config.baseURI = 'http://appduv3f36.ibmsl.cloud.test.group:10150'
	  }
	return config;
}