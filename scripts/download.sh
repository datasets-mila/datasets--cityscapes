#!/bin/bash

# this script is meant to be used with 'datalad run'

source scripts/utils.sh echo -n

function download_cityscapes {
	local _ANNEX_LIST=`git-annex list --fast`
	declare -a _download_list
	for _archive in "$@"
	do
		if [[ -z `echo "$_ANNEX_LIST" | grep "$_archive"` ]]
		then
			_download_list+=("$_archive")
		fi
	done
	# $1 == ${_download_list[0]}
	if [[ ! -z "${_download_list[@]:1}" ]]
	then
		mkdir -p $1
		csDownload --destination_path $1 ${_download_list[@]:1}
	fi
}

python3 -m pip install -r scripts/requirements_download.txt
exit_on_error_code "Failed to install requirements: pip install"

_BASE=("./" gtFine_trainvaltest.zip \
	gtCoarse.zip \
	leftImg8bit_trainvaltest.zip  \
	leftImg8bit_trainextra.zip  \
	camera_trainvaltest.zip \
	camera_trainextra.zip \
	vehicle_trainvaltest.zip \
	vehicle_trainextra.zip \
	leftImg8bit_demoVideo.zip \
	leftImg8bit_blurred.zip \
	gtBbox_cityPersons_trainval.zip)
_EXTRA=("./extra" leftImg8bit_sequence_trainvaltest.zip)

download_cityscapes "${_BASE[@]}"
download_cityscapes "${_EXTRA[@]}"

md5sum -c md5sums
