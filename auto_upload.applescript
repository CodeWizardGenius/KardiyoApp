-- App Store'a otomatik yükleme scripti
tell application "Xcode"
    activate
    delay 2
end tell

tell application "System Events"
    tell process "Xcode"
        -- Organizer'ı aç (Shift + Command + 9)
        keystroke "9" using {shift down, command down}
        delay 3
        
        -- Archive'ı seçmek için tıklama
        -- Not: Bu kısım manuel olarak yapılması gerekebilir
        -- çünkü archive listesi dinamik olabilir
        
        display dialog "Xcode Organizer açıldı. Lütfen:" & return & return & "1. 'KardiyoApp' archive'ını seçin" & return & "2. 'Distribute App' butonuna tıklayın" & return & "3. 'App Store Connect' seçin" & return & "4. 'Upload' seçin" & return & "5. Adımları takip edin" buttons {"Tamam"} default button 1
    end tell
end tell

