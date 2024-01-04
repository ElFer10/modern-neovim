if not require("config").pde.ai then
  return {}
end

return {
  {
    "Exafunction/codeium.vim",
    event = "InsertEnter",
    enabled = true,
    -- stylua: ignore
    config = function ()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<C-l>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<C-f>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<C-b>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
      vim.keymap.set("i", "<C-c>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
      vim.keymap.set("i", "<C-s>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
    end,
  },
  {
    "huggingface/hfcc.nvim",
    event = "InsertEnter",
    enabled = false,
    opts = {
      model = "bigcode/starcoder",
    },
  },
  {
    "codota/tabnine-nvim",
    enabled = false,
    build = "./dl_binaries.sh",
    event = "VeryLazy",
    config = function()
      require("tabnine").setup {
        disable_auto_comment = true,
        accept_keymap = "<A-l>",
        dismiss_keymap = "<A-c>",
        debounce_ms = 800,
        suggestion_color = { gui = "#808080", cterm = 244 },
        exclude_filetypes = { "TelescopePrompt" },
      }
    end,
  },
  {
    "mthbernardes/codeexplain.nvim",
    enabled = false,
    cmd = "CodeExplain",
    build = function()
      vim.cmd [[silent UpdateRemotePlugins]]
    end,
  },
}
