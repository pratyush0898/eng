@echo off

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
set "newfile=C:/Program Files/Command prompt/Eng/script.js"
(for /f "usebackq delims=" %%i in ("%textfile%") do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    echo(!line:%search%=%replace%!
    endlocal
)) > "%newfile%"

REM Execute script.js
node "%newfile%"
