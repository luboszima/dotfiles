#!/bin/bash

set -eufo pipefail

file="/System/Library/Desktop Pictures/Big Sur Waters Edge.madesktop"
osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"${file}\" as POSIX file"