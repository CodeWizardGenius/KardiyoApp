#!/bin/bash

# App Store Connect API ile yükleme
# NOT: Bu script için App Store Connect API Key gerekiyor

echo "🚀 App Store Connect'e yükleme..."
echo ""

IPA_FILE="./build/AppStore/KardiyoApp.ipa"

if [ ! -f "$IPA_FILE" ]; then
    echo "❌ IPA dosyası bulunamadı: $IPA_FILE"
    exit 1
fi

echo "✅ IPA dosyası bulundu: $IPA_FILE"
echo ""

# API Key kontrolü
if [ -z "$APP_STORE_CONNECT_API_KEY" ] || [ -z "$APP_STORE_CONNECT_ISSUER_ID" ]; then
    echo "⚠️  App Store Connect API Key bulunamadı!"
    echo ""
    echo "API Key oluşturmak için:"
    echo "1. https://appstoreconnect.apple.com adresine gidin"
    echo "2. Users and Access > Keys sekmesine gidin"
    echo "3. '+' butonuna tıklayarak yeni bir API Key oluşturun"
    echo "4. Key ID, Issuer ID ve .p8 dosyasını kaydedin"
    echo ""
    echo "Sonra şu komutları çalıştırın:"
    echo "export APP_STORE_CONNECT_API_KEY='YOUR_KEY_ID'"
    echo "export APP_STORE_CONNECT_ISSUER_ID='YOUR_ISSUER_ID'"
    echo "export APP_STORE_CONNECT_KEY_PATH='path/to/AuthKey_XXXXX.p8'"
    echo ""
    echo "Veya Xcode Organizer kullanın (daha kolay):"
    echo "./appstore_upload.sh"
    echo ""
    exit 1
fi

# xcrun altool ile yükleme (eski yöntem - deprecated)
# xcrun altool --upload-app \
#     --type ios \
#     --file "$IPA_FILE" \
#     --apiKey "$APP_STORE_CONNECT_API_KEY" \
#     --apiIssuer "$APP_STORE_CONNECT_ISSUER_ID"

echo "✅ Yükleme için hazır!"
echo ""
echo "Manuel yükleme için Xcode Organizer kullanın:"
echo "1. Xcode > Window > Organizer"
echo "2. Archive'ı seçin ve 'Distribute App' tıklayın"
echo ""

