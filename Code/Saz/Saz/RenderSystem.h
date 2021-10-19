#pragma once

#include <Saz/System.h>

#include <Vulkan/vulkan.h>

namespace Saz
{
	class GameTime;

	namespace glfw
	{
		class Window;
	}

	namespace sfml
	{
		class Window;
	}
}

namespace vulkan
{
	class Device;
	class Pipeline;
	class Model;
	class Renderer;
	class Buffer;
}

namespace ecs 
{
	class SAZ_API RenderSystem final : public System
	{
	public:
		
		RenderSystem(vulkan::Device& device, Saz::glfw::Window& window);
		~RenderSystem();

		virtual void PostInit() override;
		virtual void Update(const Saz::GameTime& gameTime) override;

		std::unique_ptr<vulkan::Model> CreateCube(vulkan::Device& device);
		std::unique_ptr<vulkan::Model> CreatePlane(vulkan::Device& device);
		void LoadObjects();
		void CreatePipelineLayout();
		void CreatePipeline();

	private:
		vulkan::Device& m_Device;
		Saz::glfw::Window& m_GLFWWindow;

		vulkan::Renderer* m_Renderer = nullptr;

		std::unique_ptr<vulkan::Pipeline> m_Pipeline;
		std::unique_ptr<vulkan::Buffer> m_Buffer;
		VkPipelineLayout m_PipelineLayout;
	};
}
