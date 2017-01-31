#!/bin/sh
git add $(git status | grep "modified:" | awk '{print $2}'| tr '\n' ' ')
git commit

