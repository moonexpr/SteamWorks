# x86_64 smoke test

`swtest.sp` exercises a built/installed SteamWorks by calling natives that
require the Steam game-server interfaces to have resolved — a quick way to
confirm a 64-bit (or 32-bit) build actually works, not just that it loads.

## Run

1. Build + install the extension (see the build instructions in the PR).
2. Compile with SourceMod's `spcomp` (with `SteamWorks.inc` on the include path)
   and put `swtest.smx` in `addons/sourcemod/plugins/`.
3. On a live, Steam-connected server: `sm plugins load swtest`, then run the
   `sw_e2e` server command.

Expected output on a connected server (the IP is your server's public IP):

```
[SW-E2E] connected=1 vac=1 gotip=1 ip=203.0.113.10
```

`connected=0` / `ip=0.0.0.0` means the Steam interfaces did not resolve.
