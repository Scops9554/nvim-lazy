local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}

  -- Get current UI dimensions
  local ui = vim.api.nvim_list_uis()[1]
  local screen_width = ui.width
  local screen_height = ui.height

  -- Default to 80% of screen
  local width = opts.width or math.floor(screen_width * 0.7)
  local height = opts.height or math.floor(screen_height * 0.7)

  -- Center the window
  local row = math.floor((screen_height - height) / 2)
  local col = math.floor((screen_width - width) / 2)

  -- Create buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf -- listed = false, scratch = true
  else
    buf = vim.api.nvim_create_buf(false, true) -- no file: scratch buffer
  end

  -- Open floating window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.cmd("hi MyFloatBorder guifg=#464069 guibg=NONE")
  vim.wo[win].winhl = "FloatBorder:MyFloatBorder"

  return { buf = buf, win = win }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})

vim.keymap.set("n", "<D-k>", function()
  vim.cmd("bdelete!")
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "t" }, "<space>tt", toggle_terminal, { desc = "floaterminal" })

return {}
