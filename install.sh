#!/bin/sh
set -e
[ -n "$JR_DEBUG" ] && set -x

install_bash() {
  jr-chef-apply <<RECIPE
    package "bash"
RECIPE
}

install_shunit2() {
  local shunit2_path="$(jr-vendorpath shunit2)"
  local tar="/tmp/shunit2-$$.tgz"
  local extracted="${tar%%.tgz}"
  local url="http://shunit2.googlecode.com/files/shunit2-2.1.6.tgz"

  ( jr-download "$url" "$tar" && \
    mkdir -p "$extracted" && \
    (cd "$extracted" ; gunzip -c "$tar" | tar xf - --strip-components=1) && \
    mkdir -p "$shunit2_path" && \
    cp -f "$extracted/src/shunit2" "$shunit2_path" && \
    rm -rf "$tar" "$extracted"
  ) || return 1
}

install_bash
install_shunit2
