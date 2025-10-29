# Nginx configuration

## Tech Stack

- OpenResty 1.27 with LuaJIT
- opm: OpenResty package manager
- Docker Compose: OpenResty testing with container

# Project Structure

```
.
├── conf/             # nginx configuration files
│   └── nginx.conf
    └── certs/        # SSL certificates configuration
        ├── my.example.com.crt
        └── my.example.com.key
├── www/              # web root directory
│   └── index.html
│   └── my.example.com.key
├── docker-compose.yml
```
