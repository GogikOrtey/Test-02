@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
set /p commitMessage="Описание коммита: "
if "!commitMessage!"=="" (
    for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
    set datetime=!datetime:~6,2!.!datetime:~4,2!.!datetime:~0,4! - !datetime:~8,2!:!datetime:~10,2! - no description
    set commitMessage=!datetime!
)
git add .
git commit -m "%commitMessage%"
echo.
echo Отправка коммита в GitHub...
echo.
git push origin main
echo commitMessage = "%commitMessage%"
echo.
echo Коммит успешно создан и отправлен
timeout /t 2 >nul
exit
