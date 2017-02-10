#!/bin/sh

if [ "$3" != "" ]; then
	echo "You must use \" \" around the title!"
	exit 1
fi
if [ "$1" == "" ]; then
	echo "Usage: new-post.sh \"title\" [\"category1 category2 ...\"]"	
	exit 1
fi
categories="categories: "
if [ "$2" != "" ]; then
	categories="${categories}$2"
fi
title=$(echo "$1" | tr ' ' '_')

post_date=$( date "+%Y-%m-%d" )
post_time=$( date "+%H:%M:%S" )
post_file="_posts/${post_date}-$(echo "${title}" | tr '{}[]()' '______').md"

echo "---" > ${post_file}
echo "layout: post" >> ${post_file}
echo "title:  \"${title}\"" >> ${post_file}
echo "date:   ${post_date} ${post_time} +0100" >> ${post_file}
echo "${categories}" >> ${post_file}
echo "---" >> ${post_file}
echo "Done!"

