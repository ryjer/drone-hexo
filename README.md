# drone-hexo

![buildx](https://github.com/ryjer/docker-opentracker/workflows/buildx/badge.svg)
[![Docker Stars](https://img.shields.io/docker/stars/ryjer/drone-hexo.svg)](https://hub.docker.com/r/ryjer/drone-hexo/)
[![Docker Pulls](https://img.shields.io/docker/pulls/ryjer/drone-hexo.svg)](https://hub.docker.com/r/ryjer/drone-hexo/)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

中文用法请下翻
## Usage

Drone plugin to run Hexo commands.
This plugin provides a hexo-cli envirnoment. Other plugins are needed in the drone pipeline to publish and deploy.

```yaml
kind: pipeline
name: default

steps:
- name: hexo generate
  image: ryjer/drone-hexo
  commands:
    - npm install
    - hexo g
```

## 用法

本插件在nodejs镜像的基础上安装了hexo-cli 和 git，提供了完整的 hexo-cli 运行环境。自带的 git 用于安装主题以及 git 部署（插件是 `hexo-deployer-git`），从而可以完整实现一个hexo博客从安装主题、构建到git部署的整个过程。

要运行一个完整的pipeline（流水线），你还需要其他drone插件的帮助。在 Drone pipeline中，本插件的单步命令如下（前2行为全局配置）：

``` yaml
kind: pipeline
name: default

steps:
- name: hexo generate
  image: ryjer/drone-hexo
  commands:
    - npm install
    - hexo g
```
**如果你的 drone runner 位于中国，可能会受到国际带宽的限制使得npm install命令下载缓慢。不过淘宝提供了一个npm镜像源，你需要在一开始配置淘宝的 npm 源**

配置淘宝 npm 源的命令为： **npm config set registry https://registry.npm.taobao.org** 示例如下：

``` yaml
kind: pipeline
name: default

steps:
- name: hexo generate
  image: ryjer/drone-hexo
  commands:
    - npm config set registry https://registry.npm.taobao.org
    - npm install
    - hexo g
```
