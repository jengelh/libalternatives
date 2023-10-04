#!/bin/bash

if test "x$1" = "x-c"; then
	# skip if not in git
	git rev-list -n 0 HEAD 2>/dev/null || exec true

	echo Checking that last tag matches last release
	ver=$(grep PACKAGE_VERSION config.h | awk '{print $3}' | sed 's,",,g')
	git describe --abbrev=0 --tags | grep -q v$ver || exit 1
	echo "All good! Version $ver tag found."
	exit 0
fi

if [ "$1" = "-s" ]; then
	git status | grep -q 'nothing to commit, working tree clean' || exec echo Pending commits

	ver=$(grep PACKAGE_VERSION config.h | awk '{print $3}' | sed 's,",,g')
	echo "Tagging new release v$2"
	echo $2 | grep '^[0-9]\+\.[0-9]\+$' || exec echo 'Invalid version format'

	sed -e "s,VERSION ${ver}, VERSION $2," -i CMakeLists.txt
	git add CMakeLists.txt &&
	git commit -m "Releasing version $2" &&
	git tag v$2
	exit 0
fi

echo "Unknown options" "$1"
exit 1
