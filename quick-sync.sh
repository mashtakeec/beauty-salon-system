#!/bin/bash
echo "🚀 GitHubとの高速同期"
echo "🚀 Fast sync with GitHub"
echo "=================="

echo "📋 変更をステージングエリアに追加中..."
echo "📋 Adding changes to staging area..."
git add dashboard.html

echo "💬 コミットメッセージを入力してください（Enterキーで既定値を使用）:"
echo "💬 Enter commit message (press Enter for default):"
read -p "メッセージ | Message: " commit_msg

if [ -z "$commit_msg" ]; then
    commit_msg="ダッシュボード更新 | Dashboard updates"
fi

echo "📝 コミット作成中..."
echo "📝 Creating commit..."
git commit -m "$commit_msg"

echo "🌐 GitHubにプッシュ中..."
echo "🌐 Pushing to GitHub..."
git push origin main

echo "✅ 同期が完了しました！"
echo "✅ Sync completed!"
echo "🔗 確認先 | Check at: https://github.com/mashtakeec/beauty-salon-system"

read -p "続行するには何かキーを押してください | Press any key to continue..."