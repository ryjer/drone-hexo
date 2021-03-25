# drone-hexo

## Usage

Drone plugin to run Hexo commands.
This plugin provides a hexo-cli envirnoment. Other plugins are needed in the drone pipeline to publish and deploy.

```yaml
kind: pipeline
name: default

steps:
- name: hexo generate
  image: wryjer/hexo
  commands:
    - npm install
    - hexo g
```

## 用法

本插件在nodejs镜像的基础上安装了hexo-cli，提供了完整的 hexo-cli 运行环境。要运行一个完整的pipeline（流水线），你还需要其他drone插件的帮助。在 Drone pipeline中，本插件的单步命令如下（请忽略前2行）：

``` yaml
kind: pipeline
name: default

steps:
- name: hexo generate
  image: wryjer/hexo
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
  image: wryjer/hexo
  commands:
    - npm config set registry https://registry.npm.taobao.org
    - npm install
    - hexo g
```
