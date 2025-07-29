# 🏢 美容サロン統合データベース管理システム

## 📁 プロジェクト構成

```
beauty-salon-system/
├── dashboard.html              # メインファイル（作業用）
├── open-cursor.bat            # Cursorエディタでファイルを開く
├── quick-sync.bat             # Git同期のみ（高速）
├── start-ssh-tunnel.bat       # SSHトンネル開始
├── deploy-production.bat      # 完全デプロイ（Git + 本番環境）
└── README-JP.md              # この説明書
```

## 🚀 使用方法

### 📝 日常的な作業フロー

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

### 🌐 本番環境デプロイ

#### オプション1: 手動でSSHトンネル開始
```
1. start-ssh-tunnel.bat をダブルクリック
2. deploy-production.bat をダブルクリック
```

#### オプション2: 自動チェック付きデプロイ
```
deploy-production.bat をダブルクリック
```
→ トンネルチェックも自動で行います

## ⚠️ 重要な注意事項

### SSHトンネルについて
- **トンネルウィンドウは閉じないでください**
- トンネル接続: `ssh -L 2223:10.0.0.99:22 ishitomi@59.87.187.40`
- 本番ログイン: `hajime@localhost:2223`
- サーバーパス: `/var/www/dashboard/dashboard.html`

### ファイルの場所
- **作業ファイル**: `E:\Work\n8n\chainon\git\beauty-salon-system\dashboard.html`
- **本番サイト**: https://chainon-test.xyz/dashboard.html
- **一時ファイルは使用しないでください**

## 🔧 トラブルシューティング

### よくある問題と解決方法

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

## 📞 サポート

問題が発生した場合は、Ricardo（ricardo.mashtake@gmail.com）に連絡してください。

## 🔗 リンク

- **本番サイト**: https://chainon-test.xyz/dashboard.html
- **GitHub Repository**: https://github.com/mashtakeec/beauty-salon-system
- **Supabase Dashboard**: https://pikptzoccejspdstbsia.supabase.co

## 📊 システム情報

- **本番サーバー**: chainon-test.xyz
- **デプロイパス**: /var/www/dashboard/dashboard.html
- **ユーザーホーム**: /home/hajime
- **SSH経由**: ishitomi@59.87.187.40 → hajime@localhost:2223