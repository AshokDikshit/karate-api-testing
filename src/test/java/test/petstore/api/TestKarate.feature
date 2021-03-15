@test
Feature: fetching User Details
Scenario: testing the get call for User Details
* def endpoints = read (apiLocation+'endpoints.json')
* def reqbody = read (requestLocation+'petstore.body.json')
Given url baseURI
And path endpoints.petstore
When method GET
Then status 200
