
-- Main Sub-project
project "RobotinoTest"
    kind "ConsoleApp"
    language "C++"
	cppdialect "C++17"
	staticruntime "on"
    location "build"

    -- Configs for this project
    local includes = { _SCRIPT_DIR .. "/include" }
    local sources = { _SCRIPT_DIR .. "/include/**", _SCRIPT_DIR .. "/src/**" }
    local outputdir = _SCRIPT_DIR .. "/bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
    
    -- Now apply all paths
    includedirs (IncludeDirs)
    includedirs (includes)
    files (sources)
    libdirs (LibraryDirs)
    targetdir (outputdir)
    links (Links)

    -- Organize the files in the Visual Studio project view
    vpaths {
        ["include"] = { _SCRIPT_DIR .. "/include/**" },
        ["src"] = { _SCRIPT_DIR .. "/src/**" }
    }

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

    filter { "platforms:Win32" }
        system "Windows"
        architecture "x86"

    filter { "platforms:x64" }
        system "Windows"
        architecture "x86_64"

    filter {}
