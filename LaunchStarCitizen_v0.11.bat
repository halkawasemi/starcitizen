@echo off
REM Star Citizen 起動用バッチ（安全性重視バージョン）
REM 余計なコマンドや怪しい動作を排除し、必要最小限の処理のみ実行します。

REM 英語キーボードレイアウトへ変更
powershell -ExecutionPolicy Bypass -NoProfile -WindowStyle Hidden -Command "Set-WinUserLanguageList en-US -Force"

REM Star Citizenのパスを指定
set "STAR_CITIZEN_PATH=C:\Program Files\Roberts Space Industries\RSI Launcher\RSI Launcher.exe"

REM パスの存在確認
if not exist "%STAR_CITIZEN_PATH%" (
    echo [ERROR] The specified path does not exist: %STAR_CITIZEN_PATH%
    pause
    exit /b 1
)

REM Star Citizenを起動
start "" /WAIT "%STAR_CITIZEN_PATH%"
set "GAME_ERROR_LEVEL=%errorlevel%"

REM 終了コードの確認
if %GAME_ERROR_LEVEL% neq 0 (
    echo [WARNING] Star Citizen may have closed with an error code %GAME_ERROR_LEVEL% or did not start correctly.
) else (
    echo Star Citizen closed.
)

REM 日本語キーボードレイアウトへ戻す
powershell -ExecutionPolicy Bypass -NoProfile -WindowStyle Hidden -Command "Set-WinUserLanguageList ja-JP -Force"

REM 終了メッセージ
exit /b 0