#!/bin/bash -
echo "Starting Install of IasActiveDirectory..."
source ./bin/install.sh

echo "Starting new instance..."

irb -r 'ias_active_directory'
