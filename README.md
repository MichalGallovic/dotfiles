# Michals's Dotfiles (compatible with Mac OS Monterey 12.X)

This repository serves as my way to help me setup and maintain my Mac.

This repository is heavily based on [Dries Vints's dotfiles](https://github.com/driesvints/dotfiles) sprinkled with my own set of binaries and apps defined in `Brewfile` and MacOS preferences defined in `.macos`.

## A Fresh macOS Setup

These instructions are for when you've already set up your dotfiles. If you want to get started with your own dotfiles you can [find instructions below](#your-own-dotfiles).

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?
- Did you backup [Firefox Profile](https://support.mozilla.org/en-US/kb/back-and-restore-information-firefox-profiles) ?
- Did you export Phpstorm settings ?
- Did you export ~/.z ?

### Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release.
To install fresh macOs:

```
# download desired version of macOs using
git clone https://gitlab.com/julianfairfax/macos-downloader.git

# create bootable usb
sudo ./Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/<usb> --applicationpath <path_to_installation> --nointeraction

# this will erase, format and create bootable usb with desired version of osx
# you should see output like
# Erasing Disk: 0%... 10%... 20%...100%...
# Copying installer files to disk...
# Copy complete.
# Making disk bootable...
# Copying boot files...
# Copy complete.
# Done.
```

### Setting up your Mac

If you did all of the above you may now follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:
  ```zsh
  curl https://raw.githubusercontent.com/MichalGallovic/dotfiles/macos/12-monterey/.ssh | sh -s "<your-email-address>"
  ```
3. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone --recursive git@github.com:MichalGallovic/dotfiles.git ~/.dotfiles
    ```

4. Run the installation with:

    ```zsh
    ~/.dotfiles/install.sh
    ```

5. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
6. Restart your computer to finalize the process
7. Don't forget to add your new public SSH key to `authorized_keys` wherever you use it to ssh into.

Your Mac is now ready to use!
