#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# 1. Clone the Flutter SDK from the stable branch.
echo "Cloning Flutter SDK..."
git clone https://github.com/flutter/flutter.git --depth 1 --branch stable /flutter

# 2. Add the Flutter tool to the system's PATH.
export PATH="$PATH:/flutter/bin"

# 3. Run flutter doctor to confirm the installation and see the version.
echo "Running flutter doctor..."
flutter doctor

# 4. Get your project's dependencies.
echo "Getting dependencies..."
flutter pub get

# 5. Build the Flutter web application for production.
echo "Building Flutter web app..."
flutter build web