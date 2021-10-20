
-- Retrieve the project name
newoption { trigger = "projectname", description = "Name of the generated project" }
local projectName = _OPTIONS["projectname"]
if projectName == nil then print("The project name was not specified! --projectname=YourApplication") end

-- Check if an environment variable exists, otherwise abort the program
function CheckEnvVar (variable, productName)
    if (os.getenv(variable) == nil) then
        print("Environment variable " .. variable .. " not found! Make sure the " .. productName .. " is installed correctly!")
        projectName = nil
    end
end

-- Here check if the RobotinoLib is installed, otherwise abort
if os.host() == "windows" then
    CheckEnvVar("ROBOTINOLIB_INCLUDE_DIRECTORY", "RobotinoLib")
    CheckEnvVar("ROBOTINOLIB_DEBUG_LINKS", "RobotinoLib")
    CheckEnvVar("ROBOTINOLIB_RELEASE_LINKS", "RobotinoLib")
    CheckEnvVar("ROBOTINOLIB_DEPLOY_LINKS", "RobotinoLib")
end

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

    -- Include directories and library linking
    filter { "configurations:Debug", "system:windows" }     -- Windows Debug
        links { "$(ROBOTINOLIB_DEBUG_LINKS)" }
    filter { "configurations:Release", "system:windows" }   -- Windows Release
        links { "$(ROBOTINOLIB_RELEASE_LINKS)" }
    filter { "configurations:Deploy", "system:windows" }    -- Windows Deploy
        links { "$(ROBOTINOLIB_DEPLOY_LINKS)" }

    filter { "system:windows" }         -- Windows
        includedirs { _SCRIPT_DIR .. "/include", "$(ROBOTINOLIB_INCLUDE_DIRECTORY)" }

    filter { "configurations:Debug", "system:not windows" }     -- Linux Debug
        links { "RobotinoLib-d" }
    filter { "configurations:Release", "system:not windows" }   -- Linux Release
        links { "RobotinoLib-r" }
    filter { "configurations:Deploy", "system:not windows" }    -- Linux Deploy
        links { "RobotinoLib" }

    filter { "system:not windows" }     -- Linux
        links { "rec_robotino_api2", "rec_robotino_rpc", "rec_rpc" }
        includedirs { _SCRIPT_DIR .. "/include", "/usr/local/include/" }
        libdirs "/usr/local/bin/"
        runpathdirs "/usr/local/bin/"

    filter {}
    
    -- Main source files
    files { _SCRIPT_DIR .. "/include/**", _SCRIPT_DIR .. "/src/**" }
