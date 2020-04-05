#!/bin/bash

# this script is meant to be used with 'datalad run'

pip install -r scripts/requirements_download.txt --upgrade
if [ $? -ne 0 ]; then
   echo "Failed to install requirements: pip install: $?"
   return $?
fi

csDownload gtFine_trainvaltest.zip \
	gtCoarse.zip \
	leftImg8bit_trainvaltest.zip  \
	leftImg8bit_trainextra.zip  \
	camera_trainvaltest.zip \
	camera_trainextra.zip \
	vehicle_trainvaltest.zip \
	vehicle_trainextra.zip \
	leftImg8bit_demoVideo.zip \
	leftImg8bit_blurred.zip \
	gtBbox_cityPersons_trainval.zip

md5sum *.zip > md5sums
