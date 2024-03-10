--  _                    _              _____      _               
-- | |                  | |            / ____|    | |              
-- | |     ___  __ _  __| | ___ _ __  | (___   ___| |_ _   _ _ __  
-- | |    / _ \/ _` |/ _` |/ _ \ '__|  \___ \ / _ \ __| | | | '_ \ 
-- | |___|  __/ (_| | (_| |  __/ |     ____) |  __/ |_| |_| | |_) |
-- |______\___|\__,_|\__,_|\___|_|    |_____/ \___|\__|\__,_| .__/ 
--                                                          | |    
--                                                          |_|
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--  _                     _ 
-- | |                   | |
-- | |     ___   __ _  __| |
-- | |    / _ \ / _` |/ _` |
-- | |___| (_) | (_| | (_| |
-- |______\___/ \__,_|\__,_|
--                          
--                          

local configDir = vim.fn.stdpath('config')
local files = vim.fn.glob(configDir .. "/lua/asol/*.lua")
local splitFiles = vim.split(files, "\n")
local username = "asol"

for _, v in pairs(splitFiles) do
  local fileName = v:match("([^/\\]+)%.lua$")
  if fileName ~= "init" then      
    require(username .. "." .. fileName)
  end
end
