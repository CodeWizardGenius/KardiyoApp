#!/bin/bash
# App Store'a yükleme - Final Script

echo "🚀 App Store'a yükleme işlemi..."
echo ""

# IPA dosyası kontrolü
IPA_FILE="./build/AppStore/KardiyoApp.ipa"
if [ ! -f "$IPA_FILE" ]; then
    echo "❌ IPA dosyası bulunamadı!"
    exit 1
fi

echo "✅ IPA dosyası hazır: $IPA_FILE"
echo ""

# Xcode Organizer'ı aç ve yükleme adımlarını göster
open -a Xcode
sleep 3

osascript <<APPLESCRIPT
tell application "Xcode"
    activate
    delay 2
end tell

tell application "System Events"
    tell process "Xcode"
        keystroke "9" using {shift down, command down}
        delay 2
    end tell
end tell

display dialog "📱 App Store'a Yükleme" & return & return & "Xcode Organizer açıldı. Lütfen şu adımları takip edin:" & return & return & "1️⃣  'KardiyoApp' archive'ını seçin" & return & "2️⃣  'Distribute App' butonuna tıklayın" & return & "3️⃣  'App Store Connect' seçin" & return & "4️⃣  'Upload' seçin" & return & "5️⃣  Otomatik imzalama seçin" & return & "6️⃣  'Upload' butonuna tıklayın" & return & return & "✅ IPA dosyası hazır: $IPA_FILE" buttons {"Tamam"} default button 1
APPLESCRIPT

echo ""
echo "✅ Xcode Organizer açıldı!"
echo "📦 IPA dosyası: $IPA_FILE"
echo ""
