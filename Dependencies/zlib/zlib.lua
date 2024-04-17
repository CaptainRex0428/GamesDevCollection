project "zlib"             
	kind          "StaticLib"
	staticruntime "off"

	language          "C++"              -- Some files are C++ files, although they
	cppdialect        "C++20"            -- are not needed on normal Windows.
                            
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
        "%{IncludeDir.zlib}"
    }

	files {
		"adler32.c",
        "compress.c",
        "crc32.c",
        "deflate.c",
        "infback.c",
        "inffast.c",
        "inflate.c",
        "inftrees.c",
        "trees.c",
        "uncompr.c",
        "zutil.c"
					
	}
		
	inlining    "Explicit"             -- General optimisation options.
	intrinsics  "Off"

	filter "system:windows"
		systemversion "latest"
		defines {"WINDOWS"}

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
