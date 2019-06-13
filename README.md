# Policr Bot [![Build Status](https://github-ci.bluerain.io/api/badges/Hentioe/policr/status.svg)](https://github-ci.bluerain.io/Hentioe/policr)

大概是 Telegram 平台最强大的审核机器人

## 介绍

Policr 的设计原则是专注，定制和私有部署。核心审核功能完备且复杂，能应对各种意外情况。支持多种验证方式：例如主动验证，自定义验证，求解数学公式类的纯动态验证，还有类似 Google 的图片验证等。

之所以称之为最强大，这也是核心原因。如果不是，请打醒。

**注意**：无论是官网还是本页面都可能是过时的，想知道最新功能请关注更新频道。

### 功能概括

Policr 的主要作用和目的是排除潜在的加群机器人。它通过强制要求入群用户完成验证做到这一点。虽然并非本项目所期待的目的，但因为高定制性，也被用来提高入群门槛，设定专业问题。

由于高度抽象的设计，支持新的验证方式变得非常容易。本项目会考虑一切值得推荐的验证机制，但不会支持验证码（[原因请看这里](https://policr.bluerain.io#verification_code)）。

全网黑名单功能是值得考虑的，但不会是现在提供。类似 `CNBlacklistR` 这种简单又不透明的黑名单功能，意义不大。**还会被质疑操作透明性**。这个前车之鉴证明了这个功能确实需要进一步思考。

### 开发技术

得益于原生语言 Crystal 的优势，机器人实例能以极低的成本高效率执行。编译完成后的二进制只有区区 4.9MB 大小，内存占用不超过 10MB，在保持低资源占用的同时能处理超高并发量的消息。

不同于很多使用 Python 编写的将处理逻辑都集中于一个文件的简单机器人，此项目源码有清晰的文件结构和良好的消息处理单元抽象，具备很高的扩展性和可维护性。能在不侵入已有功能代码的情况下进行扩展和定制。

如果你对 Crystal 编程语言感兴趣，不妨加入我们的交流群：[Crystal China](https://t.me/crystal_cn)。如果你对机器人开发有兴趣则加入下面**需知**中提到的交流群。

## 使用&部署

**相关说明已经全部迁移到官网首页**，请访问[这里](https://policr.bluerain.io)。

## 需知

- 加入我们的讨论组交流机器人开发并建设社区：[PolicrBot Community](https://t.me/policr_community)
- 务必关注功能更新频道掌握最新的变化和通知：[PolicrBot Changelog](https://t.me/policr_changelog)
- 最佳的贡献方式是[**反馈有价值的建议**](https://github.com/Hentioe/policr/issues)，而不是试图提交代码

## TODO

- [x] 后台管理
  - [x] 登录页
  - [x] 申请令牌
  - [ ] 高级管理
- [x] 国际化支持
  - [x] 简体中文
  - [ ] 繁体中文
  - [ ] 英文
