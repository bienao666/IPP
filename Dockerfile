#依赖java8
FROM openjdk:8
#创建者
MAINTAINER bolo.bienao.life
#工作目录
WORKDIR /app
#表示将IPPreferred-0.0.1-SNAPSHOT.jar，也就是项目jar包，拷贝进镜像，并命名为IPPreferred.jar。如果不拷贝，镜像就没jar包可运行了。
ADD IPPreferred-0.0.1-SNAPSHOT.jar /app/IPPreferred.jar
RUN mkdir /app/db && chmod -R 777 /app/db
RUN mkdir /app/config && chmod -R 777 /app/config
#宿主机的jdk目录
ENV JAVA_HOME /usr/local/jdk/
ENV PATH $PATH:$JAVA_HOME/bin
#容器运行后执行的命令。这里就只需要运行jar包就行了。
ENTRYPOINT ["java","-jar","-Duser.timezone=GMT+08","/app/IPPreferred.jar","--spring.config.location=/app/config/application.yml"]