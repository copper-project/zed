# zed

[![CI](https://github.com/copper-project/zed/actions/workflows/ci.yml/badge.svg)](https://github.com/copper-project/zed/actions/workflows/ci.yml)
![GitHub last commit](https://img.shields.io/github/last-commit/copper-project/zed)
![](https://img.shields.io/badge/Rust-1.95+-orange.svg)
[![dependency status](https://deps.rs/repo/github/copper-project/zed/status.svg)](https://deps.rs/repo/github/copper-project/zed)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](LICENSE)
[![Copper](https://img.shields.io/badge/Copper-master-b87333)](https://github.com/copper-project/copper-rs)

Small Copper workspace for Stereolabs ZED stereo camera integration.

This repository is a hardware-specific satellite of
[`copper-project/copper-rs`](https://github.com/copper-project/copper-rs). It is
kept outside the main runtime workspace so the ZED SDK bindings, native wrapper,
and Stereolabs-specific build assumptions do not add complexity to Copper's core
CI and embedded/no_std surfaces.

This repository contains:

- `components/sources/cu_zed`: the Copper source task and depth-to-pointcloud task
- `components/libs/zed_sdk`: safe Rust wrapper for the Stereolabs ZED C API
- `components/libs/zed_sdk_sys`: raw FFI crate and optional vendored `zed-c-api` wrapper

The Copper dependencies use Cargo's multi-location support against
[`copper-project/copper-rs`](https://github.com/copper-project/copper-rs):
checked-out builds resolve against the `master` branch, while published crate
metadata advertises the `1.0.0-rc1` crates.io contract. CI can be triggered
from the main Copper repository by dispatching this `CI` workflow via GitHub's
`workflow_dispatch` API.

## Links

- Main Copper runtime and SDK: [`copper-project/copper-rs`](https://github.com/copper-project/copper-rs)
- Copper documentation: <https://copper-project.github.io/copper-rs>
- Copper book: <https://copper-project.github.io/copper-rs-book/>
- Copper component catalog: <https://cdn.copper-robotics.com/catalog/index.html>
- Stereolabs ZED SDK: <https://www.stereolabs.com/developers>

## Checks

```bash
just check
```

The check target initializes the `zed-c-api` submodule when needed and runs the
same `cargo check` command used by CI. A machine without the proprietary ZED SDK
can still type-check the Rust crates; final binaries that link the native ZED
libraries need the SDK installed under `/usr/local/zed` or `/opt/zed-sdk`.

The full crate docs live in `components/sources/cu_zed/README.md`.

## License

This repository is licensed under the Apache License, Version 2.0. The
proprietary Stereolabs ZED SDK is not vendored here and must be installed
separately under its own license.
