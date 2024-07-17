#!/usr/bin/env bash

# https://github.com/narze/dotfiles/blob/master/chezmoi/.chezmoiscripts/run_once_after_darwin_98_macos-preferences.sh.tmpl

# Require password immediately after sleep or screen saver begins
sudo defaults write com.apple.screensaver askForPassword -int 1
sudo defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
sudo defaults write com.apple.screencapture location -string "${HOME}/Pictures"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
sudo defaults write com.apple.screencapture type -string "png"

# Show icons for hard drives, servers, and removable media on the desktop
sudo defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
sudo defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
sudo defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
sudo defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show hidden files by default
sudo defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Keep folders on top when sorting by name
sudo defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Avoid creating .DS_Store files on network or USB volumes
sudo defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
sudo defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically open a new Finder window when a volume is mounted
sudo defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
sudo defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
sudo defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
sudo defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Enable the warning before emptying the Trash
sudo defaults write com.apple.finder WarnOnEmptyTrash -bool true

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
sudo defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
sudo defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
sudo defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
sudo defaults write NSGlobalDomain AppleMetricUnits -bool true

# Increase sound quality for Bluetooth headphones/headsets
sudo defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Disable smart quotes as they’re annoying when typing code
sudo defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable automatic capitalization as it’s annoying when typing code
sudo defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
sudo defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
sudo defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Only use UTF-8 in Terminal.app
sudo defaults write com.apple.terminal StringEncodings -array 4

# Show the main window when launching Activity Monitor
sudo defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
sudo defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
sudo defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
sudo defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
sudo defaults write com.apple.ActivityMonitor SortDirection -int 0

# Enable the debug menu in Disk Utility
sudo defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
sudo defaults write com.apple.DiskUtility advanced-image-options -bool true

# Auto-play videos when opened with QuickTime Player
sudo defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true

# Prevent Photos from opening automatically when devices are plugged in
sudo defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable smart quotes as it’s annoying for messages that contain code
sudo defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "


sudo defaults write io.tailscale.ipn.macsys SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# tailscale start on login
defaults write io.tailscale.ipn.macsys TailscaleStartOnLogin -int 1