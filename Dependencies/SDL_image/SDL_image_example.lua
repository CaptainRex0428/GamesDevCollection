project "showimage"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   staticruntime "off"

   files { "examples/showimage.c"}

   includedirs
   {
      "%{IncludeDir.SDL2}",
	  "%{IncludeDir.SDL_image}"
   }

   links
   {
      "SDL2",
      "SDL2main",
	  "SDL_image"
   }

   location "%{wks.location}/settings"
   targetdir ("%{wks.location}/bin/" .. OutputDir .. "/%{prj.name}")
   objdir ("%{wks.location}/bin/obj/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { "WINDOWS" }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "Speed"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"

project "showanim"
	   kind "ConsoleApp"
	   language "C++"
	   cppdialect "C++20"
	   staticruntime "off"
	
	   files { "examples/showanim.c"}
	
	   includedirs
	   {
		  "%{IncludeDir.SDL2}",
		  "%{IncludeDir.SDL_image}"	  
	   }
	
	   links
	   {
		  "SDL2",
		  "SDL2main",
		  "SDL_image"
	   }
	
	   location "%{wks.location}/settings"
	   targetdir ("%{wks.location}/bin/" .. OutputDir .. "/%{prj.name}")
	   objdir ("%{wks.location}/bin/obj/" .. OutputDir .. "/%{prj.name}")
	
	   filter "system:windows"
		   systemversion "latest"
		   defines { "WINDOWS" }
	
	   filter "configurations:Debug"
		   defines { "DEBUG" }
		   runtime "Debug"
		   symbols "On"
	
	   filter "configurations:Release"
		   defines { "RELEASE" }
		   runtime "Release"
		   optimize "Speed"
		   symbols "On"
	
	   filter "configurations:Dist"
		   defines { "DIST" }
		   runtime "Release"
		   optimize "On"
		   symbols "Off"