#!/bin/bash
# brew reinstall zsh
# brew cleanup

# to refersh path of vscode and other in .zshrc file in home
# echo $PATH
# source ~/.zshrc
# exec zsh

# add this to path of flutter project and run this to fix issue and check the bundle id from xcode

# sudo chmod +x fix_ios_issue.sh
# ./fix_ios_issue.sh

# Delete Derived Data:
echo "Checking Delete DerivedData..."
sudo chown -R $(whoami) ~/Library/Developer/Xcode/DerivedData/Runner-cwfxbunoqbabwzdliitzhdzikxtb
sudo rm -rf ~/Library/Developer/Xcode/DerivedData/Runner-cwfxbunoqbabwzdliitzhdzikxtb
sudo rm -rf ~/Library/Developer/Xcode/DerivedData

# Check read/write permissions for the current user
sudo chown -R $(whoami) /Users/hellobishyaka/Desktop/consumer/.dart_tool
sudo chown -R $(whoami) /Users/hellobishyaka/Desktop/consumer/.flutter-plugins

# Check if the file exists
if [ -e "ios/.symlinks/plugins" ]; then
    echo "Checking ios/.symlinks/plugins..."
    # Remove extra plugins
    # You might want to add logic here to determine which plugins are extra
    # For simplicity, let's just remove all contents of the directory
    sudo rm -r ios/.symlinks/plugins/*
fi

# Delete podfile.lock if it exists
if [ -e "ios/podfile.lock" ]; then
    echo "Deleting podfile.lock..."
    sudo rm ios/podfile.lock
fi

# Delete podfile if it exists
if [ -e "ios/podfile" ]; then
    echo "Deleting podfile..."
    sudo rm ios/podfile
fi

# Delete pods folder if it exists
if [ -d "ios/pods" ]; then
    echo "Deleting pods folder..."
    sudo rm -r ios/pods
fi

# # Run cocoapods reinstall and pod
echo "Running cocoapods reinstall..."
sudo gem uninstall cocoapods
sudo gem uninstall -n /usr/local/bin cocoapods
cd ios
sudo gem install cocoapods
pod install
cd ..

# Run flutter clean
echo "Running flutter clean..."
flutter clean
sudo rm -rf ~/Library/Developer/Xcode/DerivedData

# Run flutter pub get
echo "Running flutter pub get..."
flutter pub get

# Run flutter run
# echo "Running flutter run..."
echo "Running flutter build ipa..."
# flutter build ipa
flutter run
# flutter run --release
