# Xcode cleanup plugin for oh-my-zsh.
#

function xcode_cleanup {
  xcode_cleanup_derived_data
  xcode_cleanup_device_support
  xcode_cleanup_archives
  xcode_cleanup_cache
  xcode_cleanup_simulator_log
  xcode_cleanup_simulator

  echo "Xcode cleanup done."
  echo

  return 0
}

function xcode_cleanup_derived_data() {
  setopt localoptions RM_STAR_SILENT
  setopt localoptions NO_NOMATCH

  local DD_DIR="$HOME/Library/Developer/Xcode/DerivedData"
  local usage=$(du -m -s $DD_DIR | awk '{print $1}')

  echo "Cleanup Derived Data"

  rm -rf $DD_DIR/*

  echo "${usage} MB freed"
  echo

  return 0
}

function xcode_cleanup_device_support() {
  setopt localoptions RM_STAR_SILENT
  setopt localoptions NO_NOMATCH

  local DEVICE_DIR="$HOME/Library/Developer/Xcode/iOS DeviceSupport"
  local device_dirs=("${(@f)$(find $DEVICE_DIR -type d -maxdepth 1 -print)}")
  local usage=0

  echo "Cleanup Device Support"

  device_dirs=(${device_dirs:1})  # remove '.' folder
  device_dirs=(${device_dirs:0:-1})  # remove last folder

  for dir in $device_dirs; do
    local d=${dir#$DEVICE_DIR/}
    local u=$(du -m -s $dir | awk '{print $1}')
    echo "Deleting: $d ($u MB)"
    ((usage+=u))
    #rm -rf $dir
  done

  echo "${usage} MB freed"
  echo

  return 0
}

function xcode_cleanup_archives() {
  setopt localoptions RM_STAR_SILENT
  setopt localoptions NO_NOMATCH

  local ARCHIVE_DIR="$HOME/Library/Developer/Xcode/Archives"

  local usage=$(du -m -s $ARCHIVE_DIR | awk '{print $1}')

  echo "Cleanup Archives"

  rm -rf $ARCHIVE_DIR/*

  echo "${usage} MB freed"
  echo

  return 0
}

function xcode_cleanup_cache() {
  setopt localoptions RM_STAR_SILENT
  setopt localoptions NO_NOMATCH

  local DIR="$HOME/Library/Caches/com.apple.dt.Xcode"
  local usage=$(du -m -s $DIR | awk '{print $1}')

  echo "Cleanup Cache"

  rm -rf $DIR/*

  echo "${usage} MB freed"
  echo

  return 0
}


function xcode_cleanup_simulator_log() {
  setopt localoptions RM_STAR_SILENT
  setopt localoptions NO_NOMATCH

  local SIMLOG_DIR="$HOME/Library/Logs/CoreSimulator"
  local usage=$(du -m -s $SIMLOG_DIR | awk '{print $1}')

  echo "Cleanup Simulator Logs"

  rm -rf $SIMLOG_DIR/*

  echo "${usage} MB freed"
  echo

  return 0
}


function xcode_cleanup_simulator() {
  echo "Cleanup unavailable simulators"

  $(xcrun simctl delete unavailable)

  echo

  return 0
}
