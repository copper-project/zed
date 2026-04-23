# zed

Small Copper workspace for Stereolabs ZED stereo camera integration.

This repository contains:

- `components/sources/cu_zed`: the Copper source task and depth-to-pointcloud task
- `components/libs/zed_sdk`: safe Rust wrapper for the Stereolabs ZED C API
- `components/libs/zed_sdk_sys`: raw FFI crate and optional vendored `zed-c-api` wrapper

The Copper dependencies intentionally track the `master` branch of
`copper-project/copper-rs`.

## Checks

```bash
just check
```

The check target initializes the `zed-c-api` submodule when needed and runs the
same `cargo check` command used by CI. A machine without the proprietary ZED SDK
can still type-check the Rust crates; final binaries that link the native ZED
libraries need the SDK installed under `/usr/local/zed` or `/opt/zed-sdk`.

The full crate docs live in `components/sources/cu_zed/README.md`.
