@echo off
echo 🚀 完全デプロイ: Git + 本番環境
echo ===============================

echo 📋 ステップ1: Gitに変更を追加中...
git add dashboard.html

echo 💬 コミットメッセージを入力してください（Enterキーで既定値を使用）:
set /p commit_msg="メッセージ: "
if "%commit_msg%"=="" set commit_msg=ダッシュボード更新

echo 📝 ステップ2: コミット作成中...
git commit -m "%commit_msg%"

echo 🌐 ステップ3: GitHubにプッシュ中...
git push origin main

echo 🔄 ステップ4: SSHトンネル確認中...
netstat -an | findstr ":2223" >nul
if errorlevel 1 (
    echo ⚠️  警告: ポート2223でSSHトンネルが検出されませんでした
    echo 💡 まず次を実行してください: ssh -L 2223:10.0.0.99:22 ishitomi@59.87.187.40
    echo ❓ それでも続行しますか？ (y/n)
    set /p continue="回答: "
    if /i not "%continue%"=="y" exit /b 1
)

echo 📤 ステップ5: 本番サーバーにコピー中...
scp -P 2223 dashboard.html hajime@localhost:/var/www/dashboard/dashboard.html

if errorlevel 0 (
    echo ✅ デプロイが正常に完了しました！
    echo 🔗 GitHub: https://github.com/mashtakeec/beauty-salon-system
    echo 🌐 本番環境: https://chainon-test.xyz/dashboard.html
    echo 📊 ダッシュボードが更新されました！
) else (
    echo ❌ 本番環境へのデプロイでエラーが発生しました
    echo 💡 SSH接続と認証情報を確認してください
)

pause