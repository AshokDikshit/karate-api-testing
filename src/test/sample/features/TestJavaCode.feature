@test
Feature: Test Java Code with Karate

Scenario: Calling java functions from karate feature file

* def JavaSupport = Java.type('library.JavaSupport');
* def testJavaObj = new JavaSupport();

Given url 'http://appduv3f36.ibmsl.cloud.test.group:10150/forgot-password'
When request {"email": "SWApp.Test001@naemailteam.co.uk"}
And header Content-Type = 'application/json'
Then method POST

* def result = testJavaObj.setValue('apiStatus',responseStatus);
* def apiStatus = testJavaObj.getValue('apiStatus');
* print 'API status code is ' + apiStatus

Then match apiStatus == 200