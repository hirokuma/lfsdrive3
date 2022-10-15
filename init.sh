#!/bin/bash

cp git-hooks/post-checkout .git/hooks/
./git-hooks/prepare.sh
