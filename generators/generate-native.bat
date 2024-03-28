@echo off

echo Generating files ...

set "TAB=    "

rem For creating .gitignore file with its content
(
    echo # Avoid accidental upload of the Sketch and Figma design files
    echo #####################################################
    echo.
    echo *.sketch
    echo *.fig
    echo.

    echo # Avoid accidental XD upload if you convert the design file
    echo ###############################################
    echo.
    echo *.xd
    echo.

    echo # Avoid all following files
    echo ###############################################
    echo.
    echo .DS_Store
    echo .prettierignore
    echo Thumbs.db
    echo.

    echo node_modules
    echo /.vscode/*
    echo !.vscode/settings.json
    echo.

    echo *.sublime-project
    echo *.sublime-workspace
    echo *.idea/
    echo.

    echo *.suo
    echo *.ntvs*
    echo *.log
    echo *.log.*
    echo *.tmp
    echo.

    echo .env
    echo .env.local
    echo .env.*.local
    echo .env.test
    echo .env.production

    echo.
    echo /bower_components/
    echo *.pyc
    echo *.class
    echo *.jar
    echo.

    echo # Add your custom under the following line
    echo ###############################################
) > .gitignore

rem For creating folder src with its content
rem For creating folder public with its content
(

    rem Create directories for source files
    mkdir src\styles 2>nul

    if errorlevel 1 (
        echo Failed to create src\styles directory.
    ) else (
        echo src\styles directory created successfully.
    )

    mkdir src\scss 2>nul

    if errorlevel 1 (
        echo Failed to create src\scss directory.
    ) else (
        echo src\scss directory created successfully.
    )

    mkdir src\js 2>nul

    if errorlevel 1 (
        echo Failed to create src\js directory.
    ) else (
        echo src\js directory created successfully.
    )

    rem Create directories for public assets
    mkdir public\assets\favicons 2>nul

    if errorlevel 1 (
        echo Failed to create public\assets\favicons directory.
    ) else (
        echo public\assets\favicons directory created successfully.
    )

    mkdir public\assets\fonts 2>nul

    if errorlevel 1 (
        echo Failed to create public\assets\fonts directory.
    ) else (
        echo public\assets\fonts directory created successfully.
    )

    mkdir public\assets\images 2>nul

    if errorlevel 1 (
        echo Failed to create public\assets\images directory.
    ) else (
        echo public\assets\images directory created successfully.
    )
)

rem For creating package.json file with its content
(
    echo {
        echo %TAB%"name": "",
        echo %TAB%"version": "0.0.1",
        echo %TAB%"description": "",
        echo %TAB%"markdown": "github",
        echo %TAB%"license": "MIT",
        echo %TAB%"main": "index.js",
        echo %TAB%"licenses": [
            echo %TAB%%TAB%{
            echo %TAB%%TAB%%TAB%"type": "MIT",
            echo %TAB%%TAB%%TAB%"url": "https://opensource.org/license/mit/"
            echo %TAB%%TAB%}
        echo %TAB%],
        echo %TAB%"author": "Khaled Mohamed <k.mohamed.11.98@gmail.com> (https://github.com/krypton225)",
        echo %TAB%"contributors": [
            echo %TAB%%TAB%"Khaled Mohamed"
        echo %TAB%],
        echo %TAB%"bugs": {
            echo %TAB%%TAB%"url": ""
        echo %TAB%},
        echo %TAB%"keywords": [
            echo %TAB%%TAB%"SCSS",
            echo %TAB%%TAB%"SASS",
            echo %TAB%%TAB%"JavaScript",
            echo %TAB%%TAB%"PostCSS"
        echo %TAB%],
        echo %TAB%"repository": {
        echo %TAB%%TAB%"url": "",
        echo %TAB%%TAB%"type": "git"
        echo %TAB%},
        echo %TAB%"scripts": {
            echo %TAB%%TAB%"dev": "concurrently --prefix-colors=\"magenta,cyan,yellow,blue\" \"npm run postcss:watch\" \"npm run pug-js\" \"npm run server\" \"npm run watcher\"",
            echo %TAB%%TAB%"start": "concurrently --prefix-colors=\"magenta,cyan,yellow\" \"npm run server\" \"npm run postcss:watch\"",
            echo %TAB%%TAB%"watcher": "concurrently --prefix-colors=\"red\" \"npm run sass:watch\"",
            echo %TAB%%TAB%"postcss:watch": "postcss src/styles/*.css --dir public --use autoprefixer cssnano --watch",
            echo %TAB%%TAB%"sass:watch": "sass --no-source-map ./src/scss/:src/styles/ --watch",
            echo %TAB%%TAB%"server": "live-server --open=./index.html",
            echo %TAB%%TAB%"pug-js": "pug ./src/pug-js/index.pug --out ./ --watch --pretty",
            echo %TAB%%TAB%"upgrade": "ncu --upgrade",
            echo %TAB%%TAB%"lint": "npx stylelint ./src/scss/**/*.scss",
            echo %TAB%%TAB%"tags": "git push repo --tags",
            echo %TAB%%TAB%"gen:lock": "npm i --package-lock-only"
        echo %TAB%}
    echo }
) > package.json

rem All packages will be needed in the project
npm i -D autoprefixer ^
  concurrently ^
  cssnano ^
  live-server ^
  npm-check-updates ^
  postcss ^
  postcss-cli ^
  postcss-preset-env ^
  pug ^
  pug-cli ^
  sass ^
  sass-pire ^
  stylelint ^
  stylelint-config-standard-scss
rem npm i -D autoprefixer concurrently cssnano live-server npm-check-updates postcss postcss-cli postcss-preset-env pug pug-cli sass sass-pire stylelint stylelint-config-standard-scss

echo Files generated successfully!
echo Hack your world strongly!
