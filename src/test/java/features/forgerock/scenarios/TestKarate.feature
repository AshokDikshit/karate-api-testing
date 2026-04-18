@test
Feature: fetching User Details
Scenario: testing the get call for User Details
 
Given url 'http://appduv3f36.ibmsl.cloud.test.group:10150/forgot-password'
When request {"email": "SWApp.Test001@naemailteam.co.uk"}
And header Content-Type = 'application/json'
Then method POST
Then status 200