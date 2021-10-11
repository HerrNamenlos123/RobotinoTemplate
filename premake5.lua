
-- Retrieve the project name
newoption { trigger = "projectname", description = "Name of the generated project" }
local projectName = _OPTIONS["projectname"]
if projectName == nil then print("The project name was not specified! --projectname=YourApplication") end

-- Main Solution
workspace (projectName)
    configurations { "Debug", "Release", "Deploy" }

    platforms { "x64" }
    defaultplatform "x64"
    startproject (projectName)
    
    filter "system:not windows"
    	location "build"
    filter {}

-- Actual project
project (projectName)
    language "C++"
	cppdialect "C++17"
	staticruntime "on"
    location "build"
    targetname (projectName)

    kind "ConsoleApp"
    architecture "x86_64"

    --pchheader "pch.h"
    --pchsource "src/pch.cpp"

    -- Configuration filters, filters are active up to the next filter statement
    -- Indentation is purely visual
    filter "configurations:Debug"
        defines { "DEBUG", "_DEBUG", "NDEPLOY" }
        runtime "Debug"
        symbols "On"
        targetdir (_SCRIPT_DIR .. "/bin/Debug")
    filter "configurations:Release"
        defines { "NDEBUG", "NDEPLOY" }
        runtime "Release"
        optimize "On"
        targetdir (_SCRIPT_DIR .. "/bin/Release")
    filter "configurations:Deploy"
        defines { "NDEBUG", "DEPLOY" }
        runtime "Release"
        optimize "On"
        targetdir (_SCRIPT_DIR .. "/bin/Deploy")
    filter {}

    filter { "configurations:Debug", "system:windows" }
        includedirs { _SCRIPT_DIR .. "/include", "$(ROBOTINOLIB_INCLUDE_DIRECTORY)" }
        links { "$(ROBOTINOLIB_DEBUG_LINKS)" }
    filter { "configurations:Release", "system:windows" }
        includedirs { _SCRIPT_DIR .. "/include", "$(ROBOTINOLIB_INCLUDE_DIRECTORY)" }
        links { "$(ROBOTINOLIB_RELEASE_LINKS)" }
    filter { "configurations:Deploy", "system:windows" }
        includedirs { _SCRIPT_DIR .. "/include", "$(ROBOTINOLIB_INCLUDE_DIRECTORY)" }
        links { "$(ROBOTINOLIB_RELEASE_LINKS)" }
    filter { "system:not windows" }
        includedirs { _SCRIPT_DIR .. "/include", "/usr/local/include/" }
        libdirs "/usr/local/bin/"
        links { "rec_robotino_api2", "RobotinoLib" }
    filter {}
    
    files { _SCRIPT_DIR .. "/include/**", _SCRIPT_DIR .. "/src/**" }
