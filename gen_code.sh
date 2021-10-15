#!/bin/sh

# For translation
flutter pub run intl_utils:generate

# For other code generation
flutter pub run build_runner build --delete-conflicting-outputs
