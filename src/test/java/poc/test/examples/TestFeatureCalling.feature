@test
Feature: Validate reading request and response test data from external files

Background:
* def javaClass = callonce read('classpath:com/karate/common/javaClassReader.feature');

Scenario: Testing forgot password api for invalid body 1
When url javaClass.testJavaWithKarate.getURL();
When method GET
Then status 200

Scenario: Testing forgot password api for invalid body 2
When url javaClass.testJavaWithKarate.getURL();
When method GET
Then status 200
