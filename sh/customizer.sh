#!/bin/zsh

# exit when any command fails
set -e

if [[ $# -lt 1 ]]; then
   echo "Usage: bash customizer.sh {my.new.package} [{ApplicationName}]" >&2
   exit 2
fi

PACKAGE=$1
APPNAME=$2
SUBDIR=${PACKAGE//.//} # Replaces . with /

for n in $(find . -type d \( -path '*/src/androidTest' -or -path '*/src/main' -or -path '*/src/test' \) )
do
  echo "Creating $n/java/$SUBDIR"
  mkdir -p $n/java/$SUBDIR
  echo "Moving files to $n/java/$SUBDIR"
  mv $n/java/android/template/* $n/java/$SUBDIR
  echo "Removing old $n/java/android/template"
  rm -rf mv $n/java/android
done

# Rename package and imports
echo "Renaming packages to $PACKAGE"
find ./ -type f -name "*.kt" -exec sed -i.bak "s/package android.template/package $PACKAGE/g" {} \;
find ./ -type f -name "*.kt" -exec sed -i.bak "s/import android.template/import $PACKAGE/g" {} \;

# Gradle files
find ./ -type f -name "*.kts" -exec sed -i.bak "s/android.template/$PACKAGE/g" {} \;

echo "Cleaning up"
find . -name "*.bak" -type f -delete

# Rename app
if [[ $APPNAME ]]
then
    echo "Renaming app to $APPNAME"
    find ./ -type f \( -name "settings.gradle.kts" -or -name "*.xml" \) -exec sed -i.bak "s/TemplateAndroid/$APPNAME/g" {} \;
    find . -name "*.bak" -type f -delete
    echo "# $APPNAME" > README.md
fi

# Remove additional files
echo "Removing additional files"
rm -rf ./sh/customizer.sh
echo "Done!"
