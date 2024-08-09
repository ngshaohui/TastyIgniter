# Engineering notes

## Xdebug

Only requires `RUN pecl install xdebug && docker-php-ext-enable xdebug` in the docker file.

Will also require the `.ini` files

Since the php application exists inside a docker container, it requires

```ini
xdebug.client_host=host.docker.internal
xdebug.start_with_request=yes
```
