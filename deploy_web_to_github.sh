#!/bin/sh

flutter clean
flutter pub get
flutter build web --release
cp -r ./build/web ./deploy_web
