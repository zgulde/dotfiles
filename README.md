# My Settings

This is a repository to back up all my config files just in case the worst happens.

My Current Setup

- Vagrant with VirtualBox
- Sublime Text 3
- Karabiner and Seil for key rebinding
- iTerm

While I have you here, I figured I'd write up a tutorial on how to rebind your capslock key.

### Why rebind my capslock key?

- it's (virtually) useless and takes up a ton of real estate on your keyboard.
- you can increase your productivity by creating more keyboard shortcuts
- you hit it accidentally far too often
- all the cool people are doing it


### Boring Disclaimer

All directions given for navigating through Seil and Karabiner are current as of the time of writing. Use these instructions at your own risk, I am not responsible for you remapping ' to ` .
This tutorial works for OSX, but the same principal can be applied to other OSs.


### Process

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

And you can now use your capslock key for useful things!

Briefly, what I am doing is defining a new modifier key (like command, option, or shift) and binding capslock to that key so that we can create our own shortcuts with capslock + some key.

### My Shortcuts

The general idea is to not stray from the home row as much as possible. Less movement = more effiency!

- `caps + t` : open the terminal

- `caps + enter` : `=>`

- `caps + wasd` : arrow keys

- `caps + qe` : home and end

- `caps + cmd + ws` : cntrl + cmd + up, down for moving code lines in sublime

- `caps + k` : delete current line in sublime

- `caps + delete` : fn + delete because the fn key is so far away

In my private.xml file there is a block of code commented out for vim style cursor navigation with caps + hjkl that you can use

#### Thanks for reading!

feel free to email me with any questions, I'd love to get your feedback!

[zachgulde@gmail.com][4]




[1]: https://pqrs.org/osx/karabiner/
[2]: https://pqrs.org/osx/karabiner/seil.html.en
[3]: https://pqrs.org/osx/karabiner/xml.html.en
[4]: mailto:zachgulde@gmail.com