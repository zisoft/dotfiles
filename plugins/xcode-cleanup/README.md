# xcode-cleanup plugin

The xcode-cleanup plugin provides a few useful [functions](#functions) to cleanup Xcode data which may take up several GB on your hard drive.

To use it, add `xcode-cleanup` to the plugins array in your zshrc file:

```zsh
plugins=(... xcode-cleanup)
```

## Functions

 | Command                      | Description                                         |
 | :--------------------------- | :-------------------------------------------------- |
 | xcode_cleanup_derived_data   | Cleans the derived data folder                      |
 | xcode_cleanup_device_support | Deletes all but the most recent iOS device versions |
 | xcode_cleanup_archives       | Deletes all xcarchives                              |
 | xcode_cleanup_cache          | Deletes the Xcode cache                             |
 | xcode_cleanup_simulator_log  | Deletes the simulator log files                     |
 | xcode_cleanup_simulator      | Deletes files of unavailable simulators             |
 | xcode_cleanup                | Performs all of the above actions in a row          |
