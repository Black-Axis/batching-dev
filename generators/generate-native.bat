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

echo Files generated successfully.
