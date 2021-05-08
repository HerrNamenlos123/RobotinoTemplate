
-- This represents the Solution in VS2019
workspace "RobotinoTest"
configurations { "Debug", "Release" }

-- If gmake is used, remove Debug mode -> set to Release
filter { "action:gmake or gmake2" }
    removeconfigurations "Debug"
filter {}

platforms { "x64", "Win32" }
defaultplatform "x64"
startproject "RobotinoTest"



-- Now include the projects in the solution

-- Initialize
IncludeDirs = {}
SourceFiles = {}
LibraryDirs = {}
Links = {}

-- Import all modules
include "modules/RobotinoLib"     -- the library
include "."     -- the actual project itself (premake5.lua)

-- Now add all dependencies from the modules
project "RobotinoTest"
    includedirs (IncludeDirs)
    libdirs (LibraryDirs)
    links (Links)
