project "Glad"
    kind "StaticLib"
    language "C"
    
    location "%{wks.location}/settings"
    targetdir ("%{wks.location}/bin/" .. OutputDir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin/obj/" .. OutputDir .. "/%{prj.name}")

    files
    {
        "include/glad/glad.h",
        "include/KHR/khrplatform.h",
        "src/glad.c"
    }

    includedirs
    {
        "include"
    }

  filter "system:windows"
    systemversion "latest"
    staticruntime "off"
    defines{"WINDOWS"}

	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
    defines{"DEBUG"}
	
	filter "configurations:Release"
		runtime "Release"
		optimize "Speed"
    defines{"NDEBUG"}
    
  filter "configurations:Dist"
    runtime "Release"
    optimize "on"
    defines{"NDEBUG"}