# Rebinding the capslock key

Inspired by [this reddit thread](https://www.reddit.com/r/webdev/comments/3oh313/what_extra_tools_do_you_use_that_make_web/cvxonub).

## Why rebind my capslock key?

- it's (virtually) useless and takes up a ton of real estate on your keyboard.
- you can increase your productivity by creating more keyboard shortcuts
- you hit it accidentally far too often
- all the cool people are doing it

To give you an idea of how you would use this setup, here's the shortcuts I'm
currently using.

### My Shortcuts

The general idea is to not stray from the home row as much as possible. Less movement = more effiency!

- `caps + t` : open a terminal

- `caps + r` : `=>`

- `caps + f` : `->`

- `caps + F` : `<-`

- `caps + space` : escape key

- `caps + wasd` : arrow keys

- `caps + hjkl` : also arrow keys

- `caps + qe` : home and end

- `caps + delete` : delete, not backspace

- `caps + enter` : to actually turn on capslock

## Boring Disclaimer

All directions given for navigating through Seil and Karabiner are current as of the time of writing. Use these instructions at your own risk, I am not responsible for you remapping ' to ` .
This tutorial works for OSX and my specific linux setup, but the same
principal can be applied to other OSs.

## Process

### OSX

1. Install [Karabiner][1]
2. Intall [Seil][2]
3. Open Seil and remap capslock
    - expand the change the capslock key dropdown
    - follow the instructions under 'Important:'
    - change the keycode to `110`. This is the keycode for the PC application button, so it is something one would never use in osx
4. add a custom private.xml file for Karabiner
    - in Karabiner under the 'Misc & Uninstall' tab there is a button to open private.xml, this will open a finder in the location 
    - Feel free to copy my private.xml file here
    - quit and reload Karabiner for the changes to take place
    - If you copied my file you should see a setting on the top that says 'My capslock key settings'. Make sure this is checked
    - If you modify private.xml, remember you must click the reload xml button in Karabiner for the changes to take place
    - Check out the [Karabiner documentation][3]
    - [This is a very helpful reference for keycodes][4]

And you can now use your capslock key for useful things!

Briefly, what I am doing is defining a new modifier key (like command, option, or shift) and binding capslock to that key so that we can create our own shortcuts with capslock + some key.

### Linux

I did this process on an acer chromebook, which has a search key instead of a
capslock key, so instructions might vary according to your device.

1. Figure out the keycode of the search (or capslock) key

    We can use `xev` to do this.

    `xev` will show us a bunch of information about all the events happening
    while it is running. What's important to us is that is shows the keycodes of
    the keys that are pressed. Press your capslock key and make note of the
    keycode.

1. Rebind search key (or capslock) to super so that we can use it as a modifier
   key

    You could also use hyper or meta if you already make use of a super key.

    Replace `133` with the keycode of your key if it's different.

    ```bash
    xmodmap -e 'keycode 133 = Super_R'
    ```

2. Install autokey

    Autokey bills itself as a 'desktop automation utility'. We can use it to
    bind custom key combinations to our newly bound super key.

    ```bash
    sudo apt-get install autokey-gtk
    ```

3. Write autokey snippets

    While autokey gives you the power to write full python scripts, all we
    really need is to send a key or phrase when we hit a key combination. We can
    write what autokey calls 'phrases' to accomplish this, and bind our specific
    key combination to trigger them.

    For example, write a phrase like the following:

    ```
    <up>
    ```

    and bind it to `super + k`, or whatever key combination you want to trigger
    the up key.

    A full list of special keys that autokey supports can be found
    [here][5].

4. (Maybe) Rebind window manager keys

    This process might cause some conflicts with whatever default
    keybindings are setup with your window manager, so you might need to change
    those.

[1]: https://pqrs.org/osx/karabiner/
[2]: https://pqrs.org/osx/karabiner/seil.html.en
[3]: https://pqrs.org/osx/karabiner/xml.html.en
[4]: https://github.com/tekezo/Karabiner/blob/master/src/bridge/generator/keycode/data/KeyCode.data
[5]: http://code.google.com/archive/p/autokey/wikis/SpecialKeys.wiki
