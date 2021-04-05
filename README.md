# Password

[![IRC](https://img.shields.io/badge/IRC-%23password-blue)](https://webchat.freenode.net/#password)

<img src="https://github.com/FortAwesome/Font-Awesome/raw/master/svgs/solid/lock.svg" height="16" align="right">

> “One password to rule them all.”

Command-line program for managing passwords.

## Method

``` crystal
Crypto::Bcrypt::Password.create("<key>:<password>")
```

Memorize only one password.
Use a different password on all website.

**Example**

``` crystal
Crypto::Bcrypt::Password.create("alexherbo2@github.com:very-strong-password")
```

See [`Crypto::Bcrypt::Password`] for a complete reference.

[`Crypto::Bcrypt::Password`]: https://crystal-lang.org/api/Crypto/Bcrypt/Password.html

## Implementation

A simple POSIX shell function:

``` sh
create_password() {
  key=$1
  printf '%s:%s' "$key" "$PASSWORD" | shasum -a 512 | base64
}

PASSWORD=very-strong-password create_password alexherbo2@github.com
```

## Dependencies

- [Crystal]

## Installation

``` sh
make install
```

## Usage

Add your master password:

``` sh
password edit
```

`~/.config/passwords.yml`

``` yaml
master: your-master-password
```

Create a password:

``` sh
password create user@github.com
```

Get a password:

``` sh
password get user@github.com
```

Copy a password with [fzf] and [wl-clipboard]:

``` sh
password menu | fzf | xargs password get -- | wl-copy
```

Same with [Alacritty]:

``` sh
alacritty --command sh -c 'password menu | fzf | xargs password get -- | setsid wl-copy'
```

## Configuration

``` sh
password_menu() {
  password menu | fzf | xargs password get -- | wl-copy
}

alias pm='password_menu'
alias pc='password create'
alias pg='password get'
alias pe='password edit'
```

[Crystal]: https://crystal-lang.org
[fzf]: https://github.com/junegunn/fzf
[Alacritty]: https://github.com/alacritty/alacritty
[wl-clipboard]: https://github.com/bugaevc/wl-clipboard
