#!/bin/bash

# Function to add an emoji and its description to the file
function add_emoji {
    echo -e "$1 $2" >> emojis.txt
    echo -n .
}

# Create or clear the emojis.txt file
> emojis.txt

EMOJI_VERSION="latest"
echo "Retrieving version: $EMOJI_VERSION"

# Process the emojis and descriptions and call the add_emoji function
#curl -s "https://unicode.org/Public/emoji/$EMOJI_VERSION/emoji-test.txt"|grep fully-qualified|sed 's/                                                 ; fully-qualified     # //g'|grep -v fully-qualified|while read -r line; do
#curl -s "https://unicode.org/Public/emoji/$EMOJI_VERSION/emoji-test.txt"|grep fully-qualified|grep -oP '#.*'|grep -v fully-qualified|sed 's/^# //g'|while read -r line; do
curl -s "https://unicode.org/Public/emoji/$EMOJI_VERSION/emoji-test.txt"|grep [0-9]|grep -oP '#.*'|sed 's/^# //g'|grep -v ^[0-9a-zA-Z]|while read -r line; do
        emoji=$(echo "$line"|awk '{print $1}')
        emoji_ver=$(echo "$line"|awk '{print $2}')
	description=$(echo "$line"|cut -d' ' -f3-)
	add_emoji "$emoji" "$description"
done

echo -e "\nEmojis file created successfully!"

