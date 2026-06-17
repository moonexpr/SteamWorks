# SteamWorks

A SourceMod extension that exposes Valve's Steamworks API to SourcePawn — Steam
user, app, and game-server queries, HTTP requests, and their callbacks.

## Plugin API

Natives, enums, and forwards are declared in
[`Pawn/includes/SteamWorks.inc`](Pawn/includes/SteamWorks.inc). Drop it into
`addons/sourcemod/scripting/include/` to compile plugins against the extension.

## Building

Requires [AMBuild 2.2+](https://github.com/alliedmodders/ambuild) with
SourceMod, Metamod:Source, an HL2SDK, and the Steamworks SDK available. Both the
32- and 64-bit binaries build from one configure:

```sh
mkdir build && cd build
python ../configure.py \
  -s tf2 --targets x86,x86_64 --enable-optimize \
  --hl2sdk-root /path/to/hl2sdks \
  --sm-path /path/to/sourcemod \
  --mms-path /path/to/metamod-source \
  --steamworks-path /path/to/SteamworksSDK
ambuild
```

`--sdks`/`-s` selects which engine SDKs to build against (`present` by default).
Build output is packaged under `build/package`.
