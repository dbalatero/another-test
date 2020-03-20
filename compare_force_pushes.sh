#!/usr/bin/env bash

# Got these from the event that reads like:
#  "dbalatero force-pushed the my-feature-branch branch from 7c66458 to c559af0"
old_head=0af94c3
new_head=464ae2a

echo "CASE 1: A force-pushed branch that has no branch changes, just the latest master"
echo "  e.g. they just did git rebase master && git push --force-with-lease"
echo
echo "With PR: https://github.com/dbalatero/test-repo/pull/1"
echo "It had been force pushed from $old_head to $new_head, with no distinguishable changes."
echo

old_diff=$(curl --silent -H 'Accept: application/vnd.github.v3.diff' \
  https://github.com/dbalatero/test-repo/compare/master...$old_head.diff)

echo "Patch from $old_head:"
echo "===="
echo "$old_diff"
echo
echo "MD5 sum: $(echo "$old_diff" | md5sum)"
echo

new_diff=$(curl --silent -H 'Accept: application/vnd.github.v3.diff' \
  https://github.com/dbalatero/test-repo/compare/master...$new_head.diff)

echo "Patch from $new_head:"
echo "===="
echo "$new_diff"
echo
echo "MD5 sum: $(echo "$new_diff" | md5sum)"
echo

#############################################

# old_head=eabdef5
# new_head=e20185f

# echo "================================"
# echo
# echo "CASE 2: A branch that pushed changes, then did more work and rebased master, then force pushed"
# echo
# echo "With PR: https://github.com/dbalatero/test-repo/pull/3"
# echo

# old_diff=$(curl --silent -H 'Accept: application/vnd.github.v3.diff' \
#   https://github.com/dbalatero/test-repo/compare/master...$old_head.diff)

# echo "Patch from $old_head:"
# echo "===="
# echo "$old_diff"
# echo
# echo "MD5 sum: $(echo "$old_diff" | md5sum)"
# echo

# new_diff=$(curl --silent -H 'Accept: application/vnd.github.v3.diff' \
#   https://github.com/dbalatero/test-repo/compare/master...$new_head.diff)

# echo "Patch from $new_head:"
# echo "===="
# echo "$new_diff"
# echo
# echo "MD5 sum: $(echo "$new_diff" | md5sum)"
# echo
