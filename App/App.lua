project "App"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   targetdir "Binaries/%{cfg.buildcfg}"
   staticruntime "off"

   files { "src/**.h", "src/**.cpp","include/**.h","include/**.cpp" }

   includedirs
   {
      "src",
      "include",

      "%{IncludeDir.core}",
      "%{IncludeDir.imgui}",
      "%{IncludeDir.Pong}",
      "%{IncludeDir.SDL2}"

	  
   }

   links
   {
      "Core",
      "ImGui",
      "Pong",
      "SDL2",
      "SDL2main"
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