@echo off
REM Script to automatically configure SSH keys
REM For beauty salon system - Direct VM connection
REM SSHキーを自動設定するスクリプト
REM 美容サロンシステム用 - VM直接接続

echo ===================================================
echo SSH Configuration for Beauty Salon System
echo 美容サロンシステムのSSH設定
echo ===================================================
echo.

REM Create .ssh directory if it doesn't exist
REM .sshディレクトリが存在しない場合は作成
if not exist "%USERPROFILE%\.ssh" (
    mkdir "%USERPROFILE%\.ssh"
    echo .ssh directory created / .sshディレクトリを作成しました
)

REM Generate SSH key if it doesn't exist
REM SSHキーが存在しない場合は生成
if not exist "%USERPROFILE%\.ssh\id_rsa_beauty_salon" (
    echo Generating new SSH key... / 新しいSSHキーを生成中...
    ssh-keygen -t rsa -b 4096 -f "%USERPROFILE%\.ssh\id_rsa_beauty_salon" -N ""
    echo SSH key generated successfully / SSHキーが正常に生成されました
) else (
    echo SSH key already exists / SSHキーは既に存在します
)

REM Create SSH configuration
REM SSH設定を作成
echo.
echo Creating SSH configuration... / SSH設定を作成中...
(
echo # Configuration for Beauty Salon System / 美容サロンシステムの設定
echo Host pve-server
echo     HostName 59.87.187.40
echo     User ishitomi
echo     Port 22
echo     IdentityFile ~/.ssh/id_rsa_beauty_salon
echo.
echo Host vm-hajime
echo     HostName 10.0.0.99
echo     User hajime
echo     Port 22
echo     ProxyJump pve-server
echo     IdentityFile ~/.ssh/id_rsa_beauty_salon
echo.
echo Host beauty-salon-vm
echo     HostName 10.0.0.99
echo     User hajime
echo     Port 22
echo     ProxyJump pve-server
echo     IdentityFile ~/.ssh/id_rsa_beauty_salon
) > "%USERPROFILE%\.ssh\config"

echo SSH configuration created at / SSH設定を作成しました: %USERPROFILE%\.ssh\config

echo.
echo ===================================================
echo REMAINING MANUAL STEPS / 残りの手動手順:
echo ===================================================
echo 1. Run / 実行: ssh-copy-id -i ~/.ssh/id_rsa_beauty_salon.pub ishitomi@59.87.187.40
echo 2. Run / 実行: ssh-copy-id -i ~/.ssh/id_rsa_beauty_salon.pub -o ProxyJump=ishitomi@59.87.187.40 hajime@10.0.0.99
echo.
echo After that you can connect directly with / その後、以下で直接接続できます:
echo - ssh vm-hajime
echo - ssh beauty-salon-vm
echo.
echo ===================================================
pause