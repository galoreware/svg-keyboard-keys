@echo off
setlocal enabledelayedexpansion
chcp 65001 

:: Loop through letters A-Z
for %%L in (A B C D E F G H I J K L M N Ñ O P Q R S T U V W X Y Z) do (
    echo Generating key for %%L...
    CALL :render %%L
)

echo Done!
pause

:render
magick -weight bold -pointsize 196 -font Nunito-Bold ^
    ( -background none -size 512x512 ..\templates\key.svg ) ^
    ( -gravity center -size 352x300 caption:"%~1" ) -gravity northwest ^
    -geometry +80+54 -composite -flatten ..\keys\%~1.png
