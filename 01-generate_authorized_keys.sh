#!/bin/bash

# Delete existing file "authorized_keys" in repository
rm -f authorized_keys

# Generate new file "authorized_keys" based on the public keys in directory pub/
for filename in pub/*.pub; do
  cat $filename >> authorized_keys
done

# Cat new file "authorized_keys"
echo "the new file \"authorized_keys\" looks like this:";
cat authorized_keys
