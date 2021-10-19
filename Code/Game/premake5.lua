
-----------------------------------------------------
-- Game
-----------------------------------------------------
project "Game"
	kind		"ConsoleApp"
	dependson { "Core", "Saz" }
	location	"%{wks.location}/Projects/Game"
	pchheader "GamePCH.h"
	pchsource "Game/GamePCH.cpp"

	vpaths 
	{ 
		{ ["Source/*"] = {  
			"Game/**.h", 
			"Game/**.cpp", 
			"Game/**.inl" } },
	}

	files
	{
		"%{wks.location}/Data/**",
	}

	includedirs {
		"%{wks.location}/3rdParty/",
		"%{wks.location}/3rdParty/spdlog/include/",
		"%{wks.location}/3rdParty/glad/include/",
		"%{wks.location}/3rdParty/glad/src/",
		"%{wks.location}/3rdParty/imgui/",
		"%{wks.location}/3rdParty/SFML/Include/",
		"%{wks.location}/3rdParty/Vulkan/Include/",
		"%{wks.location}/Code/Core/",
		"%{wks.location}/Code/Saz/",
		"%{wks.location}/3rdParty/glm/",
	}

	libdirs{
		"%{wks.location}/3rdParty/",
		"%{wks.location}/Build/Saz/%{cfg.buildcfg}_%{cfg.platform}/",
		"%{wks.location}/3rdParty/SFML/Library/%{cfg.buildcfg}/",
	}

	links 
	{
		"Saz",
	}

	filter "Debug"
		links 
		{ 
			"sfml-audio-d.lib",
			"sfml-graphics-d.lib",
			"sfml-main-d.lib",
			"sfml-network-d.lib",
			"sfml-system-d.lib",
			"sfml-window-d.lib",
		}
	filter "Release"
		links 
		{ 
			"sfml-audio.lib",
			"sfml-graphics.lib",
			"sfml-main.lib",
			"sfml-network.lib",
			"sfml-system.lib",
			"sfml-window.lib",
		}
	filter {} -- disable the filter

	buildcommands 
	{ 
		"cd %{wks.location}/Data/Shaders & call CompileShaders.bat" 
	}

	postbuildcommands 
	{ 
		"{COPY} %{wks.location}/3rdParty/*.dll $(OutDir)",
		"{COPY} %{wks.location}/3rdParty/SFML/Binary/%{cfg.buildcfg}/*.dll $(OutDir)",
	}

	filter "system:windows"
		systemversion "latest"
		defines
		{
			"SAZ_PLATFORM_WINDOWS"
		}