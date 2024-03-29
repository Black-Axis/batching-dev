@echo off

echo Generating files ...

set "TAB=    "

@REM For creating .gitignore file with its content
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

echo ✨ .stylelintrc file was created successfully!

@REM For creating folder src with its content
@REM For creating folder public with its content
(

    @REM Create directories for source files
    mkdir src\styles 2>nul

    mkdir src\scss 2>nul

    mkdir src\js 2>nul

    mkdir src\pug-js 2>nul

    mkdir src\pug-js\mixins 2>nul

    mkdir src\pug-js\mixins\global 2>nul

    mkdir src\pug-js\mixins\meta 2>nul

    @REM Create directories for public assets
    mkdir public\assets\favicons 2>nul

    mkdir public\assets\fonts 2>nul

    mkdir public\assets\images 2>nul
)

echo ✨ src folder was created successfully!
echo ✨ public folder was created successfully!

@REM For creating package.json file with its content
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

echo ✨ package.json file was created successfully!

@REM Define the content of the src/pug-js/mixins/global/_space.pug file
(
    echo mixin space^(^)
    echo    ^=^ " "
    echo    ^|
    echo    ^|
) > "src\pug-js\mixins\global\_space.pug"

echo ✨ _space.pug file was created successfully!

@REM Define the content of the src/pug-js/mixins/global/_no-script.pug file
(
    echo include ./_space
    echo.
    echo mixin no-script^(^)
    echo.
    echo    +space^(^)
    echo.
    echo    noscript You need to enable JavaScript to run this app.
) > "src\pug-js\mixins\global\_no-script.pug"

echo ✨ _no-script.pug file was created successfully!

@REM Define the content of the src/pug-js/mixins/global/index.pug file
(
    echo include ./_no-script
    echo include ./_space
) > "src\pug-js\mixins\global\_index.pug"

echo ✨ index.pug file of global directory was created successfully!

@REM Define the content of the src/pug-js/mixins/meta/_meta.pug file
(
    echo include ../global/_space
    echo.
    echo mixin meta-data^(^author ^=^ "Author Name"^)
    echo     meta^(^charset^=^"UTF-8")
    echo     meta^(^http-equiv^=^"Content-Type" content="text/html;charset=UTF-8")
    echo     meta^(^http-equiv^=^"X-UA-Compatible" content="ie=edge")
    echo     meta^(^http-equiv^=^"X-UA-Compatible" content="IE=7")
    echo     meta^(^name^=^"viewport" content="width=device-width, initial-scale=1.0")
    echo     +space^(^)
    echo     meta^(^name^=^"author" content=author)
    echo     +space^(^)
    echo.

    echo mixin meta-desc^(^contentOfDescription^)
    echo     meta^(^name^=^"description" content=contentOfDescription)
    echo     +space^(^)
    echo.

    echo mixin meta-words^(^words^)
    echo     meta^(^name^=^"keywords", content=words)
    echo     +space^(^)
    echo.

    echo mixin meta-theme^(^color^)
    echo     meta^(^name^=^"theme-color" content=color)
    echo     +space^(^)
    echo.
) > "src\pug-js\mixins\meta\_meta.pug"

echo ✨ meta.pug file of meta directory was created successfully!

@REM Define the content of the src/pug-js/mixins/meta/_index.pug file
(
    echo include ./_meta
) > "src\pug-js\mixins\meta\_index.pug"

echo ✨ index.pug file of global directory was created successfully!

@REM Define the content of the src/pug-js/mixins/_index.pug file
(
    echo include ./meta/_index
    echo.
    echo include ./global/_index
) > "src\pug-js\mixins\_index.pug"

echo ✨ index.pug file of mixins directory was created successfully!

@REM For creating folder src with its content
@REM For creating folder public with its content
(

    @REM Create directories for source files
    mkdir src\styles 2>nul

    mkdir src\scss\components 2>nul

    mkdir src\scss\vendors 2>nul

    mkdir src\scss\layout 2>nul

    mkdir src\scss\pages 2>nul
)

@REM Define the content of the src/scss/components/_index.scss file
echo. > "src\scss\components\_index.scss"

echo ✨ index.scss file of components directory was created successfully!

@REM Define the content of the src/scss/vendors/_index.scss file
echo. > "src\scss\vendors\_index.scss"

echo ✨ index.scss file of vendors directory was created successfully!

@REM Define the content of the src/scss/layout/_index.scss file
echo. > "src\scss\layout\_index.scss"

echo ✨ index.scss file of layout directory was created successfully!

@REM Define the content of the src/scss/pages/_index.scss file
echo. > "src\scss\pages\_index.scss"

echo ✨ index.scss file of pages directory was created successfully!

@REM Define the content of the src/scss/index.scss file
(
    echo @use "../../node_modules/sass-pire/src/sass-pire.scss" as *;
    echo.
    echo @use "./vendors";
    echo.
    echo @use "./layout";
    echo.
    echo @use "./components";
    echo.
    echo @use "./pages";
) > "src\scss\index.scss"

echo ✨ index.scss file of scss directory was created successfully!

@REM Define the content of the src/pug-js/index.pug file
(
    echo include ./mixins/_index
    echo.
    echo doctype html
    echo html^(^lang^=^"en")
    echo.
    echo head
    echo     +meta-data^(^"Khaled Mohamed")
    echo     +meta-desc^(^"Just a description for Manage Landing Page project as landing page!")
    echo     +meta-words^(^"HTML, PugJS, CSS, SCSS, PostCSS")
    echo     +meta-theme^(^"")
    echo.
    echo     link^(^rel^=^"shortcut icon" href="./public/assets/favicons/favicon.ico" type="image/x-icon")
    echo     link^(^rel^=^"manifest" href="./public/assets/favicons/site.webmanifest")
    echo.
    echo     +space^(^)
    echo.
    echo     title 
    echo.
    echo     +space^(^)
    echo     link^(^rel^=^"stylesheet" href="./public/index.css")
    echo.
    echo body
    echo     main^(^class^=^"main" id="main")
    echo.
    echo     +space^(^)
    echo.
    echo     +no-script^(^)
) > "src\pug-js\index.pug"

echo ✨ index.pug file was created successfully!

@REM Generate LICENSE.md file with its content
for /F "tokens=1,2,3 delims=/" %%a in ("%DATE%") do (
    set "current_year=%%c"
)

@REM Define TAB as a tab character
for /f "delims=" %%t in ('forfiles /p "%~dp0." /m "%~nx0" /c "cmd /c echo/09"') do set "TAB=%%t"

(
    echo MIT License
    echo.
    echo Copyright ^(^c^)^ %current_year% Khaled Mohamed
    echo.
    echo Permission is hereby granted, free of charge, to any person obtaining a copy
    echo of this software and associated documentation files ^(^the "Software"^)^, to deal
    echo in the Software without restriction, including without limitation the rights
    echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    echo copies of the Software, and to permit persons to whom the Software is
    echo furnished to do so, subject to the following conditions:
    echo.

    echo The above copyright notice and this permission notice shall be included in all
    echo copies or substantial portions of the Software.

    echo.
    echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    echo SOFTWARE.
) > LICENSE.md

echo ✨ LICENSE.md file was created successfully!

@REM Add SECURITY.md file with its content
(
    echo # Reporting Security Issues
    echo.

    echo We take security issues in our project seriously. We appreciate your efforts to responsibly disclose your findings, and will make every effort to acknowledge your contributions.
    echo.

    echo To report a security issue, email ^[^k.mohamed.11.98@gmail.com^]^(^mailto:k.mohamed.11.98@gmail.com^)^ and include the word "SECURITY-SASS-Pire" in the subject line.
    echo.

    echo We'll endeavor to respond quickly, and will keep you updated throughout the process.
    echo.
) > SECURITY.md

echo ✨ SECURITY.md file was created successfully!

@REM Add .stylelintrc file with its content
@echo off

rem Echo the content directly into the .stylelintrc file
(
    echo { 
    echo     "plugins": ["stylelint-scss"],
    echo     "extends": ["stylelint-config-standard", "stylelint-config-standard-scss"],
    echo     "ignoreFiles": ["dist/styles.css", "dist/test-styles.css", "dist/styles.min.css"],
    echo     "rules": {
    echo         "indentation": 4,
    echo         "max-empty-lines": 1,
    echo         "number-max-precision": 3,
    echo         "declaration-no-important": true,
    echo         "declaration-block-no-duplicate-properties": true,
    echo         "declaration-block-single-line-max-declarations": 1,
    echo         "declaration-block-trailing-semicolon": "always",
    echo         "declaration-colon-space-before": "never",
    echo         "declaration-colon-space-after": "always",
    echo         "no-extra-semicolons": true,
    echo         "font-weight-notation": "numeric",
    echo         "property-case": "lower",
    echo         "selector-type-case": "lower",
    echo         "function-name-case": "lower",
    echo         "value-keyword-case": "lower",
    echo         "at-rule-no-unknown": null,
    echo         "string-quotes": "double",
    echo         "scss/selector-no-redundant-nesting-selector": true,
    echo         "block-no-empty": true,
    echo         "comment-no-empty": true,
    echo         "at-rule-name-case": "lower",
    echo         "at-rule-semicolon-newline-after": "always",
    echo         "comment-empty-line-before": "always",
    echo         "color-hex-case": "lower",
    echo         "color-hex-length": "long",
    echo         "color-named": "never",
    echo         "unit-case": "lower",
    echo         "no-empty-source": null
    echo     }
    echo }
) > .stylelintrc

echo ✨ .stylelintrc file was created successfully!

@REM All packages will be needed in the project
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

echo ✨ All packages was installed successfully!

echo All files were generated successfully! ✨

echo Hack your world strongly! ✨

code .
