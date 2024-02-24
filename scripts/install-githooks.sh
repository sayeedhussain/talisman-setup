#!/bin/sh

set -e

cp 'scripts/pre-commit' '.git/hooks'
chmod +x '.git/hooks/pre-commit'