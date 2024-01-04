local M = {
  "nvim-lualine/lualine.nvim",
  lazy=false
}

function M.config()
  local icons = require "config.icons"
  local diff = {
    "diff",
    colored = false,
    symbols = { added = icons.git.LineAdded, modified = icons.git.LineModified, removed = icons.git.LineRemoved }, -- Changes the symbols used by the diff.
  }

  local diagnostics = {
    "diagnostics",
    sections = { "error", "warn" },
    colored = false, -- Displays diagnostics status in color if set to true.
    always_visible = true, -- Show diagnostics even if there are none.
  }

  local filetype = {
    "filetype",
    colored = false,
    icon_only = false,
  }

  require("lualine").setup {
    options = {
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },

      ignore_focus = { "NvimTree" },
    },
    sections = {
      -- lualine_a = { {"branch", icon =""} },
      -- lualine_b = { diff },
      -- lualine_c = { "diagnostics" },
      -- lualine_x = { copilot },
      -- lualine_y = { "filetype" },
      -- lualine_z = { "progress" },
      -- lualine_a = { "mode" },
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = { diagnostics },
      -- lualine_x = { diff, "copilot", filetype },
      -- lualine_x = { "copilot", filetype },
      lualine_y = { "progress" },
      lualine_z = {},
    },
    -- extensions = { "quickfix", "man", "fugitive", "oil" },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M

-- return {
--   {
--     "nvim-lualine/lualine.nvim",
--     dependencies = {
--       "meuter/lualine-so-fancy.nvim",
--       { "Pheon-Dev/pigeon", opts = {} },
--     },
--     event = "VeryLazy",
--     opts = function()
--       local components = require "plugins.statusline.components"
--       return {
--         options = {
--           icons_enabled = true,
--           theme = "auto",
--           component_separators = {},
--           section_separators = {},
--           disabled_filetypes = {
--             statusline = { "dashboard", "alpha", "lazy", "fugitive" },
--             winbar = {
--               "help",
--               "alpha",
--               "lazy",
--             },
--           },
--           always_divide_middle = true,
--           globalstatus = true,
--         },
--         sections = {
--           lualine_a = { { "fancy_mode", width = 3 } },
--           lualine_b = { components.git_repo, "branch" },
--           lualine_c = {
--             "filename",
--             { "fancy_cwd", substitute_home = true },
--             components.diff,
--             { "fancy_diagnostics" },
--             components.noice_command,
--             components.noice_mode,
--             -- { require("NeoComposer.ui").status_recording },
--             components.separator,
--             components.lsp_client,
--           },
--           lualine_x = { components.battery, components.spaces, "encoding", "fileformat", "filetype", "progress" },
--           lualine_y = {},
--           lualine_z = { "location" },
--         },
--         inactive_sections = {
--           lualine_a = {},
--           lualine_b = {},
--           lualine_c = { "filename" },
--           lualine_x = { "location" },
--           lualine_y = {},
--           lualine_z = {},
--         },
--         extensions = { "nvim-tree", "toggleterm", "quickfix" },
--       }
--     end,
--   },
-- }
