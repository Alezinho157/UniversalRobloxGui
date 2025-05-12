-- Loader.lua
local repo = "https://raw.githubusercontent.com/SeuUsuario/SeuRepo/main/"

-- Configuração
loadstring(game:HttpGet(repo.."Config.lua"))()

-- Interface
loadstring(game:HttpGet(repo.."UI.lua"))()
