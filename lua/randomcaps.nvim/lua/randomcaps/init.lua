local M = {}

math.randomseed(os.time())

local function randomize(str)
  return str:gsub(".", function(c)
    if c:match("%a") then
      return (math.random() < 0.5) and c:upper() or c:lower()
    else
      return c
    end
  end)
end

function M.randomize_selection()
  local s = vim.fn.getpos("'<")
  local e = vim.fn.getpos("'>")
  local bufnr = vim.api.nvim_get_current_buf()
  local l1, c1 = s[2], s[3]
  local l2, c2 = e[2], e[3]

  -- Get the selected lines
  local lines = vim.api.nvim_buf_get_lines(bufnr, l1 - 1, l2, false)

  if #lines == 0 then
    return
  end

  -- Find the position of the last alphabetical char:
  local new_l2, new_c2
  local last = true
  for idx = #lines, 1, -1 do
    local pos
    local line
    if last then
      local full_line = lines[idx]
      line = full_line:sub(1, c2)
      pos = line:match('.*()%a')
      last = false
    else
      line = lines[idx]
      pos = line:match('.*()%a')
    end
    if pos then
      new_l2 = l1 - 1 + idx
      new_c2 = pos
      break
    else
      table.remove(lines, idx)
    end
  end

  if not new_l2 then
    return
  end

  l2 = new_l2
  c2 = new_c2

  -- Handle single line selection
  if #lines == 1 then
    local line = lines[1]
    -- Ensure c2 doesn't exceed line length
    lines[1] = line:sub(1, c1 - 1) ..
               randomize(line:sub(c1, c2)) ..
               line:sub(c2 + 1, #line)
  else
    -- Handle multi-line selection
    for i, line in ipairs(lines) do
      local sc, ec

      if i == 1 then
        -- First line: start from c1, go to end of line
        sc = c1
        ec = #line
      elseif i == #lines then
        -- Last line: start from beginning, go to c2 (but not beyond line length)
        sc = 1
        ec = math.min(c2, #line)
      else
        -- Middle lines: process entire line
        sc = 1
        ec = #line
      end

      if sc <= ec and ec > 0 then
        lines[i] = line:sub(1, sc - 1) ..
                   randomize(line:sub(sc, ec)) ..
                   line:sub(ec + 1, #line)
      end
    end
  end

  -- Replace the text
  vim.api.nvim_buf_set_text(bufnr, l1 - 1, 0, l2 - 1, -1, lines)
end

function M.setup(opts)
  opts = opts or {}
  -- Plugin setup logic here if needed
end

return M
