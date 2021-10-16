#!/bin/sh

flutter clean
flutter pub get
flutter build web --release --base-href "/carbon/"
rm -r ./docs
cp -r ./build/web ./docs
