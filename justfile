default: check

_vendor-init:
	#!/usr/bin/env bash
	set -euo pipefail

	just --justfile components/libs/zed_sdk_sys/justfile _vendor-init

fmt:
	cargo fmt --all

check: _vendor-init
	cargo check -p cu-zed --all-targets --features zed-rerun-demo

check-lib:
	cargo check -p cu-zed --lib

build: _vendor-init
	cargo build -p cu-zed --lib

demo: _vendor-init
	cargo run -r -p cu-zed --example zed_rerun_demo --features zed-rerun-demo

run: demo
