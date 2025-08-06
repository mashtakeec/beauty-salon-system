@echo off
REM Direct connection to VM without prior configuration
REM Useful if you haven't configured SSH keys yet
REM 事前設定なしでVMに直接接続
REM SSHキーをまだ設定していない場合に有用

echo ===================================================
echo Direct Connection to Beauty Salon VM
echo 美容サロンVMへの直接接続
echo ===================================================
echo.
echo This script will connect you directly using ProxyJump
echo このスクリプトはProxyJumpを使用して直接接続します
echo You will be asked for passwords if you don't have SSH keys configured.
echo SSHキーが設定されていない場合、パスワードの入力が求められます。
echo.

echo Connecting to hajime@10.0.0.99 via ishitomi@59.87.187.40...
echo hajime@10.0.0.99にishitomi@59.87.187.40経由で接続中...
ssh -o ProxyJump=ishitomi@59.87.187.40 hajime@10.0.0.99

echo.
echo Connection ended / 接続が終了しました
pause