@echo off

REM Define the GitHub repository URL and folder path
set "github_url=https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/pratyush0898/eng/tree/main/debug/eng"

REM Define the directory where you want to extract the contents
set "extract_dir=C:\Program Files\Command prompt\Eng"

REM Define the name of the directory containing your program
set "program_dir=Eng"

REM Download the folder using wget or curl
wget -r -np -nH --cut-dirs=1 -P "%extract_dir%" "%github_url%" || curl -L "%github_url%" --output "%extract_dir%"

REM Update the PATH environment variable to include the directory with your program
setx PATH "%PATH%;%extract_dir%\%program_dir%" /m

REM Optionally, set additional environment variables or perform other setup steps

echo Installation completed.
