# Start with a base image containing Java runtime
FROM amazoncorretto:17-alpine

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 80

# The application's jar file     target是当前目录下的 target文件夹, 生成的jar在那
ARG JAR_FILE=target/*.jar

# Add the application's jar to the container
ADD ${JAR_FILE} app.jar

# Run the jar file               执行命令java  也就是java虚拟机 运行jar包
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
