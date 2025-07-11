if vim.g.loaded_header_plugin then
  return
end
vim.g.loaded_header_plugin = true

-- Create the user command
vim.api.nvim_create_user_command("AddHeader", function()
  require("header").add_header()
end, { range = true, desc = "Build a header comment from selection" })

-- Create the keymap
vim.keymap.set("v", "<leader>ah", ":AddHeader<CR>", {
  desc = "Splat a header comment from selection",
  silent = true
})
