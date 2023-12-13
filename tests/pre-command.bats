#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

pre_command_hook="$PWD/hooks/pre-command"
prefix="BUILDKITE_PLUGIN_TAP_BUILD_ARTIFACT_"

function jq() {
	echo "Runs jq"
}

function curl() {
	echo "Runs curl"
}

function git() {
	echo "Runs git"
}

function buildkite-agent() {
	echo "Runs buildkite-agent"
}

@test "Runs and success when no arguments define" {
  export -f buildkite-agent
  export -f git
  run "$pre_command_hook"
  assert_success
  assert_output --partial "[INFO] type not equal download"
}

@test "Runs and failed when artifacts-path-env not defined" {
  export ${prefix}TYPE="download"
  export ${prefix}REPO="organisations"
  export -f buildkite-agent
  export -f git
  run "$pre_command_hook"
  assert_failure
  assert_output --partial "[ERROR] artifacts-path or artifacts-path-env must be defined"
}

@test "Runs and failed when repo not defined" {
  export ${prefix}TYPE="download"
  export SOME_ENV="path/path/**"
  export ${prefix}ARTIFACTS_PATH_ENV="SOME_ENV"
  export -f buildkite-agent
  export -f git
  run "$pre_command_hook"
  assert_failure
  assert_output --partial "[ERROR] repo not defined"
}

@test "Runs and failed when type not defined" {
  export SOME_ENV="path/path/**"
  export ${prefix}ARTIFACTS_PATH_ENV="SOME_ENV"
  export -f buildkite-agent
  export -f git
  run "$pre_command_hook"
  assert_success
  assert_output --partial "[INFO] type not equal download"
}

@test "Runs with no errors" {
  export ${prefix}TYPE="download"
  export SOME_ENV="path/path/**"
  export ${prefix}ARTIFACTS_PATH_ENV="SOME_ENV"
  export ${prefix}REPO="organisations"
  export -f buildkite-agent
  export -f git
  export -f curl
  export -f jq
  run "$pre_command_hook"
  assert_success
}


