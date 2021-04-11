# Password

<img src="https://github.com/FortAwesome/Font-Awesome/raw/master/svgs/solid/lock.svg" height="16" align="right">

> “One password to rule them all.”

A command-line program for managing passwords.

###### Method

``` crystal
Crypto::Bcrypt::Password.create("taupiqueur@kanto.io:your-master-password")
```

Memorize only one password.
Use a different password on all website.

See [`Crypto::Bcrypt::Password`] for a complete reference.

[`Crypto::Bcrypt::Password`]: https://crystal-lang.org/api/Crypto/Bcrypt/Password.html

## Dependencies

- [Crystal]

[Crystal]: https://crystal-lang.org

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
password create taupiqueur@kanto.io
```

Get a password:

``` sh
password get taupiqueur@kanto.io
```

Copy a password with a dynamic menu program:

``` sh
password menu | dmenu | xargs password get -- | wl-copy
```

## Configuration

Bash example configuration:

`~/.bashrc`

``` sh
password_menu() {
  password menu | dmenu | xargs password get -- | wl-copy
}

alias pm='password_menu'
alias pc='password create'
alias pg='password get'
alias pe='password edit'
```

[Sway] example configuration:

`~/.config/sway/config`

```
bindsym $mod+p exec password menu | dmenu | xargs password get -- | wl-copy
```

[Sway]: https://swaywm.org
