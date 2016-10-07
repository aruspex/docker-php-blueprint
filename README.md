# Blueprint for fpm/nginx docker-based projects

* `./dev.sh init`
* verify `.env` variables
* `./dev.sh up`
* now you can write some code into `web` and access it via `localhost:8080`

## Yii2 project example

```bash
./dev.sh composer global require "fxp/composer-asset-plugin:^1.2.0"
./dev.sh composer create-project --prefer-dist yiisoft/yii2-app-basic .
./dev.sh up
```
