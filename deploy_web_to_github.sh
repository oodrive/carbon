#!/bin/sh

flutter clean
flutter pub get
flutter build web --release
rm -r ./docs
cp -r ./build/web ./docs
