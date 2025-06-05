#!/bin/bash

# Exit if any command fails
set -e

echo "🚀 Starting Flutter Web build..."
flutter clean
flutter pub get

flutter build web --release --target lib/main_production.dart

echo "✅ Build complete."

cd build/web

echo "📁 Switching to gh-pages branch..."
git init
git remote add origin https://github.com/Ali-Asad14/cross-culture.git
git checkout -b gh-pages

echo "🧹 Cleaning previous commits..."
git add .
git commit -m "Deploy Flutter web app"
git push -f origin gh-pages

echo "🎉 Deployment complete! Visit: https://ali-asad14.github.io/cross-culture/"
