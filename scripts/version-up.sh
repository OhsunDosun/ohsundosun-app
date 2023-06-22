#!/bin/sh

# Update version
echo "Update app version"
# Get version
version_and_no_string=`grep "version\: " ./pubspec.yaml | head -1`
# Remove version: string
version_and_no=`echo $version_and_no_string | sed -e "s/version\: //g"`
# Split version and no
tmp_version_and_no=(`echo $version_and_no | tr "+" "\n"`)

# Version
version=${tmp_version_and_no[0]}

tmp_version=(`echo $version | tr "." "\n"`)

major=${tmp_version[0]}
minor=${tmp_version[1]}
patch=${tmp_version[2]}

# No
no=${tmp_version_and_no[1]}

# New version
if [ -z $1 ]
then
    new_version="$major.$minor.$patch"
else
    new_version="$1"
fi

# New no
if [ -z $2 ]
then
    new_no=`expr $no + 1`
else
    new_no="$2"
fi

new_version_and_no_string="version: $new_version+$new_no"

sed -i "" "s/$version_and_no_string/$new_version_and_no_string/g" pubspec.yaml

sh ./scripts/clean.sh