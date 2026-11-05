return {
  {
    "JarnDev/autodap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "mason-org/mason.nvim", -- optional
    },
    config = function()
      require("autodap").setup()
      -- Map your debug key to the friendly entrypoint:
      vim.keymap.set("n", "<F5>", function()
        require("autodap").continue()
      end)
    end,
  },
}
