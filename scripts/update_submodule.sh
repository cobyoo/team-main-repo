#!/bin/bash
set -e
echo "Updating submodule..."
git submodule update --init --remote --recursive
echo "Done."