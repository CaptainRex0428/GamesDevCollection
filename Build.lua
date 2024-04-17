include "Dependencies.lua"

workspace "GamesDevCollection"
   architecture "x64"
   configurations { "Debug", "Release", "Dist" }
   startproject "App"

   -- Workspace-wide build options for MSVC
   filter "system:windows"
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }

OutputDir = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

group ""
   include "App/Build-App.lua"

group "Core"
	include "Core/Build-Core.lua"
   
group "Dependencies"
   include "Dependencies/glad/glad.lua"
   include "Dependencies/glfw/glfw.lua"
   include "Dependencies/SDL2/SDL2.lua"
   include "Dependencies/imgui/imgui.lua"
   include "Dependencies/zlib/zlib.lua"
   include "Dependencies/SDL_image/SDL_image.lua"   
   include "Dependencies/libpng/libpng.lua"
group "Dependencies/Examples"
   include "Dependencies/SDL_image/SDL_image_example.lua"
     

group "Games"
   include "Games/GameFW/GameFW.lua"
   include "Games/Pong/Pong.lua"
   include "Games/SpriteShip/SpriteShip.lua"