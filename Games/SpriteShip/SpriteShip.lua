project "SpriteShip"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   staticruntime "off"

   files { "src/**.h", "src/**.cpp","include/**.h","include/**.cpp","assets/**" }

   includedirs
   {
     "src",
     "include",

     "%{IncludeDir.core}",
     "%{IncludeDir.SDL2}",
     "%{IncludeDir.SDL_image}",
     "%{IncludeDir.gamefw}",
     "%{IncludeDir.zlib}",
     "%{IncludeDir.libpng}"
   }

   links
   {
     "Core",
     "SDL2",
     "SDL2main",
     "SDL_image",
     "libpng",
     "zlib",
     "GameFW"
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
       optimize "On"
       symbols "On"

   filter "configurations:Dist"
       defines { "DIST" }
       runtime "Release"
       optimize "On"
       symbols "Off"