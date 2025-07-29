@echo off
echo 🔧 本番環境用SSHトンネル設定
echo =============================

echo 🔍 トンネルが既にアクティブかどうか確認中...
netstat -an | findstr ":2223" >nul
if not errorlevel 1 (
    echo ✅ SSHトンネルはポート2223で既にアクティブです
    echo ℹ️  deploy-production.batを直接使用できます
    pause
    exit /b 0
)

echo 🚀 SSHトンネルを開始中...
echo 💡 新しいターミナルウィンドウが開きます
echo ⚠️  作業中はそのウィンドウを開いたままにしてください

start "SSH Tunnel" cmd /k "ssh -L 2223:10.0.0.99:22 ishitomi@59.87.187.40"

echo ⏳ 接続確立まで5秒待機中...
timeout /t 5 /nobreak >nul

echo 🔍 接続確認中...
netstat -an | findstr ":2223" >nul
if not errorlevel 1 (
    echo ✅ SSHトンネルが正常に確立されました！
    echo 🎯 これで deploy-production.bat を使用できます
) else (
    echo ❌ トンネルを確認できませんでした
    echo 💡 SSHウィンドウでエラーを確認してください
)

pause