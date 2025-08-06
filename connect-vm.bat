@echo off
REM Script to connect directly to the beauty salon VM
REM Uses ProxyJump to jump through the PVE server
REM 美容サロンVMに直接接続するスクリプト
REM PVEサーバーを経由してProxyJumpを使用

echo Connecting to beauty salon virtual machine...
echo 美容サロンの仮想マシンに接続中...
echo Server / サーバー: hajime@10.0.0.99 (via / 経由 ishitomi@59.87.187.40)
echo.

REM Check if SSH configuration exists
REM SSH設定が存在するかチェック
if not exist "%USERPROFILE%\.ssh\config" (
    echo ERROR: SSH configuration not found.
    echo エラー: SSH設定が見つかりません。
    echo Run setup-ssh-keys.bat first.
    echo まずsetup-ssh-keys.batを実行してください。
    pause
    exit /b 1
)

REM Connect using configured alias
REM 設定されたエイリアスを使用して接続
ssh vm-hajime

REM If it fails, try manual connection
REM 失敗した場合、手動接続を試行
if errorlevel 1 (
    echo.
    echo Alias connection failed, trying manual connection...
    echo エイリアス接続が失敗しました。手動接続を試行中...
    ssh -o ProxyJump=ishitomi@59.87.187.40 hajime@10.0.0.99
)

pause