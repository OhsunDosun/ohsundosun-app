#!/bin/sh
read -p "Version Up (y,n): " versionUp

if [ $versionUp = "y" ]
then
    sh ./scripts/version-up.sh
else
    sh ./scripts/clean.sh
fi

# Deploy android 
cd android
fastlane fb_dev

# Deploy ios 
cd ../ios
fastlane fb_dev