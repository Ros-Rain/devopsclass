FROM tomcat:8-jre11
LABEL "Project"="VProfile"
LABEL "Author"="rosrain"
RUN rm -rf /usr/local/tomcat/webapps/*
COPY vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

