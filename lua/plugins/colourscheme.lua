return {
        {
                "rebelot/kanagawa.nvim",
                lazy = false,
                priority = 1000,
        },

        {
                "thesimonho/kanagawa-paper.nvim",
                lazy = false,
                priority = 1000,
                opts = {},
        },

        {
                "xero/miasma.nvim",
                lazy = false,
                priority = 1000,
        },
        {
                "ellisonleao/gruvbox.nvim",
                priority = 1000,
                config = true,
                opts = ...,
        },

        {
                "LazyVim/LazyVim",
                opts = {
                        colorscheme = "miasma",
                },
        },
}
