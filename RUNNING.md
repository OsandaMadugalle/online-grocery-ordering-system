Run the web application locally using Maven and Jetty

Prerequisites
- Java JDK 8 or newer installed and JAVA_HOME set
- Maven installed and on PATH

Build and run with Jetty
1. From the project root (this folder), build the project:

   mvn -DskipTests package

2. Run the webapp using the Jetty plugin:

   mvn jetty:run

3. Open http://localhost:8080/ in your browser.

Notes for Eclipse / Tomcat
- This is an Eclipse-style webapp. To run in Eclipse with Tomcat:
  1. Import as Existing Maven Project (File -> Import -> Existing Maven Projects).
  2. Add a Tomcat server in the Servers view and add this project to the server.
