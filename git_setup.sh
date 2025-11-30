#!/bin/bash

# Git remote ekleme scripti
# Kullanım: ./git_setup.sh <repository-url>

if [ -z "$1" ]; then
    echo "📋 Git Remote Ekleme"
    echo ""
    echo "Kullanım: ./git_setup.sh <repository-url>"
    echo ""
    echo "Örnek:"
    echo "  ./git_setup.sh https://github.com/kullaniciadi/KardiyoApp.git"
    echo ""
    echo "GitHub'da yeni repository oluşturmak için:"
    echo "  1. https://github.com/new adresine gidin"
    echo "  2. Repository name: KardiyoApp"
    echo "  3. Public veya Private seçin"
    echo "  4. 'Create repository' tıklayın"
    echo "  5. URL'yi kopyalayın ve bu script'e verin"
    echo ""
    exit 1
fi

REPO_URL=$1

echo "🔗 Git remote ekleniyor..."
echo "Repository URL: $REPO_URL"
echo ""

# Remote ekle
git remote add origin "$REPO_URL"

if [ $? -eq 0 ]; then
    echo "✅ Remote başarıyla eklendi!"
    echo ""
    echo "📤 İlk push için:"
    echo "   git push -u origin main"
    echo ""
else
    echo "❌ Remote eklenirken hata oluştu!"
    echo "Remote zaten mevcut olabilir. Kontrol edin:"
    echo "   git remote -v"
    exit 1
fi

