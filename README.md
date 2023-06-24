# DOOM 64: Complete Edition

This is the source code for a rom hack based on Erick194's complete reverse engineering of Doom 64: [DOOM64-RE](https://github.com/Erick194/DOOM64-RE/).

The focus of this project is to bring features from Nightdive's 2020 [Doom 64 remaster](https://doomwiki.org/wiki/Doom_64_(2020_version)) into the original game.

## Highlights

- Includes the new levels introduced in the 2020 release (The Lost Levels episode, Panic fun level).
- Option to turn off the three-point texture filter, or filter only skies.
- Option to run automatically when using the D-Pad, or using the Run button to toggle running.
- Option to toggle green blood from the japanese version.
- Option to toggle medikit, stimpak and berserk sprites with a white cross from the 2020 version.
- Display secret found messages, artifact found messages and regular messages at the same time, with different colors.
- Saved games now include user configuration, including controller bindings.
- Adds an entry to the main and game menus to load saved games. The password menu is now only used to enter passwords.
- Restored the unused second medikit pickup message.
- Default brightness is now 100%.
- Compatibility fixes to make maps behave like the 2020 release, aimed to make custom wads compatible[^1]:
  - Support for the Nightmare monster flag.
  - Projectile traps spawn with their radius as their offset.
  - Projectiles immediately explode if they are blocked when they spawn.
  - Passwords can be created for levels 0 and 1.
  - Things with editor numbers higher than 4096 are now allowed.
  - Switch textures st coordinates now use the full width and height instead of being croppped to 32x32.
- No demo desyncs.

In addition, the following extra features were added:

- Restored the third zombie sight and death sounds.
- Adds support for the Expansion Pak for resource intensive maps (thanks [JNMartin](https://github.com/Immorpher/Doom-64-Merciless-Edition/pull/5/files)).
- F3DEX2 rendering microcode (from [Doom 64 Merciless Edition](https://github.com/Immorpher/Doom-64-Merciless-Edition)).
- Adds the fifth difficulty from DOOM64-RE, renamed to Hardcore!
- Includes all extra options from the DOOM64-RE Features menu: Security Keys, Wall Blocking, Lock Monsters, Music Test, Colors and Full Bright.
- Adds extra cheats to the Features menu to give all artifacts and change difficulty.
- Passwords now support up to 128 levels instead of 64 (from [PSXDOOM-RE](https://github.com/Erick194/PSXDOOM-RE)).

[^1]: At the moment it is not know if some these inconsistencies come from the reverse engineered code or the 2020 release.

## Building

### Preparation

Before compiling, the data of the original Doom 64 is required. The Tools folder contains an extractor utility that can be run against the [Doom 64 USA 1.0 ROM](https://datomatic.no-intro.org/index.php?page=show_record&s=24&n=0179). Version 1.1 is not supported. The extractor will produce four files: `DOOM64.WAD`, `DOOM64.WMD`, `DOOM64.WSD` and `DOOM64.WDD` that have to be placed into the doom64/data folder.

**This rom hack requires resources that are only present in Nightdive's 2020 release.** For this reason, a BPS patch is included in the Data folder (`DOOM64.BPS`). The Tools folder includes Floating BPS, a tool that can be used to open it. With it, you must patch the `DOOM64.WAD` found in your 2020 release installation directory (MD5 `0AABA212339C72250F8A53A0A2B6189E`). Then, copy the newly created `DOOM64.WAD` into the Data folder, replacing the one in the previous step.

Alternatively, you can build the rom disabling the new options that require the new resources and use the extracted wad instead. See [Configuration](#configuration) for information on how to disable the `ENABLE_EXTRA_EPISODES` and `ENABLE_REMASTER_SPRITES` preprocessor definitions.

### Modern SDK

If you are running on a Linux distribution supported by the [Modern N64 SDK](https://crashoveride95.github.io/modernsdk/index.html) ([source](https://github.com/ModernN64SDK/n64sdkmod)) and have it installed, run `make-rom.sh` inside the `doom64` directory.

If you prefer to run the build inside a container, a Dockerfile is included that builds an image with only the files required to build this project (~460MB). You can then mount the `doom64` directory and run `make-rom.sh`. Alternatively, you can run `build.sh` or `build.ps1` (for Windows users) to do it automatically.

If using gdb to debug `doom64.elf`, change the `DISCARD` section inside `doom64.ld` from `*(*);` to `*(.MIPS.abiflags);` before building the rom.

## Configuration

You can add the following preprocessor definitions to the `DEFINES` section of the Makefile:

- `ENABLE_EXTRA_EPISODES=0`, disables the episode selection UI. Useful if you are building a custom rom and have deleted the Lost Levels from the wad.
- `ENABLE_REMASTER_SPRITES=0`, disables the option to toggle green blood and use alternate medikit sprites. Useful if building the rom without the extra sprites from the 2020 rerelease.
- `ENABLE_NIGHTMARE=0`, disables the fifth difficulty.

## Notes

Special thanks to Immorpher for the help and ideas, and JNMartin for the optimizations and porting to the modern SDK of Doom 64 Merciless Edition.

## Screenshots

![Episode Menu](screenshot1.png "Episode menu")
![Display Menu](screenshot2.png "Display menu")
![Save/Load Menu](screenshot3.png "Save/Load menu")
![Controls Menu](screenshot4.png "Controls menu")
![Features Menu](screenshot5.png "Features menu")
![Level 38](screenshot6.png "Level 38")
![Green Blood](screenshot7.png "Green Blood")
![Blue Medikits](screenshot8.png "Blue Medikits")
