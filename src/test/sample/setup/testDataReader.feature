Feature: Define all functions and variable to access in test feature files

Scenario:
* print 'Environment is: ',env
* def requestLocation = 'classpath:'+env+'/data/request/'
* def responseLocation = 'classpath:'+env+'/data/request/'
* def testCase = read('classpath:testData/getBalances/requestFiles/testCases.json')

* def isValidCurrency = read('classpath:testData/getBalances/responseFiles/validCurrency.js')
* def isValidCreditIndi = read('classpath:testData/getBalances/responseFiles/validCreditIndicatorName.js')
* def isValidDate = read('classpath:testData/getBalances/responseFiles/validDate.js')

* def creditLineSchema = read('classpath:testData/getBalances/responseFiles/creditLineSchema.json')
* def validbalanceShadow1 = read('classpath:testData/getBalances/responseFiles/validbalanceShadow1.json')
* def validbalance1 = read('classpath:testData/getBalances/responseFiles/validbalance1.json')
* def validbalance2 = read('classpath:testData/getBalances/responseFiles/validbalance2.json')
* def validbalance3 = read('classpath:testData/getBalances/responseFiles/validbalance3.json')
 * def validbalance4 = read('classpath:testData/getBalances/responseFiles/validbalance4.json')
* def validbalanceShadow3 = read('classpath:testData/getBalances/responseFiles/validbalanceShadow3.json')
* def errorSchemaGateway =
"""
{
    "code": "401",
    "gtid": "#string",
    "tid": "#string",
    "httpReason": "Unauthorized",
    "error": "application is not registered, or active"
}
"""

* def errorSchemaGateway403 =
"""
 {
    "code": "403",
    "gtid": "#string",
    "tid": "#string",
    "httpReason": "Forbidden",
    "error": "Internal Server Error"
}
"""
* def errorSchemaGateway400 =
"""
{
    "code": "400",
    "gtid": "#string",
    "tid": "#string",
    "httpReason": "Bad Request",
    "error": "Error verifying access token"
}
"""


* def updatedToken =
"""
function(a , b) {
  var res = b.split(".");
  var updatedToken = '';
  for( i = 0; i < res.length; i++){
    var p = '';  
  if(a == i)
  {
  p = res[i]+'abc';
  }
  else{
  p = res[i];
  }
  if(updatedToken == ''){
  updatedToken = p;
  }
  else{
  updatedToken = updatedToken + '.'+ p;
  }
  } 
  return updatedToken;
}
"""

* def invalidToken =
"""
function(b) {
  var res = b.split(" ");
  var updatedToken = '';
  updatedToken = res[0] + " " + "abc" + res[1]; 
  return updatedToken;
}
"""