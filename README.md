# [Cheong](https://github.com/wingy3181)’s dotfiles

[![Build Status](https://travis-ci.org/wingy3181/dotfiles.svg?branch=master)](https://travis-ci.org/wingy3181/dotfiles)

> :exclamation: **NOTE:** These dotfiles are still a :construction: WIP (Work In Progress) as I customise these scripts for my own usage.

These are the base dotfiles that I start with when I set up a
new environment. For more specific local needs I use the `.local`
files described in the [`Local Settings`](#local-settings) section.

## Setup

To set up the `dotfiles` just run the appropriate snippet in the
terminal:

(:warning: **DO NOT** run the `setup` snippet if you don't fully
understand [what it does](src/os/setup.sh). Seriously, **DON'T**!)

| OS | Snippet |
|:---:|:---|
| OS X | `bash -c "$(curl -LsS https://raw.github.com/wingy3181/dotfiles/master/src/os/setup.sh)"` |
| Ubuntu | `bash -c "$(wget -qO - https://raw.github.com/wingy3181/dotfiles/master/src/os/setup.sh)"` |

That's it! :sparkles:

The setup process will:

* Download the dotfiles on your computer (by default it will suggest
  `~/projects/dotfiles`)
* Create some additional [directories](src/os/create_directories.sh)
* [Symlink](src/os/create_symbolic_links.sh) the
  [`git`](src/git),
  [`shell`](src/shell), and
  [`vim`](src/vim) files
* Install applications / command-line tools for
  [OS X](src/os/os_x/installs/main.sh) /
  [Ubuntu](src/os/ubuntu/installs/main.sh)
* Set custom
  [OS X](src/os/os_x/preferences/main.sh) /
  [Ubuntu](src/os/ubuntu/preferences/main.sh) preferences
* Install [`vim` plugins](src/vim/vim/plugins)

Setup process in action:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/11821505/91e437be-a372-11e5-9500-025c316fe22c.gif" alt="Setup process on OS X" width="100%">
            </td>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/15118673/f41d9c8e-1615-11e6-9b25-5a4da543fef1.gif" alt="Setup process on Ubuntu" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>OS X</td>
            <td>Ubuntu</td>
        </td>
    </tbody>
</table>


## Screenshots

### Git

Output for `git status`:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10561038/f9f11a28-7525-11e5-8e1d-a304ad3557f9.png" alt="Output for Git status on OS X" width="100%">
            </td>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/8397636/3708d218-1ddb-11e5-9d40-21c6871271b9.png" alt="Output for Git status on Ubuntu" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>OS X</td>
            <td>Ubuntu</td>
        </td>
    </tbody>
</table>

Output for `git log`:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10560966/e4ec08a6-7523-11e5-8941-4e12f6550a63.png" alt="Output for Git status on OS X" width="100%">
            </td>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10560955/4b5e1300-7523-11e5-9e96-95ea67de9474.png" alt="Output for Git log on Ubuntu" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>OS X</td>
            <td>Ubuntu</td>
        </td>
    </tbody>
</table>

### tmux + vim

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10561007/498e1212-7525-11e5-8252-81503b3d6184.png" alt="tmux and vim on OS X" width="100%">
            </td>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10560956/557ca2de-7523-11e5-9000-fc1e189a95f5.png" alt="tmux and vim on Ubuntu" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>OS X</td>
            <td>Ubuntu</td>
        </td>
    </tbody>
</table>


## Customize

### Local Settings

The `dotfiles` can be easily extended to suit additional local
requirements by using the following files:

#### `~/.bash.local`

If the `~/.bash.local` file exists, it will be automatically sourced
after all the other [`bash` related files](src/shell), thus, allowing
its content to add to or overwrite the existing aliases, settings,
PATH, etc.

Here is a very simple example of a `~/.bash.local` file:

```bash

#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set local aliases

alias starwars="telnet towel.blinkenlights.nl"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set PATH additions

PATH="/usr/local/bin:$PATH"
PATH="$PATH:$HOME/projects/dotfiles/src/bin"

export PATH

```

#### `~/.gitconfig.local`

If the `~/.gitconfig.local` file exists, it will be automatically
included after the configurations from `~/.gitconfig`, thus, allowing
its content to overwrite or add to the existing `git` configurations.

__Note:__ Use `~/.gitconfig.local` to store sensitive information such
as the `git` user credentials, e.g.:

```bash
[user]
    name = Cheong Yip
    email = wingy3181@example.com
    signingkey = XXXXXXXX
```

#### `~/.vimrc.local`

If the `~/.vimrc.local` file exists, it will be automatically sourced
after `~/.vimrc`, thus, allowing its content to add or overwrite the
settings from `~/.vimrc`.


### Forks

If you decide to fork this project, don't forget to substitute my
username with your own in the [`setup` snippets](#setup) and [in the
`setup` script](https://github.com/wingy3181/dotfiles/blob/1503cf23ef23f6e31342b140bcd246625160b94f/src/os/setup.sh#L3).


## Update

To update the dotfiles you can either run the [`setup`
script](src/os/setup.sh) or, if you want to just update one particular
part, run the appropriate [`os` script](src/os).

## Acknowledgements

A majority of this code is taken from [Cătălin Mariș'](https://github.com/alrra) [dotfiles](https://github.com/alrra/dotfiles).

Inspiration and code was taken from many sources, including:

* [Mathias Bynens'](https://github.com/mathiasbynens) [dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Cătălin Mariș'](https://github.com/alrra) [dotfiles](https://github.com/alrra/dotfiles)
* [Zach Holman's](https://github.com/holman) [dotfiles](https://github.com/holman/dotfiles)
* [Paul Miller's](https://github.com/paulmillr) [dotfiles](https://github.com/paulmillr/dotfiles)
* [Adam Eivy's](https://github.com/atomantic) [dotfiles](https://github.com/atomantic/dotfiles)
* [Simon Owen's](https://github.com/s10wen) [dotfiles](https://github.com/s10wen/dotfiles)
* [Paul Irish's](https://github.com/paulirish) [dotfiles](https://github.com/paulirish/dotfiles)
* [Sourabh Bajaj's "Mac OS X Setup Guide"](http://sourabhbajaj.com/mac-setup/)
* [Ryan Winchester's "Set up OS X for Web Development in 10 Minutes"](https://ryanwinchester.ca/posts/set-up-os-x-for-web-development-in-10-minutes)

## References

### dotfiles
* [GitHub does dotfiles](https://dotfiles.github.io/)
* [Awesome dotfiles](https://github.com/webpro/awesome-dotfiles)
* [Setting up a new (OS X) development machine: Part 3 - Dotfiles and custom SSH config](https://mattstauffer.co/blog/setting-up-a-new-os-x-development-machine-part-3-dotfiles-rc-files-and-ssh-config)
* [Setting Up a Mac Dev Machine From Zero to Hero With Dotfiles - Part 1](http://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles--net-35449)
* [Setting Up a Mac Dev Machine From Zero to Hero With Dotfiles - Part 2](http://code.tutsplus.com/tutorials/setting-up-a-mac-dev-machine-from-zero-to-hero-with-dotfiles-part-2--cms-23145)

### OSX Commands
* [OSX Default Values Command Reference](https://github.com/kevinSuttle/OSXDefaults/blob/master/REFERENCE.md)

### Bash
* [Bash Reference Manual](https://www.gnu.org/software/bash/manual/html_node/index.html)
* [Advanced Bash Scripting Guide](http://www.tldp.org/LDP/abs/html/index.html)
  * [Internal Variables](http://www.tldp.org/LDP/abs/html/internalvariables.html)
* [Reference Manual Variable Index](https://www.gnu.org/software/bash/manual/html_node/Variable-Index.html)
* [Bash Parameter Expansion](http://wiki.bash-hackers.org/syntax/pe)
* [Bash String manipulation](http://www.thegeekstuff.com/2010/07/bash-string-manipulation/)
* [Bash Array tutorial](http://www.thegeekstuff.com/2010/06/bash-array-tutorial/)
# [Shell Colors: Colorizing Shell Scripts](http://www.bashguru.com/2010/01/shell-colors-colorizing-shell-scripts.html)
*  http://askubuntu.com/questions/350208/what-does-2-dev-null-mean
   - `> file` redirects stdout to file
   - `1> file` redirects stdout to file
   - `2> file` redirects stderr to file
   - `&> file` redirects stdout and stderr to file
   - `/dev/null` is the null device it takes any input you want and throws it away. It can be used to suppress any output.

### dotfiles script breakdown

<pre>
-> os\setup.sh
   [source] os\utils.sh
   -> os\create_directories.sh
   -> os\create_symbolic_links.sh
   -> os\install_applications.sh
      --------
      FOR OS X
      --------
      -> os\os_x\installs\main.sh
         [source] os\utils.sh
         [source] os\os_x\installs\utils.sh]
         -> os\os_x\installs\install_xcode.sh
         -> os\os_x\installs\install_homebrew.sh
         -> {Brew install bash shell + enhancements}
         -> os\os_x\installs\change_default_bash_version.sh
         -> {Brew install applications}
         -> os\os_x\installs\update_and_upgrade.sh
         -> os\os_x\installs\cleanup.sh
      ----------
      FOR UBUNTU
      ----------
      -> os\ubuntu\installs\main.sh
         [source] os\utils.sh
         [source] os\ubuntu\installs\utils.sh]
         -> {apt get applications}


   -> os\install_node_versions.sh
   -> os\install_npm_packages.sh
   -> os\set_preferences.sh
      --------
      FOR OS X
      --------
      -> os\os_x\preferences\main.sh
      -> os\os_x\preferences\set_app_store_preferences.sh
      -> os\os_x\preferences\set_chrome_preferences.sh
      -> os\os_x\preferences\set_dashboard_preferences.sh
      -> os\os_x\preferences\set_dock_preferences.sh
      -> os\os_x\preferences\set_finder_preferences.sh
      -> os\os_x\preferences\set_firefox_preferences.sh
      -> os\os_x\preferences\set_keyboard_preferences.sh
      -> os\os_x\preferences\set_language_and_region_preferences.sh
      -> os\os_x\preferences\set_maps_preferences.sh
      -> os\os_x\preferences\set_photos_preferences.sh
      -> os\os_x\preferences\set_safari_preferences.sh
      -> os\os_x\preferences\set_terminal_preferences.sh
      -> os\os_x\preferences\set_textedit_preferences.sh
      -> os\os_x\preferences\set_trackpad_preferences.sh
      -> os\os_x\preferences\set_transmission_preferences.sh
      -> os\os_x\preferences\set_ui_and_ux_preferences.sh

      ----------
      FOR UBUNTU
      ----------
      -> os\ubuntu\preferences\main.sh
         [source] os\utils.sh
         -> os\ubuntu\preferences\set_privacy_preferences.sh
         -> os\ubuntu\preferences\set_terminal_preferences.sh
         -> os\ubuntu\preferences\set_ui_and_ux_preferences.sh

   -> os\initialize_git_repository.sh
   -> os\update_content.sh
      -> {Generate SSH key}
   -> os\install_vim_plugins.sh
   -> os\restart.sh
</pre>

## License

The code is available under the [MIT license](LICENSE.txt).
