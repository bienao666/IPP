<div align="center">
# IPPrefered IP优选

## 简介
IPPrefered是基于java开发的一个优选CDN的工具，用于测试一些CDN的延迟和下载速度，内置8000+ip，支持手动上传ip文件，优选ip后自动DDNS到CloudFlare，自动设置负载均衡。
</div>

## 功能
* 定时测试ip指定端口的延迟和下载速度
* 定时测试CloudFlare域名解析ip，无效自动更换
* 支持CloudFlare域名解析负载均衡
* wxpushre消息推送

## 部署

###  docker (推荐)
```
# 拉取配置文件并修改配置
cd /root && mkdir ipp && cd ipp && mkdir config && cd config && wget https://raw.githubusercontent.com/bienao666/IPP/main/application.yml
```
```
cd /root
```
```
docker run -itd \
	--restart=always \
	--name ipp \
	-p 8899:8899 \
	-v $PWD/ipp/config:/app/config \
	-v $PWD/ipp/log:/app/log \
	bienao666/ippreferred:latest
```

### exe程序
待打包

## 参数说明
```
server:
  port: 8899
  servlet:
    context-path: /ipprefered #请求路径，可以自定义
  tomcat:
    max-swallow-size: -1
  shutdown: graceful

spring:
  datasource:
    url: jdbc:sqlite:D:/db.sqlite #linux jdbc:sqlite:/app/db.sqlite  windows：jdbc:sqlite:D:/db.sqlite
    driver-class-name: org.sqlite.JDBC
    initialSize: 5
    minIdle: 5
    maxActive: 20
    maxWait: 60000
    timeBetweenEvictionRunsMillis: 60000
    minEvictableIdleTimeMillis: 300000
    validationQuery: SELECT 1
    testWhileIdle: true
    testOnBorrow: false
    testOnReturn: false
    poolPreparedStatements: true
    maxPoolPreparedStatementPerConnectionSize: 20
    useGlobalDataSourceStat: true
    connectionProperties: druid.stat.mergeSql=true;druid.stat.slowSqlMillis=500
  sql:
    init:
      mode: always
      continue-on-error: true
      data-locations: classpath:db/init.sql
      schema-locations: classpath:db/create.sql

mybatis:
  type-aliases-package: com.bienao.ippreferred.entity
  mapper-locations: classpath:mapper/*.xml
#  configuration:
#    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl

logging:
  config: classpath:log.xml

cf:
  email:  #cloudflare账号
  token:  #cloudflare令牌
  zone:  #cloudflare三级域名(DNS记录)

wxpusher: #消息推送 https://wxpusher.zjiecode.com/admin/
  token:  #wxpusher 令牌
  uid:  #wxpusher推送用户id

testPort: 2052 #测试端口,不填默认2052
enableTLS: false #是否开启tls
threadCount: 50 #测试线程数，不填默认50
enablePushNormal: false #填 true 域名定时测试都会推送，填 false 不推送，5分钟一次，建议关闭
enablePushInvalid: true #填 true 域名测试失败才会推送，填 false 不推送
```
## 接口使用

### 上传txt
txt内容格式一行一个ip，调用方式我用Apifox做示例

```
http://ip:端口/ipprefered/file/upload
```

<img width="100" src="https://pic.sl.al/gdrive/pic/2023-06-17/648dd275aa7e5.png">