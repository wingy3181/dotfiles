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
| `macOS` | `bash -c "$(curl -LsS https://raw.github.com/wingy3181/dotfiles/master/src/os/setup.sh)"` |

That's it! :sparkles:

The setup process will:

* Download the dotfiles on your computer (by default it will suggest
  `~/.dotfiles`)
* Create some additional [directories](src/os/create_directories.sh)
* [Symlink](src/os/create_symbolic_links.sh) the
  [`git`](src/git),
  [`shell`](src/shell), and
  [`vim`](src/vim) files
* Install applications / command-line tools for
  [`macOS`](src/os/install/macos)
* Set custom
  [`macOS`](src/os/preferences/macos)
* Install [`vim` plugins](src/vim/vim/plugins)

Setup process in action:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/11821505/91e437be-a372-11e5-9500-025c316fe22c.gif" alt="Setup process on macOS" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
        </tr>
    </tbody>
</table>


## Screenshots

### Git

Output for `git status`:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10561038/f9f11a28-7525-11e5-8e1d-a304ad3557f9.png" alt="Output for Git status on macOS" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
        </tr>
    </tbody>
</table>

Output for `git log`:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10560966/e4ec08a6-7523-11e5-8941-4e12f6550a63.png" alt="Output for Git status on macOS" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
        </tr>
    </tbody>
</table>

### tmux & vim

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10561007/498e1212-7525-11e5-8252-81503b3d6184.png" alt="tmux and vim on macOS" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
        </tr>
    </tbody>
</table>


## Customize

### Environment Variables

The `dotfiles` can be controlled during the installation by using the following environment variables (This is mainly used for the travis CI build):

#### `DOTFILES_DEBUG_MODE`

If the `DOTFILES_DEBUG_MODE` environment variable is set to `true`, it will output the standard out and error of the internal commands of each step to console.

Otherwise, it will execute them quietly/silently.

![DOTFILES_DEBUG_MODE](https://cloud.githubusercontent.com/assets/1212576/16102567/f929757a-33b3-11e6-8929-0f891fc1bc4c.png)

#### `INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX`

If the `INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX` environment variable is set, it will be used as a regular expression against the application's readable name (in `.\src\os\macos\installs\install_apps.sh`) and will only be installed if it matches.

This is used to split the Travis CI build into multiple jobs so that it doesn't exceed the [maximum time limit](https://docs.travis-ci.com/user/customizing-the-build/#Build-Timeouts)

![INSTALL_APPLICATION_IF_READABLE_NAME_MATCH_REGEX](https://cloud.githubusercontent.com/assets/1212576/16102376/2c9e06e8-33b2-11e6-9174-d05a64f3fbcb.png)

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

#!/usr/bin/env bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set local aliases

alias starwars="telnet towel.blinkenlights.nl"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set PATH additions

PATH="$PATH:$HOME/Development/code/github/wingy3181/dotfiles/src/bin"

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

## Tips and Tricks

- ### How to see currently defined aliases and functions?
  - #### Aliases

  > [`dotfiles\src\shell\bash_aliases`](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_aliases)<br/>
  > [`dotfiles\src\shell\macos\bash_aliases`](https://github.com/wingy3181/dotfiles/blob/master/src/shell/macos/bash_aliases)<br/>
  > [`~\.bash_it\aliases\enabled\*.plugin.bash`](https://github.com/Bash-it/bash-it/tree/master/aliases/available)<br/>

    - `alias` - show aliases and their definitions (including [bash-it enabled aliases](https://github.com/Bash-it/bash-it/tree/master/aliases/available))
    - `bash-it show aliases` - show aliases enabled via bash-it

  - #### Functions

  > [`dotfiles\src\shell\bash_functions`](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_functions)<br>
  > [`~\.bash_it\plugins\enabled\*.plugin.bash`](https://github.com/Bash-it/bash-it/tree/master/plugins/available)<br/>
  
    - `declare -F` - list name of all functions defined [(source)](http://stackoverflow.com/questions/4471364/how-do-i-list-the-functions-defined-in-my-shell)
    - `type <function name>` - show function definition
    - `glossary` - show functions enabled via bash-it with short description of each function
    - `bash-it show plugins` - show plugins enabled via bash-it

- ### Commonly used aliases/functions
  - [**`afk`**](https://github.com/wingy3181/dotfiles/blob/master/src/shell/macos/bash_aliases#L73) - Lock computer
  - [**`datauri`**](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_functions#L35) - Create data URI from a file
  - [**`delete-files <file-pattern>`**](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_functions#L65) - Delete files that match a certain pattern from the current directory. This lists the files deleted via the -ls option
  - [**`empty-trash`**](https://github.com/wingy3181/dotfiles/blob/master/src/shell/macos/bash_aliases#L44) - Empty the trash, the main HDD, all mounted volumes, clear Apple's [system logs](# (https://crucialsecurityblog.harris.com/2011/08/24/the-apple-system-log-%E2%80%93-part-2-%E2%80%93-console-app/) to improve shell startup speed and clear history of files downloaded ([logged internally in macOS](http://www.redmondpie.com/os-x-logs-every-file-you-download-heres-how-you-can-delete-it/))
  - [**`git cc <search-text>`**](https://github.com/wingy3181/dotfiles/blob/master/src/git/gitconfig#L25) - Find commits by source code
  - [**`git cm <search-text>`**](https://github.com/wingy3181/dotfiles/blob/master/src/git/gitconfig#L36) - Find commits by commit message
  - [**`ip`**](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_aliases#L21) - Show external ip address
  - [**`local-ip`**](https://github.com/wingy3181/dotfiles/blob/master/src/shell/macos/bash_aliases#L79) - Show local internal ip address
  - [**`qh <search=text>`**](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_functions#L179) - Search history
  - [**`qt <searchtext>`**](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_functions#L195) - Search for text recursively within the current directory

- ### Setup JDKs in IntelliJ
  > `~/Library/Preferences/IntelliJIdea2016.1/options/jdk.table.xml` stores the config that IntelliJ uses for the Project SDKs

  - Follow these [instructions](http://stackoverflow.com/questions/31215452/intellij-idea-importing-gradle-project-getting-java-home-not-defined-yet?answertab=votes#tab-top) with the java SDKs installed at `~\.jenv\versions\*`

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
* [Shell Colors: Colorizing Shell Scripts](http://www.bashguru.com/2010/01/shell-colors-colorizing-shell-scripts.html)
*  http://askubuntu.com/questions/350208/what-does-2-dev-null-mean
   - `> file` redirects stdout to file
   - `1> file` redirects stdout to file
   - `2> file` redirects stderr to file
   - `&> file` redirects stdout and stderr to file
   - `/dev/null` is the null device it takes any input you want and throws it away. It can be used to suppress any output.

### Bash Completion

#### Overview
- http://www.tldp.org/LDP/abs/html/tabexpansion.html
- https://debian-administration.org/article/316/An_introduction_to_bash_completion_part_1
- https://debian-administration.org/article/317/An_introduction_to_bash_completion_part_2

#### More information and sources
- **default/standard bash completion locations** - `/etc/bash_completion/*` and `/etc/bash_completion.d/*`
- **bash-completion2** https://bash-completion.alioth.debian.org/ => https://github.com/scop/bash-completion
  - *locations*:
    - `$(brew --prefix)/share/bash-completion/bash_completion/*`
    - `/usr/local/etc/bash_completion.d/*`
  - *installed via [`dotfiles/src/os/install/macos/bash.sh`](https://github.com/wingy3181/dotfiles/blob/master/src/os/install/macos/bash.sh#L66)
    (installing bash-completion2 via brew)* and sourced from [`dotfiles/src/shell/macos/bash_autocomplete`](https://github.com/wingy3181/dotfiles/blob/master/src/shell/macos/bash_autocomplete)
    (indirectly via [`~/.bash_profile`](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_profile))<br/>
    **NOTE**: After installing bash-completion2 the below [caveat](https://github.com/Homebrew/homebrew-versions/blob/246bf7d37ec262cd4ecf68b79f0933be64de2249/bash-completion2.rb#L59) is displayed

  ```bash
Add the following to your ~/.bash_profile:
  if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
  fi

  Homebrew\'s own bash completion script has been linked into
    /usr/local/share/bash-completion/completions
  bash-completion will automatically source it when you invoke `brew`.

  Any completion scripts in /usr/local/etc/bash_completion.d
  will continue to be sourced as well.
  ```
  - **nvm** - `~/.nvm/bash_completion`
    - setup in `~/.bash.local` by [`dotfiles/src/os/install/node_versions.sh`](https://github.com/wingy3181/dotfiles/blob/master/src/os/install/node_versions.sh#L54)

  - **Bash-it** - `~/.bash_it/completion/enabled/*.completion.bash`
    - setup by the following script breakdown:
      - [`~/.bash_bash-it`](https://github.com/wingy3181/dotfiles/blob/master/src/shell/bash_bash-it)
        - [`~/.bash_it/bash_it.sh`](https://github.com/Bash-it/bash-it/blob/master/bash_it.sh#L51)
          - `~/.bash_it/completion/enabled/*.completion.bash`

  - **jenv** - `~/.jenv/completions/jenv.bash`
    - setup by the following script breakdown:
      - `~/.bash.local` by [`dotfiles/src/os/install/jenv.sh`](https://github.com/wingy3181/dotfiles/blob/master/src/os/install/jenv.sh#L66)
        - [`~/.jenv/bin/jenv`](https://github.com/gcuisinier/jenv/blob/master/bin/jenv) -> `~/.jenv/libexec/jenv-init` (symbolic link)
          - ~/.jenv/libexec/jenv-init
            - ~/.jenv/completions/jenv.bash

  ```bash
# ~/.bash.local
export JENV_DIR="/Users/cyip2/.jenv"
export PATH="$JENV_DIR/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
  ```

### [Homebrew](http://brew.sh/) and [Homebrew Cask](https://caskroom.github.io/)
- Brew apps are staged to `/usr/local/Cellar` (`brew --cellar`) and symbolic linked to either `/usr/local/bin` or `/usr/local/opt/`
> *<u>More information</u>*<br/>
> See `HOMEBREW_*` environment variables set in the following scripts:
> - https://github.com/Homebrew/brew/blob/master/bin/brew
> - https://github.com/Homebrew/brew/blob/master/Library/brew.sh
> - `brew --cache` = `~/Library/Caches/Homebrew`

- Cask apps are staged to `/usr/local/Caskroom` and copied to `\Applications`
> *<u>More information</u>*<br/>
> See https://github.com/caskroom/homebrew-cask/blob/master/doc/man_page/brew-cask.1.md for 'man' page
>
> See https://github.com/caskroom/homebrew-cask/blob/master/lib/hbc/locations.rb<br/>
> Specifically [caskroom](https://github.com/caskroom/homebrew-cask/blob/7b4a37122da07423d24dd2ec5a0994a8d15544b1/lib/hbc/locations.rb#L15),
> [default_caskroom](https://github.com/caskroom/homebrew-cask/blob/7b4a37122da07423d24dd2ec5a0994a8d15544b1/lib/hbc/locations.rb#L11) and
> [appdir](https://github.com/caskroom/homebrew-cask/blob/7b4a37122da07423d24dd2ec5a0994a8d15544b1/lib/hbc/locations.rb#L39) definitions<br/>
> **NOTE: This can change (and has changed). For example, the PRs:**
> - https://github.com/caskroom/homebrew-cask/pull/21857 - Change default Caskroom path
> - https://github.com/caskroom/homebrew-cask/pull/13966 - Change artifact behavior to moving instead of symlinking

### dotfiles script breakdown

<pre>
-> os\setup.sh
   [source] os\utils.sh
   -> os\create_directories.sh
   -> os\create_symbolic_links.sh
   -> os\install\setup.sh
      --------
      FOR macOS
      --------
      -> os\install\macos\main.sh
         [source] os\utils.sh
         [source] os\macos\installs\utils.sh]
         -> os\install\macos\xcode.sh
         -> os\install\macos\homebrew.sh
         -> {brew update}
         -> {brew upgrade}
         -> os\install\macos\bash.sh
            -> {brew install bash}
            -> {change_default_bash_version}
            -> {brew install bash}
         -> os\install\macos\apps.sh
            -> {Brew install applications}
         -> {brew_cleanup}

      -> os\install\bash-it.sh
      -> os\install\jenv.sh
      -> os\install\sdkman.sh
      -> os\install\node_versions.sh
      -> os\install\npm_packages.sh
      -> os\install\vim_plugins.sh
      -> os\install\tmux_plugins.sh

   -> os\preferences\setup.sh
      --------
      FOR macOS
      --------
      -> os\preferences\macos\main.sh
          [source] os\utils.sh
          -> os\preferences\macos\app_store.sh
          -> os\preferences\macos\chrome.sh
          -> os\preferences\macos\computer_name.sh
          -> os\preferences\macos\dashboard.sh
          -> os\preferences\macos\dock.sh
          -> os\preferences\macos\finder.sh
          -> os\preferences\macos\firefox.sh
          -> os\preferences\macos\keyboard.sh
          -> os\preferences\macos\language_and_region.sh
          -> os\preferences\macos\maps.sh
          -> os\preferences\macos\photos.sh
          -> os\preferences\macos\safari.sh
          -> os\preferences\macos\terminal.sh
             -> os\preferences\macos\set_terminal_theme.applescript
                -> os\preferences\macos\Solarized Dark.terminal
          -> os\preferences\macos\textedit.sh
          -> os\preferences\macos\trackpad.sh
          -> os\preferences\macos\transmission.sh
          -> os\preferences\macos\ui_and_ux.sh
          -> os\preferences\macos\xtrafinder.sh

   -> os\initialize_git_repository.sh
   -> os\update_content.sh
      -> {Generate SSH key}
   -> os\restart.sh
</pre>

## License

The code is available under the [MIT license](LICENSE.txt).
