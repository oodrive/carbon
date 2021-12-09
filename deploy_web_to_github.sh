#!/bin/sh

flutter clean
flutter pub get
flutter build web --release --base-href "/carbon/" --web-renderer canvaskit
rm -rf ./docs
cp -r ./build/web ./docs
