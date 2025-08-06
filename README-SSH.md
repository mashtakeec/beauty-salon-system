# SSH Configuration for Direct VM Connection
# 仮想マシンへの直接SSH接続設定

This set of scripts allows you to connect directly to the virtual machine `hajime@10.0.0.99` without having to manually perform double SSH jumps and without entering passwords.

このスクリプトセットを使用することで、手動で二重SSH接続を行ったり、パスワードを入力したりすることなく、仮想マシン `hajime@10.0.0.99` に直接接続できます。

## Included Files / 含まれるファイル

### Configuration Scripts / 設定スクリプト
- `setup-ssh-keys.bat` - Windows script that automatically configures SSH keys / SSHキーを自動設定するWindowsスクリプト
- `setup-ssh-keys.sh` - Linux/Mac script that automatically configures SSH keys / SSHキーを自動設定するLinux/Macスクリプト
- `ssh_config_setup.txt` - Manual configuration instructions / 手動設定手順

### Connection Scripts / 接続スクリプト
- `connect-vm.bat` - Quick connection for Windows (requires prior setup) / Windows用クイック接続（事前設定が必要）
- `connect-vm.sh` - Quick connection for Linux/Mac (requires prior setup) / Linux/Mac用クイック接続（事前設定が必要）
- `connect-vm-direct.bat` - Direct connection for Windows (no prior setup, asks for passwords) / Windows用直接接続（事前設定不要、パスワード入力が必要）
- `connect-vm-direct.sh` - Direct connection for Linux/Mac (no prior setup, asks for passwords) / Linux/Mac用直接接続（事前設定不要、パスワード入力が必要）

## Initial Setup (Recommended) / 初期設定（推奨）

### For Windows / Windows用:
1. Run `setup-ssh-keys.bat` / `setup-ssh-keys.bat`を実行
2. Follow the on-screen instructions / 画面の指示に従う
3. Use `connect-vm.bat` for future connections / 今後の接続では`connect-vm.bat`を使用

### For Linux/Mac / Linux/Mac用:
1. Run `./setup-ssh-keys.sh` / `./setup-ssh-keys.sh`を実行
2. The script will attempt to configure everything automatically / スクリプトが自動的にすべてを設定します
3. Use `./connect-vm.sh` for future connections / 今後の接続では`./connect-vm.sh`を使用

## Quick Connection Without Setup / 設定なしでのクイック接続

If you prefer not to configure SSH keys, you can use:
SSHキーを設定したくない場合は、以下を使用できます：

### Windows:
```batch
connect-vm-direct.bat
```

### Linux/Mac:
```bash
./connect-vm-direct.sh
```

These scripts will ask for passwords but connect you directly without the double jump.
これらのスクリプトはパスワードを要求しますが、二重接続なしで直接接続します。

## Manual Connection / 手動接続

If you prefer to connect manually, use:
手動で接続したい場合は、以下を使用してください：

```bash
ssh -o ProxyJump=ishitomi@59.87.187.40 hajime@10.0.0.99
```

## After Configuration / 設定後

Once properly configured, you can connect with any of these commands:
正しく設定されると、以下のコマンドのいずれかで接続できます：

```bash
ssh vm-hajime
ssh beauty-salon-vm
```

## Troubleshooting / トラブルシューティング

### Error: "Permission denied (publickey)"
- Make sure you have run the `ssh-copy-id` commands correctly / `ssh-copy-id`コマンドが正しく実行されていることを確認
- Verify that SSH keys were generated in the correct location / SSHキーが正しい場所に生成されていることを確認

### Error: "Could not resolve hostname"
- Verify that the `~/.ssh/config` file was created correctly / `~/.ssh/config`ファイルが正しく作成されていることを確認
- Make sure the IP addresses are correct / IPアドレスが正しいことを確認

### Slow connection / 接続が遅い
- It's normal for the first connection to be slower due to ProxyJump / ProxyJumpのため、最初の接続が遅いのは正常です
- Subsequent connections should be faster / 以降の接続は高速になります

## Configuration Structure / 設定構造

The script creates this configuration in `~/.ssh/config`:
スクリプトは`~/.ssh/config`に以下の設定を作成します：

```
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
```

This configuration allows SSH to automatically handle the jump through the PVE server to reach the virtual machine.
この設定により、SSHがPVEサーバーを経由して仮想マシンに到達するジャンプを自動的に処理します。