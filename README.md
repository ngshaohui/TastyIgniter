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

## Usage

A theme needs to be installed first before TastyIgniter can be used.

The only theme that is available is the "Orange Theme" which can be found by navigating to `/admin/themes` and installing it.

After installation, it still needs to be activated via the star icon.

```
The following required extensions must be installed before activating this theme, igniter.cart, igniter.coupons, igniter.frontend, igniter.local, igniter.pages, igniter.payregister, igniter.reservation, igniter.user
```

This needs extensions to be installed `/admin/extensions`.

## Rate limiting

Laravel's rate limiting can be reset by running the `cache:clear` command in the container

```bash
docker compose exec php-apache php artisan cache:clear
```

## Notes

Have to run `php artisan igniter:install` after `docker compose up -d` since the `--no-interaction` flag seems to cause the script to fail. Not sure if worth debugging.

## License

License retained from original tastyigniter repo since this repo contains its source code.
