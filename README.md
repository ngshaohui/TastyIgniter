# TastyIgniter

## Docker

```bash
docker compose up -d
```

```bash
docker compose exec php-apache php artisan igniter:install
```

## Notes

Have to run `php artisan igniter:install` after `docker compose up -d` since the `--no-interaction` flag seems to cause the script to fail. Not sure if worth debugging.

## License

License retained from original tastyigniter repo since this repo contains its source code.
