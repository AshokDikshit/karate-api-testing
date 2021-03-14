@test
Feature: fetching User Details
Scenario: testing the get call for User Details
 
Given url 'http://petstore-demo-endpoint.execute-api.com/petstore/pets'
When method GET
Then status 200