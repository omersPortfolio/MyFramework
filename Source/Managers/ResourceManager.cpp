#include "GamePCH.h"
#include "ResourceManager.h"

namespace
{
	static constexpr const char* initialPath = "../../Data/Textures/";
}


ResourceManager::ResourceManager()
{

}

ResourceManager::~ResourceManager()
{
	for (const auto& [name, texture] : m_pTextures)
	{
		delete texture;
	}
}

void ResourceManager::LoadTexture(const std::string& fileName, sf::Texture* pTexture)
{
	if (!pTexture->loadFromFile(initialPath + fileName))
	{
		LOG(ERROR, "Could not load texture file '%s'", fileName);
		return;
	}
	AddTexture(fileName.c_str(), pTexture);
}

sf::Texture* ResourceManager::GetTexture(const std::string& name)
{
	return m_pTextures[name]; 
}

void ResourceManager::AddTexture(const std::string& name, sf::Texture* pTexture)
{
	m_pTextures[name] = pTexture;
}
