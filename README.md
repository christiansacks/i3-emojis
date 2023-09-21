# i3-emojis
emojis for your i3

# How do I use this?

First of all you need to run `./populate_emojis.sh` to generate the `emojis.txt` file.
Then change the `emojisfile` variable in `dmenuunicode` to the absolute location to the newly created emojis.txt file.

Finally in your i3 config, add a key binding like this;

`bindsym $mod+grave exec --no-startup-id /path/to/i3-emojis/dmenuunicode`
