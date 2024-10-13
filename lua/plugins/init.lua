return {
    {
        dir = "~/tuta/coding/randomProjects/plugins/vogsphere/",
        name = "vogsphere",
        dev = true,
        config = function()
            require("vogsphere").setup({
              transparent = false
            })
            vim.cmd("colorscheme vogsphere")
        end
    },
    -- {
    --   "FtVim/vogsphere.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   opts = {},
    --   config = function()
    --     require("vogsphere").setup({})
    --     vim.cmd("colorscheme vogsphere")
    --   end
    -- },
    {
        "echasnovski/mini.hipatterns",
        event = "BufReadPre",
        opts = {
            highlighters = {
                hsl_color = {
                    pattern = "hsl%(%d+,? %d+,? %d+%)",
                    group = function(_, match)
                        local utils = require("vogsphere.hsl")
                        local nh, ns, nl = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
                        local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
                        local hex_color = utils.hslToHex(h, s, l)
                        return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
                    end,
                }
            }
        }

    },
    {
        "TuTaRdrgZ/norminette-lint.nvim",
        lazy = false,
        config = function()
            require("norminette-lint").setup({})
        end
    },
    {
        "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/tuta/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                },
            }
            vim.wo.foldlevel = 99
            vim.wo.conceallevel = 2
        end,
    },
}
