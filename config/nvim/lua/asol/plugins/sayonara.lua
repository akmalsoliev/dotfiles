function SayonaraBasedOnBufferCount()
  -- Use the Neovim API to get the list of buffers and count them
  local buffers = vim.api.nvim_list_bufs()
  local bufferCount = 0

  for _, buf in ipairs(buffers) do
    -- Check if the buffer is listed (ignores unlisted buffers which are not meant to be visible)
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
      bufferCount = bufferCount + 1
    end
  end

  -- Now, check the buffer count and execute the appropriate command
  if vim.bo.filetype == "FTerm" then
    vim.cmd("q")
  elseif bufferCount >= 2 then
    -- More than 2 buffers are open, use Sayonara!
    vim.cmd("Sayonara!")
  else
    -- 2 or less buffers are open, use Sayonara
    vim.cmd("Sayonara")
  end
end

return {
  'mhinz/vim-sayonara',
  cmd = 'Sayonara',
  keys = {
    {
      'q', SayonaraBasedOnBufferCount, mode = { 'n', 'v' }, desc = "[q] Sayonara",
    },
  },
}
