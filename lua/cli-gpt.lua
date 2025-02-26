-- cli-gpt.nvim - A simple Neovim plugin to run cli-gpt.js using visual selection and replacing it with output

local M = {}

-- Function to execute cli-gpt.js with visual selection and provided prompt
M.run_cli_gpt = function()
  vim.ui.input({ prompt = 'cli-gpt > ' }, function(input)
    if input and #input > 0 then
      local cmd = string.format("'<,'>! node ~/git/cli-gpt/cli-gpt.js -ic -p '%s'", input)
      vim.api.nvim_command(cmd)
    end
  end)
end

-- Key mapping using <leader>cg
M.setup = function()
  -- vim.api.nvim_set_keymap('n', '<leader>g', ":lua require'cli-gpt'.run_cli_gpt()<CR>", { noremap = true, silent = true })
  vim.keymap.set(
    { 'n', 'x' },
    '<leader>cg',
    ":lua require'cli-gpt'.run_cli_gpt()<CR>",
    { noremap = true, silent = true, desc = 'Modify [C]ode Selection with [G]PT' }
  )
end

return M
