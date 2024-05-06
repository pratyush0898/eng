@echo off

set "version=1.0.0"
if "%1"=="run" (
    REM Check if no arguments are passed
    if "%~1"=="" (
        echo No file specified.
        goto :EOF
    )

    REM Check if the file extension is .eng
    set "filename=%~1"
    set "extension=%filename:~-4%"
    if /I "%extension%" NEQ ".eng" (
        echo Only .eng files are supported.
        goto :EOF
    )

    REM Replace file-name.eng in index.js with the provided file name
    set "search=file-name.eng"
    set "replace=%filename%"
    set "textfile=C:/Program Files/Command prompt/Eng/index.js"
    set "newfile=C:/Program Files/Command prompt/Eng/Cache/script.js"
    (for /f "usebackq delims=" %%i in ("%textfile%") do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        echo(!line:%search%=%replace%!
        endlocal
    )) > "%newfile%"

    REM Execute script.js
    node "%newfile%"
)
if "%1"=="--help" (
    echo ENG v%ver% Help
    echo Usage: eng [options] [filename]
    echo.
    echo Options:
    echo   run <file_name.eng>          Run the .eng files  
    echo   --help                       Display this help message
    echo   --license                    Display license information
    echo   --version                    Display current version of eng
    echo.
    echo   
    echo   ENG is a programming language designed to use pure English words.
    echo   Run your ENG program by providing the filename as an argument.
    goto :EOF
)
if "%1"=="-help" (
    echo ENG v%version% Help
    echo Usage: eng [options] [filename]
    echo.
    echo Options:
    echo   run <file_name.eng>          Run the .eng files  
    echo   --help                       Display this help message
    echo   --license                    Display license information
    echo   --version                    Display current version of eng
    echo.
    echo   
    echo   ENG is a programming language designed to use pure English words.
    echo   Run your ENG program by providing the filename as an argument.
    goto :EOF
)
if "%1"=="-h" (
    echo ENG v%version% Help
    echo Usage: eng [options] [filename]
    echo.
    echo Options:
    echo   run <file_name.eng>          Run the .eng files  
    echo   --help                       Display this help message
    echo   --license                    Display license information
    echo   --version                    Display current version of eng
    echo.
    echo   
    echo   ENG is a programming language designed to use pure English words.
    echo   Run your ENG program by providing the filename as an argument.
    goto :EOF
)
if "%1"=="--license" (
    echo License
    echo This program is licensed under the Apache 2.0 License.
    echo For details, see the LICENSE file.
    goto :EOF
)
if "%1"=="-license" (
    echo License
    echo This program is licensed under the Apache 2.0 License.
    echo For details, see the LICENSE file.
    goto :EOF
)
if "%1"=="-l" (
    echo License
    echo This program is licensed under the Apache 2.0 License.
    echo For details, see the LICENSE file.
    goto :EOF
)
if "%1"=="--version" (
    echo The current version of eng is %version%
)
if "%1"=="-version" (
    echo The current version of eng is %version%
)
if "%1"=="-v" (
    echo The current version of eng is %version%
)

echo Welcome to ENG v%version% 
echo Type ".--help" for more information.
