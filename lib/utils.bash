#!/usr/bin/env bash

set -euo pipefail

TOOL_NAME="swift"
TOOL_TEST="swift --help"
SWIFTLY_PATH="$(ASDF_PLUGIN_PATH)/swiftly"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

ensure_swiftly_installed() {
	local current_swiftly_version

	if [ -x "$SWIFTLY_PATH" ]; then
		download_swiftly
	else
		current_swiftly_version="$($(SWIFTLY_PATH) --version)"

		if [ current_swiftly_version != "$swiftly_version" ]; then
			# If swiftly is installed but not the correct version, we need to update it.
			# TODO: Update swiftly to the correct version.
		fi
	fi
}

list_all_versions() {
	ensure_swiftly_installed

	$SWIFTLY_PATH list-available |
		grep 'Swift' |
		awk '{lines[NR] = $2} END {for (i = NR; i > 0; i--) printf "%s ", lines[i]}'
}

download_release() {
	local version filename
	version="$1"
	filename="$2"

	$SWIFTLY_PATH install $version
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	ensure_swiftly_installed

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

		# TODO: Assert swift executable exists.
		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
