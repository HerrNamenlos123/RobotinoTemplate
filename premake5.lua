
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

    dependson "RobotinoLib"

    --pchheader "pch.h"
    --pchsource "src/pch.cpp"

    -- Configuration filters, filters are active up to the next filter statement
    -- Indentation is purely visual
    filter "configurations:Debug"
        defines { "DEBUG", "_DEBUG" }
        runtime "Debug"
        symbols "On"
        targetdir (_SCRIPT_DIR .. "/bin/Debug")
    filter "configurations:Release"
        defines { "NDEBUG" }
        runtime "Release"
        optimize "On"
        targetdir (_SCRIPT_DIR .. "/bin/Release")
    filter {}

    -- Include directories and library linking
    filter { "configurations:Debug", "system:windows" }     -- Windows Debug
        links (_SCRIPT_DIR .. "/modules/RobotinoLib/bin/Debug/RobotinoLib.lib")
    filter { "configurations:Release", "system:windows" }   -- Windows Release
        links (_SCRIPT_DIR .. "/modules/RobotinoLib/bin/Release/RobotinoLib.lib")

    filter { "system:windows" }         -- Windows
        includedirs {   _SCRIPT_DIR .. "/include", 
                        _SCRIPT_DIR .. "/modules/RobotinoLib/include" ,
                        _SCRIPT_DIR .. "/modules/RobotinoLib/modules/spdlog/include" ,
                    }
        links "$(ROBOTINOAPI2_64_DIR)/lib/rec_robotino_api2"

    filter { "configurations:Debug", "system:not windows" }     -- Linux Debug
        links { "RobotinoLib-d" }
    filter { "configurations:Release", "system:not windows" }   -- Linux Release
        links { "RobotinoLib-r" }

    filter { "system:not windows" }     -- Linux
        links { "rec_robotino_api2", "rec_robotino_rpc", "rec_rpc" }
        includedirs { _SCRIPT_DIR .. "/include", "/usr/local/include/" }
        libdirs "/usr/local/bin/"
        runpathdirs "/usr/local/bin/"

    filter {}
    
    -- Main source files
    files { _SCRIPT_DIR .. "/include/**", _SCRIPT_DIR .. "/src/**" }


include "modules/RobotinoLib"   -- Include the RobotinoLib as subproject
