#!/bin/bash

# App Store'a yükleme scripti
# Bu script Xcode Organizer'ı açıp yükleme adımlarını gösterir

echo "🚀 App Store'a yükleme işlemi başlatılıyor..."
echo ""

# Archive kontrolü
if [ ! -d "./build/KardiyoApp.xcarchive" ]; then
    echo "❌ Archive bulunamadı! Önce archive oluşturuluyor..."
    xcodebuild -project KardiyoApp.xcodeproj \
        -scheme KardiyoApp \
        -configuration Release \
        -destination 'generic/platform=iOS' \
        archive \
        -archivePath ./build/KardiyoApp.xcarchive
    
    if [ $? -ne 0 ]; then
        echo "❌ Archive oluşturma başarısız!"
        exit 1
    fi
    echo "✅ Archive oluşturuldu!"
fi

echo "✅ Archive hazır: ./build/KardiyoApp.xcarchive"
echo ""

# Xcode Organizer'ı aç
echo "📱 Xcode Organizer açılıyor..."
open -a Xcode
sleep 3

# Organizer'ı aç (Shift + Command + 9)
osascript <<EOF
tell application "Xcode"
    activate
    delay 2
end tell

tell application "System Events"
    tell process "Xcode"
        -- Organizer'ı aç
        keystroke "9" using {shift down, command down}
        delay 2
    end tell
end tell
EOF

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "📋 YÜKLEME ADIMLARI:"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "1. Xcode Organizer'da 'KardiyoApp' archive'ını seçin"
echo "2. 'Distribute App' butonuna tıklayın"
echo "3. 'App Store Connect' seçeneğini seçin ve 'Next' tıklayın"
echo "4. 'Upload' seçeneğini seçin ve 'Next' tıklayın"
echo "5. Otomatik imzalama seçeneğini seçin ve 'Next' tıklayın"
echo "6. Özeti kontrol edin ve 'Upload' tıklayın"
echo ""
echo "⚠️  NOT: Eğer App Store Connect'te uygulama kaydı yoksa:"
echo "   - Xcode otomatik olarak oluşturmayı önerebilir"
echo "   - Veya manuel olarak https://appstoreconnect.apple.com adresinden oluşturun"
echo ""
echo "═══════════════════════════════════════════════════════════"
echo ""

# App Store Connect kontrolü
echo "🔍 App Store Connect kontrolü..."
echo ""
echo "App Store Connect'te uygulama oluşturmak için:"
echo "1. https://appstoreconnect.apple.com adresine gidin"
echo "2. 'My Apps' > '+' (Yeni Uygulama) tıklayın"
echo "3. Bilgileri doldurun:"
echo "   - Platform: iOS"
echo "   - Name: Kardiyo Programı"
echo "   - Primary Language: Turkish"
echo "   - Bundle ID: com.kardiyoapp.app"
echo "   - SKU: KardiyoApp-001"
echo ""

echo "✅ Xcode Organizer açıldı! Yukarıdaki adımları takip edin."
echo ""

