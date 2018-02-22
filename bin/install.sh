#!/bin/bash -
echo "Building Gemspec..."
gem build ias_active_directory.gemspec

# Find version number
GEM_VERSION=$(grep -E "(VERSION =\s'[0-9]+.[0-9]+.[0-9]+')" ./lib/ias_active_directory/version.rb | grep -Eo "([0-9]+.[0-9]+.[0-9]+)")

echo "Installing Gem..."
gem install ias_active_directory-$GEM_VERSION.gem
