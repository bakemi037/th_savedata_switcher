@echo off
setlocal EnableExtensions
chcp 65001 >nul

rem ===== ここだけ変更（thxx）=====
set "GAME=th19"

rem 退避先フォルダ名（ShanghaiAlice直下）
set "DIR_MAIN=stash_main"
set "DIR_SUB=stash_sub"

rem （以下共通）
set "ACTIVE=%GAME%"
set "STASH_MAIN=%DIR_MAIN%\%GAME%"
set "STASH_SUB=%DIR_SUB%\%GAME%"

rem 退避用の親フォルダが無ければ作成
if not exist "%DIR_MAIN%" mkdir "%DIR_MAIN%" >nul
if not exist "%DIR_SUB%"  mkdir "%DIR_SUB%"  >nul

rem 切替
if exist "%ACTIVE%" (
    if exist "%STASH_MAIN%" (
        if not exist "%STASH_SUB%" (
            call :msg "　　mainの%GAME%セーブデータに切り替えます。"

            move "%ACTIVE%" "%STASH_SUB%" >nul
            if errorlevel 1 goto :move_failed

            move "%STASH_MAIN%" "%ACTIVE%" >nul
            if errorlevel 1 goto :move_failed

            exit /b 0
        )
    )
)

rem すでにmainなら何もしない
if exist "%ACTIVE%" (
    if not exist "%STASH_MAIN%" (
        if exist "%STASH_SUB%" (
            call :msg "　　既にmainの%GAME%セーブデータです。"
            exit /b 0
        )
    )
)

call :msg "　　%GAME%セーブデータの配置が想定外です。フォルダ構成を確認してください。"
exit /b 1

:move_failed
call :msg "　　%GAME%の移動に失敗しました。フォルダが使用中の可能性があります。\n　　エクスプローラ等を閉じて再実行してください。"
exit /b 1

rem メッセージ表示（共通）
:msg
powershell -NoProfile -command ^
  "Add-Type -AssemblyName PresentationCore,PresentationFramework;[System.Windows.MessageBox]::Show(('%~1' -replace '\\n',\"`r`n\"))"
exit /b
