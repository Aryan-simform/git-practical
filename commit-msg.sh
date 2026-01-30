#!/bin/sh

# This is an example of commit-msg hook it checks if your commit 
# 1. has subject length  gereater than 50 
# 2. has Body line <= 72
# 3. follows valid conventional

# Read commit message file

commit_msg_file="$1"
commit_msg=$(head -n 1 "$commit_msg_file")

# Rule 1: Subject line length ≤ 50
if [ ${#commit_msg} -gt 50 ]; then
  echo "Subject line too long (${#commit_msg} chars). Max allowed: 50."
  exit 1
fi

# Rule 2: Body lines ≤ 72
if grep -q '.\{73,\}' "$commit_msg_file"; then
  echo "One or more body lines exceed 72 characters."
  exit 1
fi

echo "$commit_msg" | grep -Eq '^(feat|fix|docs|style|refactor|test|chore):'
if [ $? -ne 0 ]; then
  echo "Commit message must start with a valid type (feat, fix, docs, style, refactor, test, chore)."
  exit 1
fi

echo "Commit message format is good."
