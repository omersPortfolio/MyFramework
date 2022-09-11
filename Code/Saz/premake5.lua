
-----------------------------------------------------
-- Saz
-----------------------------------------------------
project "Saz"
	kind		"StaticLib"
	dependson { "Core", "Imgui", "GLFW", "GLAD", "glm" }
	location	"%{wks.location}/Projects/Saz"
	pchheader "SazPCH.h"
	pchsource "Saz/SazPCH.cpp"
	staticruntime "on"

	defines 
	{
		"GLFW_INCLUDE_NONE",
		"_CRT_SECURE_NO_WARNINGS",
	}

	vpaths 
	{ 
		{ ["Source/*"] = {  
			"Saz/**.h", 
			"Saz/**.cpp", 
			"Saz/**.inl" } },
	}

	flags
	{
		"MultiProcessorCompile"
	}

	IncludeDir = {}
	IncludeDir["ImGui"] = "%{wks.location}/3rdParty/imgui"
	IncludeDir["entt"] = "%{wks.location}/3rdParty/entt/include"
	IncludeDir["spdlog"] = "%{wks.location}/3rdParty/spdlog/include"
	IncludeDir["GLFW"] = "%{wks.location}/3rdParty/GLFW/GLFW/include"
	IncludeDir["GLAD"] = "%{wks.location}/3rdParty/GLAD/include"
	IncludeDir["glm"] = "%{wks.location}/3rdParty/glm/glm"
	IncludeDir["stb_image"] = "%{wks.location}/3rdParty/stb_image"
	IncludeDir["yaml_cpp"] = "%{wks.location}/3rdParty/yaml-cpp/yaml-cpp/include"

	includedirs {
		"%{wks.location}/Code/Core/",
		"%{wks.location}/Code/Saz/",
		"%{wks.location}/Code/Saz/Saz/",
		"%{wks.location}/3rdParty/",
		"%{wks.location}/3rdParty/spdlog/include",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.ImGui}/imgui",
		"%{IncludeDir.entt}",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.GLAD}",
		"%{IncludeDir.glm}",
		"%{IncludeDir.stb_image}",
		"%{IncludeDir.yaml_cpp}",
	}

	links {
		"Core",
		"ImGui",
		"GLFW",
		"GLAD",
		"yaml-cpp",
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"

		defines{
			"SAZ_PLATFORM_WINDOWS",
		}

	filter "files:%{wks.location}/3rdParty/**.cpp"
		flags { "NoPCH" }

	