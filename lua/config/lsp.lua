vim.o.pumborder = "rounded"
vim.opt.completeopt = { "menu", "menuone", "noselect", "fuzzy", "popup" }
vim.lsp.config("*", {
  root_makers = { ".git", "pyproject.toml" }
})

vim.lsp.config("basedpyright", {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", ".git" },
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = {
        autoSearchPaths = true,
        typeCheckingMode = "standard",
        diagnosticMode = "openFilesOnly",
      },
    },
  },
})

vim.lsp.enable("basedpyright")

vim.diagnostic.config({
  severity_sort = true,
  virtual_text = { spacing = 2, prefix = "" },
  float = { border = "rounded" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
