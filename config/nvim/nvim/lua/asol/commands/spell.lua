function spellToggle()
  vim.opt.spell = not vim.opt.spell:get()
end

return spellToggle
