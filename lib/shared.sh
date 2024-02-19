#!/bin/bash

PREFIX="BUILDKITE_PLUGIN_TAP_BUILD_ARTIFACT_"

function buildkite_metadata_get() {
	buildkite-agent meta-data get "$@"
}

function buildkite_metadata_set() {
	buildkite-agent meta-data set "$@"
}

function buildkite_artifact_upload() {
	buildkite-agent artifact upload "$@"
}

function buildkite_artifact_download() {
	if ! buildkite-agent artifact download "$@"; then
		local var="${PREFIX}IGNORE_MISSING"
		if [[ "${!var:-"false"}" != "false" ]]; then
			echo "Ignoring error in download of" "${@: -2}"
		else
			echo "Error in download of" "${@: -2}"
			return 1
		fi
	fi
}

# Shorthand for reading env config
function plugin_read_config() {
	local var="${PREFIX}${1}"
	local default="${2:-}"
	echo "${!var:-$default}"
}
