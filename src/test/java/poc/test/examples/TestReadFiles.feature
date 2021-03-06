@test
Feature: Validate reading request and response test data from external files

Scenario: Testing forgot password api for invalid body
* def reqbody = read ('classpath:dev/request/forgot-password.invalid.body.json');
* def invalidbodyresponse = read ('classpath:dev/test-data/forgot-password.invalidbodyresponse.json');
Given url 'http://appduv3f36.ibmsl.cloud.test.group:10150/forgot-password'
When request reqbody
And header Content-Type = 'application/json'
Then method POST
Then status 400
Then match response == invalidbodyresponse

Scenario: Testing forgot password api for valid body
* def reqbody = read ('classpath:dev/request/forgot-password.body.json');
* def apiresponse = read ('classpath:dev/test-data/forgot-password.response.json');
Given url 'http://appduv3f36.ibmsl.cloud.test.group:10150/forgot-password'
When request reqbody
And header Content-Type = 'application/json'
Then method POST
Then status 200
Then match response == apiresponse
