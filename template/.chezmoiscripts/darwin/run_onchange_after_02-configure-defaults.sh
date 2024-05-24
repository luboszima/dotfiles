#!/bin/bash

set -eufo pipefail

defaults write -g AppleAccentColor -int 4
defaults write -g AppleEnableSwipeNavigateWithScrolls 'Dark'
defaults write -g AppleInterfaceStyle -int 1
defaults write -g AppleMeasurementUnits 'Centimeters'
defaults write -g AppleTemperatureUnit 'Celsius'
defaults write -g AppleMetricUnits -int 1
defaults write -g AppleMiniaturizeOnDoubleClick -int 0
defaults write -g ApplePressAndHoldEnabled -int 0
defaults write -g NSAutomaticCapitalizationEnabled -int 0
defaults write -g NSAutomaticDashSubstitutionEnabled -int 1
defaults write -g NSAutomaticInlinePredictionEnabled -int 0
defaults write -g NSAutomaticPeriodSubstitutionEnabled -int 1
defaults write -g NSAutomaticQuoteSubstitutionEnabled -int 0
defaults write -g NSAutomaticSpellingCorrectionEnabled -int 0
defaults write -g WebAutomaticSpellingCorrectionEnabled -int 0
defaults write -g com.apple.swipescrolldirection -int 0
defaults write -g com.apple.trackpad.forceClick -int 1

# Avoid creating .DS_Store files on USB or network volumes
defaults write com.apple.desktopservices dsdontwriteusbstores -bool true
defaults write com.apple.desktopservices dsdontwritenetworkstores -bool true

# Search in current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string SCcf