return {
  "jmbuhr/otter.nvim",
  dependencies = {
    "hrsh7th/nvim-cmp",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    require("otter").activate({ "javascript", "python", "bash" }, true, true, nil)
  end
}
