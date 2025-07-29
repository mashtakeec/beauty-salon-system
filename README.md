# 🏢 美容サロン統合データベース管理システム
# 🏢 Beauty Salon Integrated Database Management System

> **日本語** | **English**

---

## 📁 プロジェクト構成 | Project Structure

```
beauty-salon-system/
├── dashboard.html              # メインファイル（作業用） | Main file (for development)
├── open-cursor.bat            # Cursorエディタでファイルを開く | Open file in Cursor editor
├── quick-sync.bat             # Git同期のみ（高速） | Git sync only (fast)
├── start-ssh-tunnel.bat       # SSHトンネル開始 | Start SSH tunnel
├── deploy-production.bat      # 完全デプロイ（Git + 本番環境） | Full deploy (Git + Production)
├── README.md                  # この説明書 | This documentation
└── README-JP.md              # 日本語のみの説明書 | Japanese-only documentation
```

---

## 🚀 使用方法 | Usage

### 📝 日常的な作業フロー | Daily Workflow

#### 🇯🇵 日本語

1. **ファイルを開く**
   ```
   open-cursor.bat をダブルクリック
   ```
   → Cursorエディタでdashboard.htmlが開きます

2. **ファイルを編集**
   - 通常通りファイルを編集
   - 保存（Ctrl+S）

3. **変更をGitHubに同期**
   ```
   quick-sync.bat をダブルクリック
   ```
   → コミットメッセージを入力してEnter

#### en English

1. **Open File**
   ```
   Double-click open-cursor.bat
   ```
   → Opens dashboard.html in Cursor editor

2. **Edit File**
   - Edit the file normally
   - Save (Ctrl+S)

3. **Sync Changes to GitHub**
   ```
   Double-click quick-sync.bat
   ```
   → Enter commit message and press Enter

---

### 🌐 本番環境デプロイ | Production Deployment

#### 🇯🇵 日本語

##### オプション1: 手動でSSHトンネル開始
```
1. start-ssh-tunnel.bat をダブルクリック
2. deploy-production.bat をダブルクリック
```

##### オプション2: 自動チェック付きデプロイ
```
deploy-production.bat をダブルクリック
```
→ トンネルチェックも自動で行います

#### en English

##### Option 1: Manual SSH Tunnel Start
```
1. Double-click start-ssh-tunnel.bat
2. Double-click deploy-production.bat
```

##### Option 2: Auto-check Deploy
```
Double-click deploy-production.bat
```
→ Automatically checks tunnel connection

---

## ⚠️ 重要な注意事項 | Important Notes

### 🇯🇵 日本語

#### SSHトンネルについて
- **トンネルウィンドウは閉じないでください**
- トンネル接続: `ssh -L 2223:10.0.0.99:22 ishitomi@59.87.187.40`
- 本番ログイン: `hajime@localhost:2223`
- サーバーパス: `/var/www/dashboard/dashboard.html`

#### ファイルの場所
- **作業ファイル**: `E:\Work\n8n\chainon\git\beauty-salon-system\dashboard.html`
- **本番サイト**: https://chainon-test.xyz/dashboard.html
- **一時ファイルは使用しないでください**

### en English

#### About SSH Tunnel
- **DO NOT close the tunnel window**
- Tunnel connection: `ssh -L 2223:10.0.0.99:22 ishitomi@59.87.187.40`
- Production login: `hajime@localhost:2223`
- Server path: `/var/www/dashboard/dashboard.html`

#### File Locations
- **Working file**: `E:\Work\n8n\chainon\git\beauty-salon-system\dashboard.html`
- **Production site**: https://chainon-test.xyz/dashboard.html
- **Do not use temporary files**

---

## 🔧 トラブルシューティング | Troubleshooting

### 🇯🇵 日本語

#### よくある問題と解決方法

1. **「SSHトンネルが検出されませんでした」エラー**
   ```
   start-ssh-tunnel.bat を実行してから再試行
   ```

2. **「Gitエラー」が発生した場合**
   ```
   ターミナルで以下を実行:
   cd E:\Work\n8n\chainon\git\beauty-salon-system
   git status
   ```

3. **本番環境への接続エラー**
   - SSH認証情報を確認
   - ネットワーク接続を確認
   - トンネルが正常に動作しているか確認
   - サーバーパス `/var/www/dashboard/` への書き込み権限を確認

4. **サイトが更新されない場合**
   - ブラウザのキャッシュをクリア (Ctrl+F5)
   - https://chainon-test.xyz/dashboard.html を確認

### en English

#### Common Issues and Solutions

1. **"SSH tunnel not detected" error**
   ```
   Run start-ssh-tunnel.bat first, then retry
   ```

2. **"Git error" occurs**
   ```
   Run the following in terminal:
   cd E:\Work\n8n\chainon\git\beauty-salon-system
   git status
   ```

3. **Production environment connection error**
   - Check SSH credentials
   - Check network connection
   - Verify tunnel is working properly
   - Check write permissions to `/var/www/dashboard/` server path

4. **Site not updating**
   - Clear browser cache (Ctrl+F5)
   - Check https://chainon-test.xyz/dashboard.html

---

## 📞 サポート | Support

### 🇯🇵 日本語
問題が発生した場合は、Ricardo（ricardo.mashtake@gmail.com）に連絡してください。

### en English
If you encounter any issues, please contact Ricardo (ricardo.mashtake@gmail.com).

---

## 🔗 リンク | Links

- **本番サイト | Production Site**: https://chainon-test.xyz/dashboard.html
- **GitHub Repository**: https://github.com/mashtakeec/beauty-salon-system
- **Supabase Dashboard**: https://pikptzoccejspdstbsia.supabase.co

---

## 📊 システム情報 | System Information

### 🇯🇵 日本語
- **本番サーバー**: chainon-test.xyz
- **デプロイパス**: /var/www/dashboard/dashboard.html
- **ユーザーホーム**: /home/hajime
- **SSH経由**: ishitomi@59.87.187.40 → hajime@localhost:2223

### en English
- **Production Server**: chainon-test.xyz
- **Deploy Path**: /var/www/dashboard/dashboard.html
- **User Home**: /home/hajime
- **SSH Route**: ishitomi@59.87.187.40 → hajime@localhost:2223

---

## 🎯 快速入门 | Quick Start

### 🇯🇵 日本語
```bash
# 1. ファイルを開く
open-cursor.bat

# 2. 編集後、GitHubに同期
quick-sync.bat

# 3. 本番環境にデプロイ
deploy-production.bat
```

### en English
```bash
# 1. Open file
open-cursor.bat

# 2. After editing, sync to GitHub
quick-sync.bat

# 3. Deploy to production
deploy-production.bat
```

---

## 🏗️ アーキテクチャ | Architecture

### 🇯🇵 日本語
- **フロントエンド**: HTML/CSS/JavaScript + Chart.js
- **バックエンド**: Supabase (PostgreSQL)
- **デプロイ**: SSH/SCP経由での自動デプロイ
- **バージョン管理**: Git + GitHub

### en English
- **Frontend**: HTML/CSS/JavaScript + Chart.js
- **Backend**: Supabase (PostgreSQL)
- **Deployment**: Automated deployment via SSH/SCP
- **Version Control**: Git + GitHub

---

**Created by Ricardo Mashtake | 作成者: Ricardo Mashtake**
