#!/bin/bash
echo "🎯 Cursorでdashboard.htmlを開いています..."
echo "🎯 Opening dashboard.html in Cursor..."

# Try different possible Cursor paths on macOS
if [ -d "/Applications/Cursor.app" ]; then
    open -a "Cursor" "./dashboard.html"
elif command -v cursor >/dev/null 2>&1; then
    cursor "./dashboard.html"
elif command -v code >/dev/null 2>&1; then
    echo "⚠️ Cursorが見つかりません。VS Codeで開きます..."
    echo "⚠️ Cursor not found. Opening with VS Code..."
    code "./dashboard.html"
else
    echo "❌ CursorまたはVS Codeが見つかりません"
    echo "❌ Neither Cursor nor VS Code found"
    exit 1
fi

echo "✅ Cursorでファイルが開かれました！"
echo "✅ File opened in Cursor!"