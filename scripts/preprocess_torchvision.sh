#!/bin/bash

pip install -r scripts/requirements_preprocess_torchvision.txt
ERR=$?
if [ $ERR -ne 0 ]; then
   echo "Failed to install requirements: pip install: $ERR"
   exit $ERR
fi

python scripts/preprocess_torchvision.py

rm files_count.stats
for dir in gtFine/* gtCoarse/*
do
	echo $(find $dir -type f | wc -l; echo $dir) >> files_count.stats
done

du -s gtFine/* gtCoarse/* > disk_usage.stats
