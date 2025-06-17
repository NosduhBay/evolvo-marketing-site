#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# 1. Clone Flutter into a LOCAL directory named 'flutter_sdk' instead of the root.
#    This respects the build server's file permissions.
echo "Cloning Flutter SDK into a local directory..."
git clone https://github.com/flutter/flutter.git --depth 1 --branch stable ./flutter_sdk

# 2. Add the LOCAL flutter bin directory to the path.
#    Note the './' which signifies the current project directory.
export PATH="$PATH:./flutter_sdk/bin"

# --- The rest of the script is the same ---

# 3. Run flutter doctor to confirm the installation and see the version.
echo "Running flutter doctor..."
flutter doctor

# 4. Get your project's dependencies.
echo "Getting dependencies..."
flutter pub get

# 5. Build the Flutter web application for production.
echo "Building Flutter web app..."
flutter build web