# Nginx Demo

A Web server configuration demo project based on [Nginx](https://nginx.org/) and [OpenResty](https://openresty.org/). Demonstrates how to use Nginx/OpenResty for reverse proxy, load balancing, and Lua script extensions.

## Tech Stack

- **Nginx**: Web server
- **OpenResty**: Web platform based on Nginx, integrated with LuaJIT
- **Docker**: Containerized deployment
- **Lua**: Scripting language (via OpenResty)

## Project Structure

```
nginx-demo/
├── conf/
│   ├── nginx.conf        # Nginx main configuration file
│   └── mime.types        # MIME type configuration
├── www/                  # Web root directory
│   └── index.html        # Example HTML file
├── docker-compose.yaml   # Docker Compose configuration
├── justfile              # Just build tool configuration
└── README.md
```

## Features

- Nginx reverse proxy
- Static file serving
- OpenResty Lua support
- Docker containerization
- Configuration examples

## Quick Start

### Prerequisites

- Docker and Docker Compose

### Installation and Running

```bash
# Start Nginx server
docker compose up -d

# View logs
docker compose logs -f

# Stop server
docker compose down
```

The server will start at `http://localhost:9080`.

### Access Application

Open browser and visit:
- **Home**: http://localhost:9080
- **Static files**: http://localhost:9080/index.html

## Project Features

### Nginx Configuration

Main configuration file `conf/nginx.conf` includes:
- Server block configuration
- Location block configuration
- Static file serving
- Logging configuration

### OpenResty Features

OpenResty provides additional functionality:
- **Lua Scripts**: Run Lua code in Nginx
- **Dynamic Configuration**: Runtime configuration modifications
- **Extension Modules**: Rich third-party modules

## References

- [Nginx Documentation](https://nginx.org/en/docs/)
- [OpenResty Official Website](https://openresty.org/)
- [OpenResty Package Manager](https://opm.openresty.org/)
- [docker-openresty](https://github.com/openresty/docker-openresty)
- [OpenResty Lua Documentation](https://github.com/openresty/lua-nginx-module)
