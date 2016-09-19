# My Settings

This is a repository to back up all my config files so they are easily ported
across devices and accesible in case I lose a machine. This repo also hosts a
provision script to get me up and running quickly on a new machine. **_Note this
script is primarily for my own use, running my provision script will delete some
config files if they exist_** To download and run the provision script in one
go:

```bash
curl -LSs https://raw.githubusercontent.com/zgulde/dotfiles/master/provision.sh | bash
```

Or

```bash
wget -qO- https://raw.githubusercontent.com/zgulde/dotfiles/master/provision.sh | bash
```

For those browsing, my `.bash_profile` just sets a few common settings, my
aliases and functions are in separate files. `plugins.txt` contains all the
plugins I use for my editors.

There's also [a cool tutorial on rebinding your capslock
key](https://github.com/zgulde/dotfiles/blob/master/capslock.md) in the
`capslock.md` file. (Shameless self-promotion) also available [on my
blog](https://blog.zgul.de/post/make-capslock-useful/).
