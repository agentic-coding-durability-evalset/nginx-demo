# check the nginx configuration for syntax errors and validity
test:
    nginx -t -c "{{ justfile_directory() }}/conf/nginx.conf"

# start simple http server
start:
    /usr/local/bin/nginx -c "{{ justfile_directory() }}/conf/nginx.conf" -g "pid /usr/local/var/run/nginx.pid;"

# stop the nginx server gracefully
stop:
    kill -QUIT $(\cat /usr/local/var/run/nginx.pid)

# reload the nginx server configuration without downtime
reload:
    nginx -s reload

# interate with container shell
container-shell:
    docker compose exec -it openresty bash
