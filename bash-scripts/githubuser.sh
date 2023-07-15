#!/bin/bash
# githubuser--Given a GitHub username, pulls information about the user

if [ $# -ne 1 ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

# The -s silences curl's normally verbose output.
curl -s "https://api.github.com/users/$1" | \
awk -F'"' '
  /\"name\":/ {
    print $4 " is the name of the GitHub user."
  }
  /\"followers\":/ {
    split($3, a, " ")
    sub(/,/, "", a[2])
    print "They have " a[2] " followers."
  }
  /\"following\":/ {
    split($3, a, " ")
    sub(/,/, "", a[2])
    print "They are following " a[2] " other users."
  }
  /\"created_at\":/ {
    print "Their account was created on " $4 "."
  }
  /\"bio\":/ {
    print $4 " is the bio of the GitHub user."
  }
  /\"public_repos\":/ {
    print "They have " $3 " public repositories."
  }
  /\"public_gists\":/ {
    print "They have " $3 " public gists."
  }
'

exit 0
