#!/bin/bash -
echo "Uninstalling Gem"
gem uninstall ias_active_directory

# Find version number
GEM_VERSION=$(grep -E "(VERSION =\s'[0-9]+.[0-9]+.[0-9]+')" ./lib/ias_active_directory/version.rb | grep -Eo "([0-9]+.[0-9]+.[0-9]+)")

if [ -f "ias_active_directory-$GEM_VERSION.gem" ]; then
  echo "Removing source gem"
  rm ias_active_directory-$GEM_VERSION.gem
fi
