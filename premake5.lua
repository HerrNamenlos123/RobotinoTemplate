
-- Retrieve the project name
newoption { trigger = "projectname", description = "Name of the generated project" }
local projectName = _OPTIONS["projectname"]
if projectName == nil then print("The project name was not specified! --projectname=YourApplication") end

-- Main Solution
workspace (projectName)
    configurations { "Debug", "Release" }

    platforms { "x86", "x64" }
    defaultplatform "x86"
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

    --pchheader "pch.h"
    --pchsource "src/pch.cpp"

    -- Configuration filters, filters are active up to the next filter statement
    -- Indentation is purely visual
    filter "configurations:Debug"
        defines { "DEBUG", "_DEBUG" }
        runtime "Debug"
        symbols "On"
    filter "configurations:Release"
        defines { "NDEBUG" }
        runtime "Release"
        optimize "On"
    filter {}

    filter "platforms:x86"
        architecture "x86"
    filter "platforms:x64"
        architecture "x86_64"
    filter {}

    filter { "configurations:Debug", "platforms:x86" }
        links { "$(ROBOTINOLIB_DEBUG32_LINKS)" }
        targetdir (_SCRIPT_DIR .. "/bin/Debug/x86")
    filter { "configurations:Debug", "platforms:x64" }
        links { "$(ROBOTINOLIB_DEBUG64_LINKS)" }
        targetdir (_SCRIPT_DIR .. "/bin/Debug/x64")
    filter { "configurations:Release", "platforms:x86" }
        links { "$(ROBOTINOLIB_RELEASE32_LINKS)" }
        targetdir (_SCRIPT_DIR .. "/bin/Release/x86")
    filter { "configurations:Release", "platforms:x64" }
        links { "$(ROBOTINOLIB_RELEASE64_LINKS)" }
        targetdir (_SCRIPT_DIR .. "/bin/Release/x64")
    filter {}
    
    includedirs { _SCRIPT_DIR .. "/include", "$(ROBOTINOLIB_INCLUDE_DIRECTORY)" }
    files { _SCRIPT_DIR .. "/include/**", _SCRIPT_DIR .. "/src/**" }
