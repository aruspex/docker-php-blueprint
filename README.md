# Blueprint for fpm/nginx docker-based projects

* rename project_name to actual project name
* save `.env.default` as `.env` and populate variables
* create `web` directory inside you `project name` directory, it will be your nginx root
* `./do up`
* now you can write some code into `web` and access it via `localhost:8080`

## Yii2 project example

```bash
./do composer global require "fxp/composer-asset-plugin:^1.2.0"
./do composer create-project --prefer-dist yiisoft/yii2-app-basic .
./do up
```

## TODO

* EXECUTE_AS in composer container