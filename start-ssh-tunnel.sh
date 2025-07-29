#!/bin/bash
echo "🔧 本番環境用SSHトンネル設定"
echo "🔧 SSH Tunnel setup for production"
echo "============================="

echo "🔍 トンネルが既にアクティブかどうか確認中..."
echo "🔍 Checking if tunnel is already active..."

if lsof -Pi :2223 -sTCP:LISTEN -t >/dev/null ; then
    echo "✅ SSHトンネルはポート2223で既にアクティブです"
    echo "✅ SSH tunnel is already active on port 2223"
    echo "ℹ️  ./deploy-production.sh を直接使用できます"
    echo "ℹ️  You can use ./deploy-production.sh directly"
    read -p "続行するには何かキーを押してください | Press any key to continue..."
    exit 0
fi

echo "🚀 SSHトンネルを開始中..."
echo "🚀 Starting SSH tunnel..."
echo "💡 新しいターミナルウィンドウが開きます"
echo "💡 A new terminal window will open"
echo "⚠️  作業中はそのウィンドウを開いたままにしてください"
echo "⚠️  Keep that window open while working"

# Start SSH tunnel in background
ssh -L 2223:10.0.0.99:22 ishitomi@59.87.187.40 -N &
SSH_PID=$!

echo "⏳ 接続確立まで5秒待機中..."
echo "⏳ Waiting 5 seconds for connection to establish..."
sleep 5

echo "🔍 接続確認中..."
echo "🔍 Checking connection..."

if lsof -Pi :2223 -sTCP:LISTEN -t >/dev/null ; then
    echo "✅ SSHトンネルが正常に確立されました！"
    echo "✅ SSH tunnel established successfully!"
    echo "🎯 これで ./deploy-production.sh を使用できます"
    echo "🎯 You can now use ./deploy-production.sh"
    echo "📝 トンネルを停止するには: kill $SSH_PID"
    echo "📝 To stop tunnel, run: kill $SSH_PID"
else
    echo "❌ トンネルを確認できませんでした"
    echo "❌ Could not verify tunnel"
    echo "💡 SSH接続でエラーを確認してください"
    echo "💡 Check SSH connection for errors"
fi

read -p "続行するには何かキーを押してください | Press any key to continue..."