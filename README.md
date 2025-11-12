# Nginx Demo

一个基于 [Nginx](https://nginx.org/) 和 [OpenResty](https://openresty.org/) 的 Web 服务器配置示例项目。展示了如何使用 Nginx/OpenResty 进行反向代理、负载均衡和 Lua 脚本扩展。

## 技术栈

- **Nginx**: Web 服务器
- **OpenResty**: 基于 Nginx 的 Web 平台，集成了 LuaJIT
- **Docker**: 容器化部署
- **Lua**: 脚本语言（通过 OpenResty）

## 项目结构

```
nginx-demo/
├── conf/
│   ├── nginx.conf        # Nginx 主配置文件
│   └── mime.types        # MIME 类型配置
├── www/                  # Web 根目录
│   └── index.html        # 示例 HTML 文件
├── docker-compose.yaml   # Docker Compose 配置
├── justfile              # Just 构建工具配置
└── README.md
```

## 功能特性

- Nginx 反向代理
- 静态文件服务
- OpenResty Lua 支持
- Docker 容器化
- 配置示例

## 快速开始

### 前置要求

- Docker 和 Docker Compose

### 安装和运行

```bash
# 克隆项目
git clone <repository-url>
cd nginx-demo

# 启动 Nginx 服务器
docker compose up -d

# 查看日志
docker compose logs -f

# 停止服务器
docker compose down
```

服务器将在 `http://localhost:9080` 启动。

### 访问应用

打开浏览器访问：
- **主页**: http://localhost:9080
- **静态文件**: http://localhost:9080/index.html

## 项目特点

### Nginx 配置

主配置文件 `conf/nginx.conf` 包含：
- 服务器块配置
- 位置块配置
- 静态文件服务
- 日志配置

### OpenResty 特性

OpenResty 提供了额外的功能：
- **Lua 脚本**: 在 Nginx 中运行 Lua 代码
- **动态配置**: 运行时配置修改
- **扩展模块**: 丰富的第三方模块

### Docker 部署

使用 Docker Compose 简化部署：
- 预配置的 OpenResty 镜像
- 卷挂载配置和静态文件
- 端口映射

## 配置说明

### Nginx 配置

主要配置项：
- **监听端口**: 9080
- **Web 根目录**: `/usr/local/openresty/nginx/html`
- **日志目录**: `/var/log/nginx`

### 自定义配置

可以修改 `conf/nginx.conf` 来：
- 添加新的 location 块
- 配置反向代理
- 设置负载均衡
- 添加 Lua 脚本

## 开发

### 修改配置

1. 编辑 `conf/nginx.conf`
2. 重启容器：`docker compose restart`

### 添加静态文件

将文件添加到 `www/` 目录，它们会自动被服务。

### Lua 脚本

如果使用 OpenResty，可以添加 Lua 脚本：

```nginx
location /lua {
    content_by_lua_block {
        ngx.say("Hello from Lua!")
    }
}
```

## 常见用例

### 反向代理

```nginx
location /api/ {
    proxy_pass http://backend:8080/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}
```

### 负载均衡

```nginx
upstream backend {
    server backend1:8080;
    server backend2:8080;
}

server {
    location / {
        proxy_pass http://backend;
    }
}
```

### 静态文件缓存

```nginx
location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```

## 参考资源

- [Nginx 文档](https://nginx.org/en/docs/)
- [OpenResty 官方网站](https://openresty.org/)
- [OpenResty 包管理器](https://opm.openresty.org/)
- [docker-openresty](https://github.com/openresty/docker-openresty)
- [OpenResty Lua 文档](https://github.com/openresty/lua-nginx-module)
