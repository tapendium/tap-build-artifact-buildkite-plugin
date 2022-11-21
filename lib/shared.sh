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
  buildkite-agent artifact download "$@"
}

# Shorthand for reading env config
function plugin_read_config() {
  local var="${PREFIX}${1}"
  local default="${2:-}"
  echo "${!var:-$default}"
}

