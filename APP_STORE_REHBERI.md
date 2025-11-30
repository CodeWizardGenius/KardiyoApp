# App Store'a Yükleme Rehberi

## ✅ Tamamlanan Adımlar

1. ✅ Release archive oluşturuldu: `./build/KardiyoApp.xcarchive`
2. ✅ Development Team ID eklendi: `29WCZ2AG85`
3. ✅ Export options hazırlandı: `ExportOptions.plist`

## 📱 App Store'a Yükleme Yöntemleri

### Yöntem 1: Xcode Organizer (ÖNERİLEN - En Kolay)

1. **Xcode Organizer'ı açın:**
   - Xcode > Window > Organizer
   - Veya `Shift + Command + 9` tuşlarına basın

2. **Archive'ı bulun:**
   - Archives sekmesinde "KardiyoApp" archive'ını seçin
   - Archive şu konumda: `./build/KardiyoApp.xcarchive`

3. **Distribute App:**
   - "Distribute App" butonuna tıklayın
   - "App Store Connect" seçeneğini seçin
   - "Upload" seçeneğini seçin
   - Adımları takip edin

### Yöntem 2: App Store Connect Web Sitesi

1. **App Store Connect'te uygulama oluşturun:**
   - https://appstoreconnect.apple.com adresine gidin
   - Apple Developer hesabınızla giriş yapın
   - "My Apps" > "+" (Yeni Uygulama) butonuna tıklayın

2. **Uygulama bilgilerini doldurun:**
   - **Platform:** iOS
   - **Name:** Kardiyo Programı (veya istediğiniz isim)
   - **Primary Language:** Turkish (veya English)
   - **Bundle ID:** com.kardiyoapp.app
   - **SKU:** KardiyoApp-001 (benzersiz bir kod)

3. **Uygulama detaylarını ekleyin:**
   - Açıklama
   - Kategori
   - Ekran görüntüleri (iPhone için)
   - Uygulama ikonu
   - Gizlilik politikası URL'i (gerekirse)

4. **Xcode Organizer'dan yükleyin:**
   - Xcode Organizer'da archive'ı seçin
   - "Distribute App" > "App Store Connect" > "Upload"

### Yöntem 3: Transporter Uygulaması

1. **Transporter'ı indirin:**
   - Mac App Store'dan "Transporter" uygulamasını indirin

2. **IPA dosyası oluşturun:**
   - Xcode Organizer'dan archive'ı export edin
   - "App Store Connect" seçeneğini seçin
   - Export edilen .ipa dosyasını kaydedin

3. **Transporter ile yükleyin:**
   - Transporter uygulamasını açın
   - Apple ID ile giriş yapın
   - .ipa dosyasını sürükleyip bırakın
   - "Deliver" butonuna tıklayın

## ⚠️ Önemli Notlar

### Gereksinimler:

1. **Apple Developer Program Üyeliği:**
   - Yıllık $99 ücreti gerekiyor
   - https://developer.apple.com/programs/

2. **App Store Connect Hesabı:**
   - Apple Developer hesabınızla aynı

3. **Uygulama Bilgileri:**
   - Uygulama adı
   - Açıklama (en az 1 dilde)
   - Ekran görüntüleri (farklı iPhone boyutları için)
   - Uygulama ikonu (1024x1024)
   - Gizlilik politikası (eğer kullanıcı verisi topluyorsanız)

### İnceleme Süreci:

1. **Gönderim:**
   - Uygulamayı gönderdikten sonra "Waiting for Review" durumuna geçer

2. **İnceleme:**
   - Apple ekibi uygulamayı inceler (genellikle 24-48 saat)

3. **Onay/Red:**
   - Onaylanırsa App Store'da yayınlanır
   - Reddedilirse nedenleri bildirilir ve düzeltme yapılabilir

## 📋 Checklist

- [ ] Apple Developer Program üyeliği aktif
- [ ] App Store Connect'te uygulama oluşturuldu
- [ ] Bundle ID: com.kardiyoapp.app
- [ ] Uygulama adı ve açıklama eklendi
- [ ] Ekran görüntüleri hazırlandı (en az 3 farklı boyut)
- [ ] Uygulama ikonu hazırlandı (1024x1024)
- [ ] Gizlilik politikası hazırlandı (gerekirse)
- [ ] Archive oluşturuldu ve yüklendi
- [ ] İnceleme için gönderildi

## 🔗 Yararlı Linkler

- App Store Connect: https://appstoreconnect.apple.com
- Apple Developer: https://developer.apple.com
- App Store Review Guidelines: https://developer.apple.com/app-store/review/guidelines/
- Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines/

## 💡 İpuçları

1. **TestFlight kullanın:**
   - Yayınlamadan önce TestFlight ile beta test yapın
   - İç test kullanıcıları ekleyin

2. **Ekran görüntüleri:**
   - En az 3 farklı iPhone boyutu için hazırlayın
   - Uygulamanın özelliklerini gösteren görseller kullanın

3. **Açıklama:**
   - Uygulamanın özelliklerini açıkça belirtin
   - Anahtar kelimeler kullanın (SEO için)

4. **Gizlilik:**
   - Kullanıcı verisi topluyorsanız gizlilik politikası ekleyin
   - App Privacy bilgilerini doldurun

## 🚀 Hızlı Başlangıç

En hızlı yöntem:

1. Xcode Organizer'ı açın (`Shift + Command + 9`)
2. Archive'ı seçin
3. "Distribute App" > "App Store Connect" > "Upload"
4. App Store Connect'te uygulama bilgilerini doldurun
5. İnceleme için gönderin

Başarılar! 🎉

