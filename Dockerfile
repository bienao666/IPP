#依赖java8
FROM openjdk:8
#创建者
MAINTAINER bolo.bienao.life
#暴露8899，表示镜像将对外暴露8080端口，也就是编写项目时的运行端口。
#EXPOSE 8899
#挂载目录,表示将镜像的/file文件夹声明为匿名卷。这样做是因为，项目会读写文件系统的/file文件夹，如果不声明，那么项目运行后只会对镜像内的虚拟目录/file读写，而不会对主机的目录读写，等关闭容器后，写的内容就没了。所以，声明匿名卷是为了将写操作持久化。仅仅在dockerfile里声明还不够，在运行容器时还需要设置匿名卷对应的主机目录。
VOLUME /tmp
#表示将IPPreferred-0.0.1-SNAPSHOT.jar，也就是项目jar包，拷贝进镜像，并命名为IPPreferred.jar。如果不拷贝，镜像就没jar包可运行了。
ADD IPPreferred-0.0.1-SNAPSHOT.jar /app/IPPreferred.jar
RUN mkdir /app/db
#宿主机的jdk目录
ENV JAVA_HOME /usr/local/jdk/
ENV PATH $PATH:$JAVA_HOME/bin
#容器运行后执行的命令。这里就只需要运行jar包就行了。
ENTRYPOINT ["java","-jar","-Duser.timezone=GMT+08","/app/IPPreferred.jar","--spring.config.location=/app/config/application.yml"]