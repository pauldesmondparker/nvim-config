if vim.g.loaded_randomcaps then
  return
end
vim.g.loaded_randomcaps = true

-- Create the user command
vim.api.nvim_create_user_command("RandomCaps", function()
  require("randomcaps").randomize_selection()
end, { range = true, desc = "Random-case letters" })

-- Create the keymap
vim.keymap.set("v", "<leader>rc", ":RandomCaps<CR>", {
  desc = "Random-case letters",
  silent = true
})
