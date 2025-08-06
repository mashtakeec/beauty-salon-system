#!/bin/bash
# Script to connect directly to the beauty salon VM
# Uses ProxyJump to jump through the PVE server
# 美容サロンVMに直接接続するスクリプト
# PVEサーバーを経由してProxyJumpを使用

echo "Connecting to beauty salon virtual machine..."
echo "美容サロンの仮想マシンに接続中..."
echo "Server / サーバー: hajime@10.0.0.99 (via / 経由 ishitomi@59.87.187.40)"
echo

# Check if SSH configuration exists
# SSH設定が存在するかチェック
if [ ! -f "$HOME/.ssh/config" ]; then
    echo "ERROR: SSH configuration not found."
    echo "エラー: SSH設定が見つかりません。"
    echo "Run setup-ssh-keys.sh first."
    echo "まずsetup-ssh-keys.shを実行してください。"
    exit 1
fi

# Connect using configured alias
# 設定されたエイリアスを使用して接続
if ssh vm-hajime; then
    echo "Connection successful / 接続が成功しました"
else
    echo
    echo "Alias connection failed, trying manual connection..."
    echo "エイリアス接続が失敗しました。手動接続を試行中..."
    ssh -o ProxyJump=ishitomi@59.87.187.40 hajime@10.0.0.99
fi