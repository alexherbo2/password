# Password

[![IRC](https://img.shields.io/badge/IRC-%23password-blue)](https://webchat.freenode.net/#password)

> “One password to rule them all.”

Command-line program for managing passwords.

## Dependencies

- [Crystal]

## Installation

``` sh
make build # Build bin/password-create, bin/password-get, bin/password-menu and bin/password-edit.
make install # Install bin into ~/.local/bin.
```

## Usage

Add your master password:

``` sh
password-edit
```

`~/.config/passwords.yml`

``` yaml
master: your-master-password
```

Create a password:

``` sh
password-create user@github.com
```

Get a password:

``` sh
password-get user@github.com
```

Copy a password with [fzf] and [wl-clipboard]:

``` sh
password-get $(password-menu | fzf) | wl-copy
```

Same with [Alacritty]:

``` sh
alacritty --command sh -c 'password-get $(password-menu | fzf) | setsid wl-copy > /dev/null 2>&1'
```

## Configuration

``` sh
password_menu() {
  password-get $(password-menu | fzf) | wl-copy
}

alias pm=password_menu
alias pc=password-create
alias pg=password-get
alias pe=password-edit
```

[Crystal]: https://crystal-lang.org
[fzf]: https://github.com/junegunn/fzf
[Alacritty]: https://github.com/alacritty/alacritty
[wl-clipboard]: https://github.com/bugaevc/wl-clipboard
