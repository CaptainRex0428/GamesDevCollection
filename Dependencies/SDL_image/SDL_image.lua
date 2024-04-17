project "SDL_image"             
	kind          "StaticLib"
	staticruntime "off"

	language          "C++"              -- Some files are C++ files, although they
	cppdialect        "C++17"            -- are not needed on normal Windows.
                            
	systemversion     "latest"

	flags {
		              "NoRuntimeChecks", -- Only used on Visual Studio.
		              "NoBufferSecurityCheck"
	}

	vectorextensions  "SSE"               -- Necessary to run x32.

	location "%{wks.location}/settings"
	targetdir ("%{wks.location}/bin/" .. OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin/obj/" .. OutputDir .. "/%{prj.name}")

	includedirs
	{
		"include", 
		"%{IncludeDir.SDL2}",
		"%{IncludeDir.libpng}"
	}

	links
	{
		"SDL2",
		"SDL2main",
		"libpng"
	}

	files {
		"include/*.h",					
		"src/**.h",						"src/**.c",		
	}

	filter "system:windows"
		inlining          "Explicit"             -- General optimisation options.
		intrinsics        "Off"
		systemversion	  "latest"
		defines {"WINDOWS"}
		links 
		{
			"setupapi",
			"winmm",
			"imm32",
			"version",
		}
		

	filter "configurations:Debug"
		defines {"DEBUG"}
		runtime       "Debug"
		symbols       "On"

	filter "configurations:Release"
		defines {"RELEASE"}
		runtime       "Release"
		optimize      "Speed"


	filter "configurations:Dist"
		defines {"Dist"}
		runtime       "Release"
		optimize      "On"