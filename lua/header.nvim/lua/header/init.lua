local M = {}

-- Default command; override this in your init.lua:
if vim.g.exec_headers_cmd == nil then
  vim.g.exec_headers_cmd = 'headers'
end

function M.add_header()
  local cmd = vim.g.exec_headers_cmd
  if vim.fn.executable(cmd) ~= 1 then
    vim.notify(("Command '%s' not found in PATH"):format(cmd))
    return
  end

  local s = vim.fn.getpos("'<")
  local e = vim.fn.getpos("'>")
  local bufnr = vim.api.nvim_get_current_buf()
  local l1, c1 = s[2], s[3]
  local l2, c2 = e[2], e[3]

  if l1 ~= l2 then
    vim.notify('Selection can only be a single line!')
    return
  end

  -- Get the selected lines
  local lines = vim.api.nvim_buf_get_lines(bufnr, l1 - 1, l2, false)
  local line = lines[1]
  local selection = line:sub(c1, c2)
  -- capture the inner run of characters after stripping spaces at both ends
  local trimmed = selection:match("^%s*(.-)%s*$")
  if (string.len(trimmed) > 64) then
    vim.notify('Selection is too big!')
    return
  end
  if (string.len(trimmed) < 1) then
    vim.notify('Selection contains nothing!')
    return
  end
  -- Run the command
  local out_lines = vim.fn.systemlist({ cmd, trimmed })
  local err = vim.v.shell_error
  if err ~= 0 then
    vim.notify(string.format(
      "'%s' exited with code %d", cmd, err))
    return
  end

  -- Split on newlines and trim a trailing empty line
  if #out_lines > 0 and out_lines[#out_lines] == "" then
    table.remove(out_lines, #out_lines)
  end

  -- Insert the result immediately after the selection
  vim.api.nvim_buf_set_lines(
    0, l1 - 1, l1 - 1, false, out_lines)

end

function M.setup(opts)
  opts = opts or {}
  -- Plugin setup logic here if needed
end

return M
