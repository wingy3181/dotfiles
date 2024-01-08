[Cheong][repo]’s dotfiles
==========================

[![CI status for macOS][ci badge macos]][ci link macos]

These are the base dotfiles that I start with when I set up
a new environment (for more specific local needs I use the
[`*.local`](#local-settings) files).

Table of Contents
-----------------

* [🔧 Setup](#setup)
* [📸 Screenshots](#screenshots)
  * [🔁 Git](#git)
  * [⌨️ tmux & Vim](#tmux--vim)
* [💄 Customize](#customize)
  * [🌐 Local Settings](#local-settings)
    * [🐚 `~/.bash.local`](#bashlocal)
    * [🔁 `~/.gitconfig.local`](#gitconfiglocal)
    * [⌨️  `~/.vimrc.local`](#vimrclocal)
* [↕️ Update](#update)
* [🔍 Tips and Tricks](#tips-and-tricks)
  * [🤔 How to test dotfiles?](#how-to-test-dotfiles)
  * [🔥 How to wipe freespace on macbook hard drive?](#how-to-wipe-freespace-on-macbook-hard-drive)
  * [🔎 How to see currently defined aliases and functions?](#how-to-see-currently-defined-aliases-and-functions)
  * [📝 Commonly used aliases/functions](#commonly-used-aliasesfunctions)
* [❓ FAQs](#faqs)
  * [🤔 Should you install XtraFinder?](#should-you-install-xtrafinder)
* [🙏 Acknowledgements](#acknowledgements)
* [📚 References](#references)
* [📑 License](#license)

Setup
-----

> [!CAUTION]
> __DO NOT__ run the `setup` script if you do not fully understand
> [what it does][setup]. Seriously, __DON'T__!

To set up the `dotfiles`:

1. Grant full disk access to the 'Terminal Application' in
   'System Preferences > Privacy & Security > Full Disk Access'.
   Otherwise, there will be issues with the customization of preferences.

   | ![Adding Terminal for Full Disk Access][terminal-app-full-disk-access] |
   |:----------------------------------------------------------------------:|

2. Run the appropriate snippet in the terminal:

   | With confirmation prompts? | Snippet                                                                                    |
   |:---------------------------|:-------------------------------------------------------------------------------------------|
   | Yes                        | `bash -c "$(curl -LsS https://raw.github.com/wingy3181/dotfiles/main/src/os/setup.sh)"`    |
   | No                         | `bash -c "$(curl -LsS https://raw.github.com/wingy3181/dotfiles/main/src/os/setup.sh) -y"` |

   [//]: # (Alternative command with no confirmation prompt: `curl -LsS https://raw.github.com/wingy3181/dotfiles/master/src/os/setup.sh | bash -s -- -y`)

   That's it! ✨

   The setup process will:

    * Download the dotfiles on your computer
      (by default it will suggest `~/.dotfiles`).
    * Create some additional [directories][directories]
    * [Symlink][symlink] the [Git], [shell], [tmux],
      and [Vim] related files.
    * Install applications / command-line tools for
      [macOS][install macos].
    * Set custom [macOS][preferences macos] preferences.
    * Install [Vim][vim plugins] plugins.

Setup process in action:

<!-- markdownlint-disable MD033 -->

| <video src="https://github.com/wingy3181/dotfiles/assets/1212576/3bb611be-a1a2-4cc1-a0d8-1c64f0db63b6" title="Setup process on macOS"/> |
|:---------------------------------------------------------------------------------------------------------------------------------------:|

<!-- markdownlint-enable MD033 -->

Screenshots
-----------

### Git

Output for `git status`:

| ![Output for Git status on macOS][git output macos] |
|:---------------------------------------------------:|

Output for `git log`:

| ![Output for Git log on macOS][git log macos] |
|:---------------------------------------------:|

### tmux & Vim

| ![tmux and Vim on macOS][vim macos] |
|:-----------------------------------:|

Customize
---------

### Environment Variables

The `dotfiles` can be controlled during the installation by using the
following environment variables (This is mainly used for the GitHub
Actions CI build):

#### `DOTFILES_DEBUG_MODE`

If the `DOTFILES_DEBUG_MODE` environment variable is set to `true`, it will
output the standard out and error of the internal commands of each step to
console.

Otherwise, it will execute them quietly/silently.

![DOTFILES_DEBUG_MODE][dotfiles debug mode]

#### `INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX`

If the `INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX` environment variable
is set, it will be used as a regular expression against the application's
readable name (in `.\src\os\macos\installs\install_apps.sh`) and will only be
installed if it matches.

This is used to split the GitHub Actions CI build into multiple jobs so that it
doesn't exceed
the [usage limits](https://docs.github.com/en/actions/learn-github-actions/usage-limits-billing-and-administration#usage-limits)

![INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX][install apps matching regex]

### Local Settings

The dotfiles can be easily extended to suit additional local
requirements by using the following files:

#### `~/.bash.local`

The `~/.bash.local` file will be automatically sourced after all
the other [Bash related files][shell], thus, allowing its content
to add to or overwrite the existing aliases, settings, `PATH`, etc.

Here is an example:

```shell
#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set PATH additions.

PATH="/Users/wingy3181/projects/dotfiles/src/bin/:$PATH"

export PATH

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set local aliases.

alias g="git"
```

#### `~/.gitconfig.local`

The `~/.gitconfig.local` file will be automatically included after
the configurations from `~/.gitconfig`, thus, allowing its content
to overwrite or add to the existing Git configurations.

__Note:__ Use `~/.gitconfig.local` to store sensitive information
such as the Git user credentials, e.g.:

```gitconfig
[commit]

    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/

    gpgSign = true

[user]

    name = Cheong Yip
    email = account@example.com
    signingkey = XXXXXXXX
```

#### `~/.vimrc.local`

The `~/.vimrc.local` file will be automatically sourced after
`~/.vimrc`, thus, allowing its content to add or overwrite the
settings from `~/.vimrc`.

Here is an example:

```vim
" Disable arrow keys in insert mode.

inoremap <Down>  <ESC>:echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>

" Disable arrow keys in normal mode.

nnoremap <Down>  :echoe "Use j"<CR>
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
```

Update
------

To update the dotfiles you can either run the [`setup` script][setup]
or, if you want to update one particular part, run the appropriate
[`os` script](src/os).

Tips and Tricks
---------------

### How to test dotfiles?

#### Method 1: Using GitHub Actions

1. Use either workflows:
   1. [Manual](https://github.com/wingy3181/dotfiles/actions/workflows/install_some_apps.yml)
      ([source](.github/workflows/install_some_apps.yml))
   2. [Scheduled](https://github.com/wingy3181/dotfiles/actions/workflows/install_all_apps.yml)
      ([source](.github/workflows/install_all_apps.yml))

#### Method 2: Using a Virtual Machine

1. Install [UTM](https://mac.getutm.app/) on macOS
2. Download the [macOS image](https://ipsw.me)
3. Create a new VM in UTM using the downloaded macOS image
4. (Optional) Before running and starting the VM, move the image to an external
   SSD.
5. Run the VM and install the dotfiles as per the [setup](#setup) instructions.
6. Within the macOS virtual machine due to the limitation of signing into your
   Apple ID account, XCode needs to be manually downloaded and installed from
   [here](https://xcodereleases.com/).

### How to wipe freespace on macbook hard drive?

> Run the command `diskutil secureErase freespace 3 /Volumes/Macintosh\ HD`

* [https://www.backblaze.com/blog/how-to-wipe-a-mac-hard-drive/](https://www.backblaze.com/blog/how-to-wipe-a-mac-hard-drive/)

### How to see currently defined aliases and functions?

#### Aliases

<!-- markdownlint-disable MD033 -->
> [`dotfiles\src\shell\bash_aliases`](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_aliases)<br/>
> [`dotfiles\src\shell\macos\bash_aliases`](https://github.com/wingy3181/dotfiles/blob/master/src/shell/macos/bash_aliases)<br/>
> [`~\.bash_it\aliases\enabled\*.plugin.bash`](https://github.com/Bash-it/bash-it/tree/master/aliases/available)
<!-- markdownlint-enable MD033 -->

* `alias` - show aliases and their definitions (including [bash-it enabled aliases](https://github.com/Bash-it/bash-it/tree/master/aliases/available))
* `bash-it show aliases` - show aliases enabled via bash-it

#### Functions

<!-- markdownlint-disable MD033 -->
> [`dotfiles\src\shell\bash_functions`](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_functions)<br/>
> [`~\.bash_it\plugins\enabled\*.plugin.bash`](https://github.com/Bash-it/bash-it/tree/master/plugins/available)
<!-- markdownlint-enable MD033 -->

* `declare -F` - list name of all functions defined [(source)](http://stackoverflow.com/questions/4471364/how-do-i-list-the-functions-defined-in-my-shell)
* `type <function name>` - show function definition
* `glossary` - show functions enabled via bash-it with short description of
  each function
* `bash-it show <completions | plugins>` - show completions/plugins enabled
  via bash-it

### Commonly used aliases/functions

* [`afk`](src/shell/macos/bash_aliases) - Lock computer
* [`datauri`](src/shell/bash_functions) - Create data URI from a file
* [`delete-files <file-pattern>`](src/shell/bash_functions) - Delete files that
  match a certain pattern from the current directory. This lists the files
  deleted via the `-ls` option
* [`empty-trash`](src/shell/macos/bash_aliases) - Empty the trash, the main
  HDD, all mounted volumes clear Apple's system logs to improve shell startup
  speed and clear history of files downloaded ([logged internally in macOS](http://www.redmondpie.com/os-x-logs-every-file-you-download-heres-how-you-can-delete-it/))
* [`git sc <search-text>`](src/git/gitconfig) - Search commits by source code
* [`git sm <search-text>`](src/git/gitconfig) - Search commits by commit message
* [`ip`](src/shell/bash_aliases) - Show external ip address
* [`local-ip`](src/shell/macos/bash_aliases) - Show local internal ip address
* [`sh <search=text>`](src/shell/bash_functions) - Search history
* [`st <searchtext>`](src/shell/bash_functions) - Search for text recursively
  within the current directory

FAQs
----

### Should you install XtraFinder?

[XtraFinder](https://www.trankynam.com/xtrafinder/) is a Finder add-on that
adds tabs and cut/paste functionality to Finder. It is not available on the
App Store and requires you to disable System Integrity Protection (SIP) in
order to install it.

SIP is a security feature that prevents malicious software from modifying
protected files and folders on your Mac. It is not recommended to disable
SIP unless you know what you are doing and are willing to compromise your
system's security

For more information, see the following documentations:

* [https://www.trankynam.com/xtrafinder/doc/](https://www.trankynam.com/xtrafinder/doc/)
* [https://support.apple.com/en-us/102149](https://support.apple.com/en-us/102149)

There are scripts to [optionally install](src/os/print_optional_manual_items.sh)
XtraFinder and [custom preferences](src/os/preferences/macos/main.sh)
for it in the dotfiles. However, it is not recommended to install it due to
the security risks mentioned.

Acknowledgements
----------------

A majority of this code is taken
from [Cătălin Mariș'](https://github.com/alrra) [dotfiles](https://github.com/alrra/dotfiles).

Inspiration and code was taken from many sources, including:

* [Mathias Bynens'](https://github.com/mathiasbynens) [dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Cătălin Mariș'](https://github.com/alrra) [dotfiles](https://github.com/alrra/dotfiles)
* [Zach Holman's](https://github.com/holman) [dotfiles](https://github.com/holman/dotfiles)
* [Paul Miller's](https://github.com/paulmillr) [dotfiles](https://github.com/paulmillr/dotfiles)
* [Adam Eivy's](https://github.com/atomantic) [dotfiles](https://github.com/atomantic/dotfiles)
* [Simon Owen's](https://github.com/s10wen) [dotfiles](https://github.com/s10wen/dotfiles)
* [Paul Irish's](https://github.com/paulirish) [dotfiles](https://github.com/paulirish/dotfiles)
* [Sourabh Bajaj's "Mac OS X Setup Guide"](http://sourabhbajaj.com/mac-setup/)
* [Ryan Winchester's "Set up OS X for Web Development in 10 Minutes".](https://ryanwinchester.ca/posts/set-up-os-x-for-web-development-in-10-minutes)

References
----------

### dotfiles

* [GitHub does dotfiles](https://dotfiles.github.io/)
* [Awesome dotfiles](https://github.com/webpro/awesome-dotfiles)
* [Setting Up a Mac Dev Machine From Zero to Hero With Dotfiles.](http://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449)

License
-------

The code is available under the [MIT license][license].

<!-- Link labels: -->

[ci badge macos]: https://github.com/wingy3181/dotfiles/workflows/macOS/badge.svg

[ci link macos]: https://github.com/wingy3181/dotfiles/actions?query=workflow%3AmacOS

[directories]: src/os/create_directories.sh

[dotfiles debug mode]: https://github.com/wingy3181/dotfiles/assets/1212576/6f36e075-eb2f-420c-bc1f-941a8ea55546

[terminal-app-full-disk-access]: https://github.com/wingy3181/dotfiles/assets/1212576/ec35afb8-2eb9-4a5e-9ca9-0ad3ec3d16f0

[git log macos]: https://github.com/wingy3181/dotfiles/assets/1212576/7e4b8c07-5f3b-4228-959f-cd3e69e04296

[git output macos]: https://github.com/wingy3181/dotfiles/assets/1212576/ed906008-e1a4-4a0e-9dcb-714fc56bae32

[Git]: src/git

[install macos]: src/os/installs/macos

[install apps matching regex]: https://github.com/wingy3181/dotfiles/assets/1212576/1a7fb091-5c07-4c7d-81ca-9fccef2c3f24

[license]: LICENSE.txt

[preferences macos]: src/os/preferences/macos

[repo]: https://github.com/wingy3181

[setup]: src/os/setup.sh

[shell]: src/shell

[symlink]: src/os/create_symbolic_links.sh

[tmux]: src/tmux

[vim macos]: https://github.com/wingy3181/dotfiles/assets/1212576/010adaea-5f0f-484f-9910-1a6c9ebbaaa0

[vim plugins]: src/vim/vim/pack/minpac/start

[Vim]: src/vim
