#!/bin/bash

# App Store Connect'e yükleme scripti
# Kullanım: ./upload_to_appstore.sh

echo "🚀 App Store'a yükleme işlemi başlatılıyor..."

# 1. Archive oluştur
echo "📦 Archive oluşturuluyor..."
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

echo "✅ Archive başarıyla oluşturuldu!"

# 2. App Store Connect'e yükle
echo "📤 App Store Connect'e yükleniyor..."

# Seçenek 1: Xcode ile yükleme (Önerilen)
echo ""
echo "=== YÜKLEME YÖNTEMİ 1: Xcode Organizer ==="
echo "1. Xcode'u açın"
echo "2. Window > Organizer'a gidin"
echo "3. Archives sekmesinde 'KardiyoApp' archive'ını seçin"
echo "4. 'Distribute App' butonuna tıklayın"
echo "5. 'App Store Connect' seçeneğini seçin"
echo "6. 'Upload' seçeneğini seçin"
echo "7. Adımları takip edin"
echo ""

# Seçenek 2: Komut satırı ile yükleme (API Key gerekiyor)
echo "=== YÜKLEME YÖNTEMİ 2: Komut Satırı (API Key ile) ==="
echo ""
echo "App Store Connect API Key oluşturmanız gerekiyor:"
echo "1. https://appstoreconnect.apple.com adresine gidin"
echo "2. Users and Access > Keys sekmesine gidin"
echo "3. Yeni bir API Key oluşturun"
echo "4. Key ID, Issuer ID ve .p8 dosyasını kaydedin"
echo ""
echo "Sonra şu komutu çalıştırın:"
echo ""
echo "xcrun altool --upload-app \\"
echo "  --type ios \\"
echo "  --file ./build/AppStore/KardiyoApp.ipa \\"
echo "  --apiKey YOUR_KEY_ID \\"
echo "  --apiIssuer YOUR_ISSUER_ID"
echo ""

# Seçenek 3: Transporter uygulaması
echo "=== YÜKLEME YÖNTEMİ 3: Transporter Uygulaması ==="
echo ""
echo "1. Mac App Store'dan 'Transporter' uygulamasını indirin"
echo "2. Uygulamayı açın ve Apple ID ile giriş yapın"
echo "3. Export edilmiş .ipa dosyasını sürükleyip bırakın"
echo "4. 'Deliver' butonuna tıklayın"
echo ""

echo "📋 ÖNEMLİ NOTLAR:"
echo ""
echo "1. App Store Connect'te uygulama kaydı oluşturmanız gerekiyor:"
echo "   - https://appstoreconnect.apple.com"
echo "   - My Apps > + (Yeni Uygulama)"
echo "   - Bundle ID: com.kardiyoapp.app"
echo ""
echo "2. Uygulama bilgilerini doldurun:"
echo "   - Uygulama adı, açıklama, ekran görüntüleri"
echo "   - Fiyatlandırma ve kullanılabilirlik"
echo "   - Gizlilik politikası (gerekirse)"
echo ""
echo "3. İnceleme için gönderin"
echo ""
echo "✅ Hazır! Archive: ./build/KardiyoApp.xcarchive"

