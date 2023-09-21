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
curl -s "https://unicode.org/Public/emoji/$EMOJI_VERSION/emoji-test.txt" | while read -r line; do
    if [[ $line != "#"* ]]; then
        if [[ $line == *"#"* ]]; then
            unicode=$(echo "$line" | cut -d "#" -f 1 | awk '{$1=$1;print}'|sed 's/ ; fully-qualified//g'|tr '\n' ' '|sed 's/\b\([a-zA-Z0-9]\)/U+\1/g');
            emoji=$(echo "$line" | cut -d "#" -f 2 | awk '{$1=$1;print}');
            description=$(echo "$line" | cut -d "#" -f 3 | awk '{$1=$1;print}');
            add_emoji "$emoji" "$description" "$unicode"
        fi
    fi
done

echo -e "\nEmojis file created successfully!"

