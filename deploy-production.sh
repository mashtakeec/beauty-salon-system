#!/bin/bash
echo "🚀 完全デプロイ: Git + 本番環境"
echo "🚀 Full Deploy: Git + Production"
echo "==============================="

echo "📋 ステップ1: Gitに変更を追加中..."
echo "📋 Step 1: Adding changes to Git..."
git add dashboard.html

echo "💬 コミットメッセージを入力してください（Enterキーで既定値を使用）:"
echo "💬 Enter commit message (press Enter for default):"
read -p "メッセージ | Message: " commit_msg

if [ -z "$commit_msg" ]; then
    commit_msg="ダッシュボード更新 | Dashboard updates"
fi

echo "📝 ステップ2: コミット作成中..."
echo "📝 Step 2: Creating commit..."
git commit -m "$commit_msg"

echo "🌐 ステップ3: GitHubにプッシュ中..."
echo "🌐 Step 3: Pushing to GitHub..."
git push origin main

echo "🔄 ステップ4: SSHトンネル確認中..."
echo "🔄 Step 4: Checking SSH tunnel..."

if ! lsof -Pi :2223 -sTCP:LISTEN -t >/dev/null ; then
    echo "⚠️  警告: ポート2223でSSHトンネルが検出されませんでした"
    echo "⚠️  Warning: SSH tunnel not detected on port 2223"
    echo "💡 まず次を実行してください: ./start-ssh-tunnel.sh"
    echo "💡 First run: ./start-ssh-tunnel.sh"
    echo "❓ それでも続行しますか？ (y/n)"
    echo "❓ Continue anyway? (y/n)"
    read -p "回答 | Answer: " continue_deploy
    
    if [[ ! "$continue_deploy" =~ ^[Yy]$ ]]; then
        echo "📋 デプロイを中止しました"
        echo "📋 Deploy cancelled"
        exit 1
    fi
fi

echo "📤 ステップ5: 本番サーバーにコピー中..."
echo "📤 Step 5: Copying to production server..."
scp -P 2223 dashboard.html hajime@localhost:/var/www/dashboard/dashboard.html

if [ $? -eq 0 ]; then
    echo "✅ デプロイが正常に完了しました！"
    echo "✅ Deploy completed successfully!"
    echo "🔗 GitHub: https://github.com/mashtakeec/beauty-salon-system"
    echo "🌐 本番環境 | Production: https://chainon-test.xyz/dashboard.html"
    echo "📊 ダッシュボードが更新されました！"
    echo "📊 Dashboard has been updated!"
else
    echo "❌ 本番環境へのデプロイでエラーが発生しました"
    echo "❌ Error occurred during production deployment"
    echo "💡 SSH接続と認証情報を確認してください"
    echo "💡 Check SSH connection and credentials"
fi

read -p "続行するには何かキーを押してください | Press any key to continue..."