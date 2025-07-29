# 🏢 美容サロン統合データベース管理システム
# 🏢 Beauty Salon Integrated Database Management System

> **JP 日本語** | **EN English**

---

## 📁 プロジェクト構成 | Project Structure

```
beauty-salon-system/
├── dashboard.html              # メインファイル（作業用） | Main file (for development)
│
├── 🪟 Windows Scripts
├── open-cursor.bat            # Cursorエディタでファイルを開く | Open file in Cursor editor
├── quick-sync.bat             # Git同期のみ（高速） | Git sync only (fast)
├── start-ssh-tunnel.bat       # SSHトンネル開始 | Start SSH tunnel
├── deploy-production.bat      # 完全デプロイ（Git + 本番環境） | Full deploy (Git + Production)
│
├── 🍎 Mac/Linux Scripts
├── open-cursor.sh             # Cursorエディタでファイルを開く | Open file in Cursor editor
├── quick-sync.sh              # Git同期のみ（高速） | Git sync only (fast)
├── start-ssh-tunnel.sh        # SSHトンネル開始 | Start SSH tunnel
├── deploy-production.sh       # 完全デプロイ（Git + 本番環境） | Full deploy (Git + Production)
│
├── 📖 Documentation
├── README.md                  # この説明書 | This documentation
└── README-JP.md              # 日本語のみの説明書 | Japanese-only documentation
```

---

## 🚀 使用方法 | Usage

### 📝 日常的な作業フロー | Daily Workflow

#### JP 日本語

##### 🪟 Windows:
1. **ファイルを開く**
   ```
   open-cursor.bat をダブルクリック
   ```

2. **変更をGitHubに同期**
   ```
   quick-sync.bat をダブルクリック
   ```

##### 🍎 Mac/Linux:
1. **ファイルを開く**
   ```bash
   ./open-cursor.sh
   ```

2. **変更をGitHubに同期**
   ```bash
   ./quick-sync.sh
   ```

#### EN English

##### 🪟 Windows:
1. **Open File**
   ```
   Double-click open-cursor.bat
   ```

2. **Sync Changes to GitHub**
   ```
   Double-click quick-sync.bat
   ```

##### 🍎 Mac/Linux:
1. **Open File**
   ```bash
   ./open-cursor.sh
   ```

2. **Sync Changes to GitHub**
   ```bash
   ./quick-sync.sh
   ```

---

### 🌐 本番環境デプロイ | Production Deployment

#### JP 日本語

##### 🪟 Windows:
```
deploy-production.bat をダブルクリック
```

##### 🍎 Mac/Linux:
```bash
./deploy-production.sh
```

#### EN English

##### 🪟 Windows:
```
Double-click deploy-production.bat
```

##### 🍎 Mac/Linux:
```bash
./deploy-production.sh
```

---

## ⚠️ 重要な注意事項 | Important Notes

### JP 日本語

#### SSHトンネルについて
- **トンネルウィンドウは閉じないでください**
- トンネル接続: `ssh -L 2223:10.0.0.99:22 ishitomi@59.87.187.40`
- 本番ログイン: `hajime@localhost:2223`
- サーバーパス: `/var/www/dashboard/dashboard.html`

#### ファイルの場所
- **作業ファイル**: `./dashboard.html` (プロジェクトルート)
- **本番サイト**: https://chainon-test.xyz/dashboard.html
- **一時ファイルは使用しないでください**

### EN English

#### About SSH Tunnel
- **DO NOT close the tunnel window**
- Tunnel connection: `ssh -L 2223:10.0.0.99:22 ishitomi@59.87.187.40`
- Production login: `hajime@localhost:2223`
- Server path: `/var/www/dashboard/dashboard.html`

#### File Locations
- **Working file**: `./dashboard.html` (project root)
- **Production site**: https://chainon-test.xyz/dashboard.html
- **Do not use temporary files**

---

## 🔧 初回セットアップ | Initial Setup

### JP 日本語

1. **リポジトリをクローン**
   ```bash
   git clone https://github.com/mashtakeec/beauty-salon-system.git
   cd beauty-salon-system
   ```

2. **エディタをインストール**
   - [Cursor](https://cursor.sh/) または [VS Code](https://code.visualstudio.com/)

3. **SSH設定**
   - SSH鍵を設定
   - 本番サーバーへのアクセス権限を確認

### EN English

1. **Clone Repository**
   ```bash
   git clone https://github.com/mashtakeec/beauty-salon-system.git
   cd beauty-salon-system
   ```

2. **Install Editor**
   - [Cursor](https://cursor.sh/) or [VS Code](https://code.visualstudio.com/)

3. **SSH Setup**
   - Configure SSH keys
   - Verify access to production server

---

## 🔧 トラブルシューティング | Troubleshooting

### JP 日本語

#### よくある問題と解決方法

1. **Mac/Linuxでのスクリプト実行エラー**
   ```bash
   chmod +x *.sh
   ```

2. **「SSHトンネルが検出されませんでした」エラー**
   ```bash
   # Windows
   start-ssh-tunnel.bat
   
   # Mac/Linux
   ./start-ssh-tunnel.sh
   ```

3. **「Gitエラー」が発生した場合**
   ```bash
   git status
   git log --oneline -5
   ```

### EN English

#### Common Issues and Solutions

1. **Script execution error on Mac/Linux**
   ```bash
   chmod +x *.sh
   ```

2. **"SSH tunnel not detected" error**
   ```bash
   # Windows
   start-ssh-tunnel.bat
   
   # Mac/Linux
   ./start-ssh-tunnel.sh
   ```

3. **"Git error" occurs**
   ```bash
   git status
   git log --oneline -5
   ```

---

## 📞 サポート | Support

### JP 日本語
問題が発生した場合は、プロジェクト管理者に連絡してください。

### EN English
If you encounter any issues, please contact the project administrator.

---

## 🔗 リンク | Links

- **本番サイト | Production Site**: https://chainon-test.xyz/dashboard.html
- **GitHub Repository**: https://github.com/mashtakeec/beauty-salon-system
- **Supabase Dashboard**: https://pikptzoccejspdstbsia.supabase.co

---

## 📊 システム情報 | System Information

### JP 日本語
- **本番サーバー**: chainon-test.xyz
- **デプロイパス**: /var/www/dashboard/dashboard.html
- **ユーザーホーム**: /home/hajime
- **SSH経由**: ishitomi@59.87.187.40 → hajime@localhost:2223

### EN English
- **Production Server**: chainon-test.xyz
- **Deploy Path**: /var/www/dashboard/dashboard.html
- **User Home**: /home/hajime
- **SSH Route**: ishitomi@59.87.187.40 → hajime@localhost:2223

---

## 🎯 クイックスタート | Quick Start

### JP 日本語

#### 🪟 Windows:
```bash
# 1. ファイルを開く → 2. 編集 → 3. デプロイ
open-cursor.bat → [編集] → deploy-production.bat
```

#### 🍎 Mac/Linux:
```bash
# 1. ファイルを開く → 2. 編集 → 3. デプロイ
./open-cursor.sh → [編集] → ./deploy-production.sh
```

### EN English

#### 🪟 Windows:
```bash
# 1. Open file → 2. Edit → 3. Deploy
open-cursor.bat → [Edit] → deploy-production.bat
```

#### 🍎 Mac/Linux:
```bash
# 1. Open file → 2. Edit → 3. Deploy
./open-cursor.sh → [Edit] → ./deploy-production.sh
```

---

## 🏗️ アーキテクチャ | Architecture

### JP 日本語
- **フロントエンド**: HTML/CSS/JavaScript + Chart.js
- **バックエンド**: Supabase (PostgreSQL)
- **デプロイ**: SSH/SCP経由での自動デプロイ
- **バージョン管理**: Git + GitHub

### EN English
- **Frontend**: HTML/CSS/JavaScript + Chart.js
- **Backend**: Supabase (PostgreSQL)
- **Deployment**: Automated deployment via SSH/SCP
- **Version Control**: Git + GitHub

---

**Created by Development Team | 開発チーム作成**