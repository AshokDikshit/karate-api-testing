# Karate API Testing Framework

[![Java](https://img.shields.io/badge/Java-8+-orange.svg)](https://www.oracle.com/java/)
[![Karate](https://img.shields.io/badge/Karate-0.9.3-blue.svg)](https://github.com/intuit/karate)
[![Maven](https://img.shields.io/badge/Maven-3.6+-red.svg)](https://maven.apache.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A comprehensive API testing framework built with **Karate DSL** for automated testing of REST APIs. This project provides a robust, scalable solution for API testing with support for multiple environments, parallel execution, and detailed reporting.

## 🚀 Features

- **Multi-Environment Support**: Configurable testing across dev, sit, and e2e environments
- **Parallel Test Execution**: Run tests in parallel for faster feedback
- **Comprehensive Reporting**: Beautiful HTML reports with Cucumber integration
- **Java Integration**: Seamless integration with Java utilities and custom functions
- **Data-Driven Testing**: Support for CSV and JSON data files
- **Flexible Configuration**: Environment-specific endpoints and test data
- **Logging**: Structured logging with Logback and Log4j2
- **CI/CD Ready**: Maven-based build with JUnit integration

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Running Tests](#running-tests)
- [Test Examples](#test-examples)
- [Reporting](#reporting)
- [Contributing](#contributing)
- [License](#license)

## 🔧 Prerequisites

- **Java 8+** - Required for running the framework
- **Maven 3.6+** - For dependency management and build
- **IDE** - IntelliJ IDEA, Eclipse, or VS Code with Java support

## 📁 Project Structure

```
karate-api-testing/
├── pom.xml                           # Maven configuration
├── src/
│   ├── main/java/
│   │   └── library/
│   │       └── JavaSupport.java      # Java utility functions
│   └── test/
│       ├── java/
│       │   ├── features/
│       │   │   ├── petstore/         # Petstore API tests
│       │   │   │   └── scenarios/
│       │   │   │       ├── TestKarate.feature
│       │   │   │       ├── TestKarate2.feature
│       │   │   │       ├── TestKarate3.feature
│       │   │   │       ├── TestKarate4.feature
│       │   │   │       └── TestRunner.java
│       │   │   └── forgerock/        # ForgeRock API tests
│       │   │       └── scenarios/
│       │   │           ├── TestKarate.feature
│       │   │           ├── TestKarate2.feature
│       │   │           ├── TestKarate3.feature
│       │   │           ├── TestKarate4.feature
│       │   │           └── TestRunner.java
│       │   ├── runner/
│       │   │   ├── ParallelTestRunner.java    # Parallel execution runner
│       │   │   └── TestSuiteRunner.java       # Sequential test runner
│       │   └── sample/
│       │       ├── features/         # Sample test scenarios
│       │       │   ├── TestFeatureCalling.feature
│       │       │   ├── TestJavaCode.feature
│       │       │   ├── TestReadFiles.feature
│       │       │   └── TestRunner.java
│       │       └── setup/
│       │           ├── javaClassReader.feature
│       │           ├── testDataReader.feature
│       │           └── TestRunner.java
│       └── resources/
│           ├── karate-config.js       # Global configuration
│           ├── logback-test.xml       # Logging configuration
│           ├── log4j2.properties      # Log4j2 configuration
│           ├── cucumber.xml           # Spring context configuration
│           ├── dev/                   # Development environment data
│           │   ├── api/
│           │   │   └── endpoints.json
│           │   └── data/
│           │       ├── input/
│           │       ├── request/
│           │       └── response/
│           └── sit/                   # SIT environment data
│               ├── api/
│               │   └── endpoints.json
│               └── data/
│                   ├── input/
│                   ├── request/
│                   └── response/
```

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <repository-url>
cd karate-api-testing
```

### 2. Install Dependencies

```bash
mvn clean install
```

### 3. Run Sample Tests

```bash
# Run all tests
mvn test

# Run tests for specific environment
mvn test -Dkarate.env=dev
mvn test -Dkarate.env=sit
mvn test -Dkarate.env=e2e
```

## ⚙️ Configuration

### Environment Configuration

The framework supports multiple environments through `karate-config.js`:

- **dev**: Default development environment
- **sit**: System Integration Testing environment  
- **e2e**: End-to-end testing environment

### Base URLs by Environment

- **dev**: `http://appduv3f36.ibmsl.cloud.test.group:10150`
- **sit**: `http://petstore-demo-endpoint.execute-api.com`
- **e2e**: `http://dummy.restapiexample.com`

### Test Data Organization

Test data is organized by environment:

```
resources/
├── dev/
│   ├── api/endpoints.json        # API endpoints
│   └── data/
│       ├── input/               # Input data files (CSV)
│       ├── request/             # Request payloads (JSON)
│       └── response/            # Expected responses (JSON)
└── sit/
    ├── api/endpoints.json
    └── data/
        ├── input/
        ├── request/
        └── response/
```

## 🏃‍♂️ Running Tests

### Sequential Execution

```bash
# Run using TestSuiteRunner
mvn test -Dtest=TestSuiteRunner
```

### Parallel Execution

```bash
# Run using ParallelTestRunner (2 threads)
mvn test -Dtest=ParallelTestRunner
```

### Environment-Specific Tests

```bash
# Set environment via system property
mvn test -Dkarate.env=sit

# Or set in test runner
System.setProperty("karate.env", "dev");
```

### Tag-Based Execution

```bash
# Run tests with specific tags
mvn test -Dkarate.options="--tags @test"
mvn test -Dkarate.options="--tags ~@ignore"
```

## 📝 Test Examples

### Basic API Test

```gherkin
@test
Feature: User API Testing

Scenario: Get user details
  * def endpoints = read(apiLocation+'endpoints.json')
  Given url baseURI
  And path endpoints.petstore
  When method GET
  Then status 200
```

### Java Integration Test

```gherkin
@test
Feature: Test Java Code with Karate

Scenario: Calling java functions from karate
  * def JavaSupport = Java.type('library.JavaSupport');
  * def testJavaObj = new JavaSupport();
  
  Given url baseURI + '/forgot-password'
  When request {"email": "test@example.com"}
  And header Content-Type = 'application/json'
  Then method POST
  
  * def result = testJavaObj.setValue('apiStatus', responseStatus);
  * def apiStatus = testJavaObj.getValue('apiStatus');
  * print 'API status code is ' + apiStatus
  
  Then match apiStatus == 200
```

### Data-Driven Test

```gherkin
Scenario Outline: Test with multiple data sets
  Given url baseURI
  And request { "email": "<email>", "password": "<password>" }
  When method POST
  Then status <expectedStatus>
  
Examples:
| email              | password   | expectedStatus |
| valid@example.com  | validPass  | 200           |
| invalid@example.com| wrongPass  | 401           |
```

## 📊 Reporting

The framework generates comprehensive HTML reports using Cucumber reporting:

- **Location**: `target/reports/`
- **Report Type**: HTML with charts and statistics
- **Features**: 
  - Test execution summary
  - Pass/Fail statistics
  - Detailed scenario results
  - Screenshots (if configured)
  - Execution timeline

### Viewing Reports

After test execution, open `target/reports/cucumber-html-reports/overview-features.html` in your browser.

## 🔧 Key Dependencies

- **Karate DSL**: 0.9.3 - Core testing framework
- **Cucumber Reporting**: 3.8.0 - HTML report generation
- **Hamcrest**: 1.3 - Assertion library
- **JSON Path**: 2.4.0 - JSON parsing and validation
- **Gson**: 2.6.2 - JSON serialization/deserialization
- **Logback**: Logging framework

## 🏗️ Architecture

### Test Runners

1. **TestSuiteRunner**: Sequential execution for debugging
2. **ParallelTestRunner**: Parallel execution for performance

### Java Utilities

- **JavaSupport**: Utility class for:
  - Base64 encoding for authentication
  - Data storage and retrieval
  - Custom business logic

### Configuration Management

- Environment-specific configurations
- Dynamic base URL selection
- Centralized test data management

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow Karate DSL best practices
- Maintain environment-specific test data
- Add appropriate tags to scenarios
- Update documentation for new features
- Ensure tests pass in all environments

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🏢 Organization

**Lloyds Banking Group**  
Website: [http://www.lloydsbankinggroup.com](http://www.lloydsbankinggroup.com)

## 📞 Support

For questions and support:

1. Check the [Karate Documentation](https://github.com/intuit/karate)
2. Review existing test examples in the `sample/` directory
3. Create an issue for bugs or feature requests

## 🔄 Version History

- **v0.0.1-SNAPSHOT**: Initial release with basic API testing capabilities

---

**Happy Testing! 🎉**
