<div align="center">

# IPPrefered IP优选

## 简介
IPPreferedV2.0是基于java开发的一个优选CDN的工具，用于测试一些CDN的延迟和下载速度，内置40000+CDN，支持手动上传ip文件，优选ip后自动DDNS到CloudFlare，自动设置负载均衡。

[Telegram 群组](https://t.me/bienao_airport)
</div>

## 1.功能
* 定时测试ip指定端口的延迟和下载速度
* 定时测试CloudFlare域名解析ip，无效自动更换
* 支持CloudFlare域名解析负载均衡
* wxpushre消息推送

## 2.部署
```
wget https://raw.githubusercontent.com/bienao666/IPP/main/install.sh && chmod 777 install.sh && bash install.sh
```

## 3.展示

### 3.1 cloudflare负载均衡

#### 3.1.1 失效自动更新

<img src="https://pic.sl.al/gdrive/pic/2023-06-18/648f0d2658929.png">

#### 3.1.2 负载均衡新增

<img src="https://pic.sl.al/gdrive/pic/2023-06-18/648f0d278f7e7.png">

#### 3.1.3 负载均衡删除(CDN无效同时数据库无可用ip)

<img src="https://pic.sl.al/gdrive/pic/2023-06-18/648f14cd8c450.png">

### 3.2 消息推送

### 3.2.1 失效自动更新

<img width="50%" src="https://pic.sl.al/gdrive/pic/2023-06-18/648f1584001b5.jpg">

### 3.2.2 负载均衡新增



### 3.2.3 负载均衡删除(CDN无效同时数据库无可用ip)

<img width="50%" src="https://pic.sl.al/gdrive/pic/2023-06-18/648f1581def97.jpg">

## 4.常见问题

