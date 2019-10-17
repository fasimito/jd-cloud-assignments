FROM java:8
COPY target/* $work_dir
WORKDIR $work_dir
CMD java -jar jd-cloud-assignments-1.0-SNAPSHOT.war
