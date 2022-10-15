#!/bin/bash

cp git-hooks/post-checkout .git/hooks/post-checkout
cp git-hooks/post-checkout .git/hooks/post-merge
./git-hooks/prepare.sh
