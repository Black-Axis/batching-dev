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

    echo # Avoid your project being littered with annoying .DS_Store files!
    echo ###############################################
    echo.
    echo .DS_Store
    echo .prettierignore

    echo node_modules
    echo /.vscode/*
    echo !.vscode/settings.json
    echo.

    echo # Add your custom under the following line
    echo ###############################################
) > .gitignore

echo Files generated successfully.
