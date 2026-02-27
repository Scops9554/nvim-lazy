return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "none",

      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },

      ["<CR>"] = { "accept", "fallback" },
    },
    completion = {
      keyword = {
        range = "full",
      },
      menu = {
        border = "rounded",
        winhighlight = "Normal:NormalFloat," .. "FloatBorder:FloatBorder," .. "CursorLine:PmenuSel," .. "Search:None",
        draw = {
          padding = { 0, 0 },
        },
      },
      documentation = {
        auto_show = false,
      },
      -- Displays a preview of the selected item on the current line
      ghost_text = {
        enabled = true,
        -- Show the ghost text when an item has been selected
      },
    },
  },
}
