local keymap = vim.keymap.set
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>",  { desc = "ファイラー トグル" })
keymap("n", "<leader>fe", "<cmd>NvimTreeFocus<CR>", { desc = "ファイラーにフォーカス" })
keymap("n", "<leader>ff", "<cmd>NvimTreeFindFile<CR>", { desc = "現在ファイルを探す" })

-- LSP keymap --
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_keymaps", { clear = true }),
  callback = function(ev)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc, silent = true })
    end

    map("gd", vim.lsp.buf.definition, "Goto Definition")
    map("gD", vim.lsp.buf.declaration, "Goto Declaration")
    map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
    map("<leader>e", vim.diagnostic.open_float, "Diagnostic float")
    map("<leader>ih", function()
      vim.lsp.inlay_hint.enable(
        not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }),
        { bufnr = ev.buf }
      )
    end, "Toggle Inlay Hints")
  end,
})
