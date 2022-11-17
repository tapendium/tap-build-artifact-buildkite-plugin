#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

post_command_hook="$PWD/hooks/post-command"
prefix="BUILDKITE_PLUGIN_TAP_BUILD_ARTIFACT_"

function git() {
	echo "Runs git"
}

function buildkite-agent() {
	echo "Runs buildkite-agent"
}

@test "Runs and failed when no arguments define" {
  export -f git
	run "$post_command_hook"
	assert_failure
	assert_output --partial "[INFO] type not equal upload"
}

# artifacts-path-env can be optional on upload
@test "Runs and failed when artifacts-path-env not defined" {
  export ${prefix}TYPE="upload"
  export -f buildkite-agent
  export -f git
	run "$post_command_hook"
	assert_success
}

@test "Runs and failed when type not defined" {
  export SOME_ENV="path/path/**"
  export ${prefix}ARTIFACTS_PATH_ENV="SOME_ENV"
  export -f git
	run "$post_command_hook"
	assert_failure
	assert_output --partial "[INFO] type not equal upload"
}

@test "Runs with no errors" {
  export ${prefix}TYPE="upload"
  export SOME_ENV="path/path/**"
  export ${prefix}ARTIFACTS_PATH_ENV="SOME_ENV"
  export -f buildkite-agent
  export -f git
	run "$post_command_hook"
	assert_success
}


