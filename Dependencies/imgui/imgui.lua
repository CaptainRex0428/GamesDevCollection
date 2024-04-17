project "ImGui"
	kind "StaticLib"
	language "C++"

	location "%{wks.location}/settings"
	targetdir ("%{wks.location}/bin/" .. OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin/obj/" .. OutputDir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
		"imgui_tables.cpp"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"
		defines {"WINDOWS"}

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"
		defines {"LINUX"}

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
