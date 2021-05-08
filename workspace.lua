
workspace "RobotinoTest"
configurations { "Debug", "Release" }

-- If gmake is used, remove Debug mode -> set to Release
filter { "action:gmake or gmake2" }
    removeconfigurations "Debug"
filter {}

platforms { "x64", "Win32" }
defaultplatform "x64"
startproject "RobotinoTest"

-- Initialize
IncludeDirs = {}
SourceFiles = {}
LibraryDirs = {}
Links = {}

-- Import all modules
include "."     -- the actual project itself
