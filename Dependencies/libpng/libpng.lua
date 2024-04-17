project "libpng"             
	kind          "StaticLib"
	staticruntime "off"

	language          "C++"              -- Some files are C++ files, although they
	cppdialect        "C++20"            -- are not needed on normal Windows.
                            
	systemversion     "latest"

	location "%{wks.location}/settings"
	targetdir ("%{wks.location}/bin/" .. OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin/obj/" .. OutputDir .. "/%{prj.name}")

	includedirs      
    {
        "%{IncludeDir.libpng}",
        "%{IncludeDir.zlib}"
    }

	links
	{
		"zlib"
	}

	files 
    {
        "arm/arm_init.c",
        "arm/filter_neon_intrinsics.c",
        "arm/palette_neon_intrinsics.c"	,
        "png.c",
        "pngerror.c",
        "pngget.c",
        "pngmem.c",
        "pngpread.c",
        "pngread.c",
        "pngrio.c",
        "pngrtran.c",
        "pngrutil.c",
        "pngset.c",
        "pngtrans.c",
        "scripts/pngwin.rc",
        "pngwio.c",
        "pngwrite.c",
        "pngwtran.c",
        "pngwutil.c"
	}

	inlining          "Explicit"
	intrinsics        "Off"

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

