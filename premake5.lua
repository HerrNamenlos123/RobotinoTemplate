
-- Retrieve the project name
newoption { trigger = "projectname", description = "Name of the generated project" }
local projectName = _OPTIONS["projectname"]
if projectName == nil then print("The project name was not specified! --projectname=YourApplication") end

-- Main Solution
workspace (projectName)
    configurations { "Debug", "Release" }

    platforms { "x64" }
    defaultplatform "x64"
    startproject (projectName)

-- Actual project
project (projectName)
    language "C++"
	cppdialect "C++17"
	staticruntime "on"
    location "build"
    targetname (projectName)

    system "Windows"
    kind "ConsoleApp"
    architecture "x86_64"

    --pchheader "pch.h"
    --pchsource "src/pch.cpp"

    -- Configuration filters, filters are active up to the next filter statement
    -- Indentation is purely visual
    filter "configurations:Debug"
        defines { "DEBUG", "_DEBUG" }
        runtime "Debug"
        symbols "On"
        links { "$(ROBOTINOLIB_DEBUG_LINKS)" }
        targetdir (_SCRIPT_DIR .. "/bin/Debug")
    filter "configurations:Release"
        defines { "NDEBUG" }
        runtime "Release"
        optimize "On"
        links { "$(ROBOTINOLIB_RELEASE_LINKS)" }
        targetdir (_SCRIPT_DIR .. "/bin/Release")
    filter {}
    
    includedirs { _SCRIPT_DIR .. "/include", "$(ROBOTINOLIB_INCLUDE_DIRECTORY)" }
    files { _SCRIPT_DIR .. "/include/**", _SCRIPT_DIR .. "/src/**" }
