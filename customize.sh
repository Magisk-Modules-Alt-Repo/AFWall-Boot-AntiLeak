# If you need to customize the module installation process, optionally you can create a new script in the installer called customize.sh. This script will be sourced (not executed!) by update-binary after all files are extracted and default permissions and secontext are applied. This is very useful if your module includes different files based on ABI, or you need to set special permissions/secontext for some of your files (e.g. files in /system/bin).

# If you need even more customization and prefer to do everything on your own, declare SKIPUNZIP=1 in customize.sh to skip the extraction and applying default permissions/secontext steps. Be aware that by doing so, your customize.sh will then be responsible to install everything by itself.

# customize.sh Environment
# Magisk’s internal busybox’s path $BBPATH is added in the front of PATH. The following variables and shell functions are available for convenience:

# Variables
# MAGISK_VER (string): the version string of current installed Magisk (e.g. v20.0)
# MAGISK_VER_CODE (int): the version code of current installed Magisk (e.g. 20000)
# BOOTMODE (bool): true if the module is being installed in Magisk Manager
# MODPATH (path): the path where your module files should be installed
# TMPDIR (path): a place where you can temporarily store files
# ZIPFILE (path): your module’s installation zip
# ARCH (string): the CPU architecture of the device. Value is either arm, arm64, x86, or x64
# IS64BIT (bool): true if $ARCH is either arm64 or x64
# API (int): the API level (Android version) of the device (e.g. 21 for Android 5.0)

# Functions
# ui_print <msg>
#    print <msg> to console
#    Avoid using 'echo' as it will not display in custom recovery's console

# abort <msg>
#    print error message <msg> to console and terminate installation
#    Avoid using 'exit' as it will skip the termination cleanup steps

# set_perm <target> <owner> <group> <permission> [context]
#    if [context] is not set, the default is "u:object_r:system_file:s0"
#    this function is a shorthand for the following commands:
#       chown owner.group target
#       chmod permission target
#       chcon context target

# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#    if [context] is not set, the default is "u:object_r:system_file:s0"
#    for all files in <directory>, it will call:
#       set_perm file owner group filepermission context
#    for all directories in <directory> (including itself), it will call:
#       set_perm dir owner group dirpermission context

# Easy Replace
# You can declare a list of folders you want to directly replace in the variable name REPLACE. The module installer script will pickup this variable and create .replace files for you. An example declaration:

# REPLACE="
# /system/app/YouTube
# /system/app/Bloatware
# "
# The list above will result in the following files being created: $MODPATH/system/app/YouTube/.replace and $MODPATH/system/app/Bloatware/.replace

# Notes
# When your module is downloaded with Magisk Manager, update-binary will be forcefully replaced with the latest module_installer.sh to ensure all installer uses up-to-date scripts. DO NOT try to add any custom logic in update-binary as it is pointless.
# Due to historical reasons, DO NOT add a file named install.sh in your module installer. That specific file was previously used and will be treated differently.
# DO NOT call exit at the end of customize.sh. The module installer would want to do finalizations.

ui_print ""
ui_print "*******************************"
ui_print "   This module will prevent"
ui_print "   internet access on boot"
ui_print "    BEFORE AfWall started"
ui_print "*******************************"
ui_print ""
ui_print "*******************************"
ui_print "        PLEASE REMOVE"
ui_print "  all custom antileak scripts"
ui_print "original AFWall antileak script"  
ui_print " will be removed automatically"  
ui_print "*******************************"
ui_print ""
ui_print "*******************************"
ui_print "   REBOOT IS NOT NECESSARY"
ui_print "*******************************"
