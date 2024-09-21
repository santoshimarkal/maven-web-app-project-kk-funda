FROM tomcat:8.0.21-jre8
COPY target/maven-web-appl*.war /usr/local/tomcat/webapps/maven-wed-application.war
