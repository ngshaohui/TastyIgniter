# TastyIgniter

## Docker

```bash
docker compose up -d
```

```bash
docker compose exec php-apache php artisan igniter:install
```

## Xdebug

This project has been set up with Xdebug for VSCode.

### Setup

The TastyIgniter `.tar.gz` file needs to be extracted to the workspace's root directory.

`.vscode/launch.json`

```json
"pathMappings": {
    "/var/www/html/": "${workspaceFolder}/TastyIgniter-3.7.6"
}
```

### Start

From the "Run and Debug" tab, select "Listen for Xdebug" and select "Start Debugging" via the green play button.

## Notes

Have to run `php artisan igniter:install` after `docker compose up -d` since the `--no-interaction` flag seems to cause the script to fail. Not sure if worth debugging.

## License

License retained from original tastyigniter repo since this repo contains its source code.
