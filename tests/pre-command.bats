#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

pre_command_hook="$PWD/hooks/pre-command"
prefix="BUILDKITE_PLUGIN_TAP_BUILD_ARTIFACT_"

function git() {
	echo "Runs git"
}

function buildkite-agent() {
	echo "Runs buildkite-agent"
}

@test "Runs and failed when no arguments define" {
  export -f buildkite-agent
  export -f git
	run "$pre_command_hook"
	assert_failure
	assert_output --partial "[ERROR] type not defined"
	assert_output --partial "[ERROR] artifacts-path-env not defined"
}

@test "Runs and failed when artifacts-path-env not defined" {
  export ${prefix}TYPE="download"
  export -f buildkite-agent
  export -f git
	run "$pre_command_hook"
	assert_failure
	assert_output --partial "[ERROR] artifacts-path-env not defined"
}

@test "Runs and failed when type not defined" {
  export SOME_ENV="path/path/**"
  export ${prefix}ARTIFACTS_PATH_ENV="SOME_ENV"
  export -f buildkite-agent
  export -f git
	run "$pre_command_hook"
	assert_failure
	assert_output --partial "[ERROR] type not defined"
}

@test "Runs with no errors" {
  export ${prefix}TYPE="download"
  export SOME_ENV="path/path/**"
  export ${prefix}ARTIFACTS_PATH_ENV="SOME_ENV"
  export -f buildkite-agent
  export -f git
	run "$pre_command_hook"
	assert_success
}


