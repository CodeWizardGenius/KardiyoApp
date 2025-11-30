#!/bin/bash
# Basit placeholder icon'lar oluştur

# 1024x1024 master icon oluştur (basit bir kare)
sips -s format png -z 1024 1024 --setProperty formatOptions low /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/GenericApplicationIcon.icns --out AppIcon-1024x1024.png 2>&1 || \
sips -c 1024 1024 -s format png /System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/GenericApplicationIcon.icns --out AppIcon-1024x1024.png 2>&1 || \
echo "1024x1024 icon oluşturulamadı, manuel oluşturmanız gerekecek"

# Diğer boyutları 1024'ten oluştur
if [ -f "AppIcon-1024x1024.png" ]; then
    sips -z 40 40 AppIcon-1024x1024.png --out AppIcon-20x20@2x.png
    sips -z 60 60 AppIcon-1024x1024.png --out AppIcon-20x20@3x.png
    sips -z 58 58 AppIcon-1024x1024.png --out AppIcon-29x29@2x.png
    sips -z 87 87 AppIcon-1024x1024.png --out AppIcon-29x29@3x.png
    sips -z 80 80 AppIcon-1024x1024.png --out AppIcon-40x40@2x.png
    sips -z 120 120 AppIcon-1024x1024.png --out AppIcon-40x40@3x.png
    sips -z 120 120 AppIcon-1024x1024.png --out AppIcon-60x60@2x.png
    sips -z 180 180 AppIcon-1024x1024.png --out AppIcon-60x60@3x.png
    sips -z 20 20 AppIcon-1024x1024.png --out AppIcon-20x20@1x.png
    sips -z 29 29 AppIcon-1024x1024.png --out AppIcon-29x29@1x.png
    sips -z 40 40 AppIcon-1024x1024.png --out AppIcon-40x40@1x.png
    sips -z 76 76 AppIcon-1024x1024.png --out AppIcon-76x76@1x.png
    sips -z 152 152 AppIcon-1024x1024.png --out AppIcon-76x76@2x.png
    sips -z 167 167 AppIcon-1024x1024.png --out AppIcon-83.5x83.5@2x.png
    echo "✅ Tüm icon'lar oluşturuldu!"
else
    echo "❌ 1024x1024 icon oluşturulamadı!"
fi
