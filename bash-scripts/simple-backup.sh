#!/bin/bash

# BACKUP THE CONTENTS OF DESKTOP FOLDER FOR CURRENT USER
tar czf ~/BACKUP.tgz ~/Skrivebord
# Save into log
echo "$(date)" >> ~/BACKUP.log
