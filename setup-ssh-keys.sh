#!/bin/bash
# Script to automatically configure SSH keys
# For beauty salon system - Direct VM connection
# SSHキーを自動設定するスクリプト
# 美容サロンシステム用 - VM直接接続

echo "==================================================="
echo "SSH Configuration for Beauty Salon System"
echo "美容サロンシステムのSSH設定"
echo "==================================================="
echo

# Create .ssh directory if it doesn't exist
# .sshディレクトリが存在しない場合は作成
if [ ! -d "$HOME/.ssh" ]; then
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
    echo ".ssh directory created / .sshディレクトリを作成しました"
fi

# Generate SSH key if it doesn't exist
# SSHキーが存在しない場合は生成
if [ ! -f "$HOME/.ssh/id_rsa_beauty_salon" ]; then
    echo "Generating new SSH key... / 新しいSSHキーを生成中..."
    ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa_beauty_salon" -N ""
    echo "SSH key generated successfully / SSHキーが正常に生成されました"
else
    echo "SSH key already exists / SSHキーは既に存在します"
fi

# Create SSH configuration
# SSH設定を作成
echo
echo "Creating SSH configuration... / SSH設定を作成中..."
cat > "$HOME/.ssh/config" << 'EOF'
# Configuration for Beauty Salon System / 美容サロンシステムの設定
Host pve-server
    HostName 59.87.187.40
    User ishitomi
    Port 22
    IdentityFile ~/.ssh/id_rsa_beauty_salon

Host vm-hajime
    HostName 10.0.0.99
    User hajime
    Port 22
    ProxyJump pve-server
    IdentityFile ~/.ssh/id_rsa_beauty_salon

Host beauty-salon-vm
    HostName 10.0.0.99
    User hajime
    Port 22
    ProxyJump pve-server
    IdentityFile ~/.ssh/id_rsa_beauty_salon
EOF

chmod 600 "$HOME/.ssh/config"
echo "SSH configuration created at / SSH設定を作成しました: $HOME/.ssh/config"

echo
echo "==================================================="
echo "AUTOMATIC KEY CONFIGURATION / 自動キー設定"
echo "==================================================="

# Try to copy key to PVE server
# PVEサーバーにキーをコピーを試行
echo "Copying SSH key to PVE server... / PVEサーバーにSSHキーをコピー中..."
if ssh-copy-id -i "$HOME/.ssh/id_rsa_beauty_salon.pub" ishitomi@59.87.187.40; then
    echo "Key copied to PVE server successfully / PVEサーバーにキーが正常にコピーされました"
    
    # Try to copy key to VM
    # VMにキーをコピーを試行
    echo "Copying SSH key to virtual machine... / 仮想マシンにSSHキーをコピー中..."
    if ssh-copy-id -i "$HOME/.ssh/id_rsa_beauty_salon.pub" -o ProxyJump=ishitomi@59.87.187.40 hajime@10.0.0.99; then
        echo "Key copied to VM successfully / VMにキーが正常にコピーされました"
        echo
        echo "CONFIGURATION COMPLETED! / 設定が完了しました！"
        echo "You can now connect directly with / 以下で直接接続できるようになりました:"
        echo "- ssh vm-hajime"
        echo "- ssh beauty-salon-vm"
    else
        echo "Error copying key to VM. You'll need to do it manually:"
        echo "VMへのキーコピーでエラーが発生しました。手動で実行してください:"
        echo "ssh-copy-id -i ~/.ssh/id_rsa_beauty_salon.pub -o ProxyJump=ishitomi@59.87.187.40 hajime@10.0.0.99"
    fi
else
    echo "Error copying key to PVE server. Manual steps:"
    echo "PVEサーバーへのキーコピーでエラーが発生しました。手動手順:"
    echo "1. ssh-copy-id -i ~/.ssh/id_rsa_beauty_salon.pub ishitomi@59.87.187.40"
    echo "2. ssh-copy-id -i ~/.ssh/id_rsa_beauty_salon.pub -o ProxyJump=ishitomi@59.87.187.40 hajime@10.0.0.99"
fi

echo
echo "==================================================="