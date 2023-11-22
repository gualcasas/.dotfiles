local function set_background_transparent()
    local hl_groups = {
        "Normal",
        "NormalNC",
        "LineNr",
        "SignColumn",
    }

    for _, hl_group in ipairs(hl_groups) do
        vim.api.nvim_set_hl(0, hl_group, { bg = "none" })
    end
end

-- vim.api.nvim_set_hl(0, "NormalFloat", {
--     link = "Normal",
-- })

---returns true if theme should be enabled
---@param theme string
---@return boolean
local function enable_theme(theme)
    local nvim_theme = os.getenv("NVIM_THEME")
    if not nvim_theme or not string.match(nvim_theme, theme) then
        return false
    end
    return true
end

---@type LazyPluginSpec[]
return {
    {
        "marko-cerovac/material.nvim",
        cond = enable_theme("material"),
        priority = 1000,
        event = { "BufReadPost" }, -- BufReadPost or welcome message goes away
        opts = {
            plugins = {
                "gitsigns",
                "illuminate",
                "indent-blankline",
                "mini",
                "nvim-cmp",
                "nvim-tree",
                "nvim-web-devicons",
                "telescope",
            },
            disable = { colored_cursor = true },
            high_visibility = { lighter = true },
        },
        config = function(_, opts)
            vim.opt.background = "light"
            vim.g.material_style = "lighter"
            require("material").setup(opts)
            vim.cmd([[colorscheme material]])

            set_background_transparent()
        end,
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        cond = enable_theme("oxocarbon"),
        priority = 1000,
        config = function()
            vim.opt.background = "dark"
            vim.cmd([[colorscheme oxocarbon]])
            -- vim.api.nvim_set_hl(0, "@keyword", { fg = "#ee5396" })
            -- vim.api.nvim_set_hl(0, "@include", { fg = "#82cfff" })
            -- vim.api.nvim_set_hl(0, "@tag.attribute", { fg = "#08bdba" })
            -- vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#08bdba" })
            -- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#ee5396" })
            -- vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#08bdba" })
            -- vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#ee5396" })
            -- vim.api.nvim_set_hl(0, "DiagnosticsBorder", { fg = "#FF6F00" }) -- diagnostics
            -- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#82cfff" })
            -- vim.api.nvim_set_hl(0, "StatusLine", { fg = "#FAFAFA", bg = "#691a82", bold = true })
            -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#30233d" })

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            -- set_background_transparent()
        end,
    },
}
