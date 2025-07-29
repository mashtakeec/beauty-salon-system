@echo off
echo 🚀 GitHubとの高速同期
echo ==================

echo 📋 変更をステージングエリアに追加中...
git add dashboard.html

echo 💬 コミットメッセージを入力してください（Enterキーで既定値を使用）:
set /p commit_msg="メッセージ: "
if "%commit_msg%"=="" set commit_msg=ダッシュボード更新

echo 📝 コミット作成中...
git commit -m "%commit_msg%"

echo 🌐 GitHubにプッシュ中...
git push origin main

echo ✅ 同期が完了しました！
echo 🔗 確認先: https://github.com/mashtakeec/beauty-salon-system
pause