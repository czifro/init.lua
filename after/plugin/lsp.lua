-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[N]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap("<leader>cf", vim.lsp.buf.format, '[C]ode [F]ormat')

  nmap('<leader>cd', vim.lsp.buf.definition, '[C]ode [D]efinition')
  nmap('<leader>cD', vim.lsp.buf.declaration, '[c]ode [D]eclaration')
  nmap('<leader>cr', require('telescope.builtin').lsp_references, '[C]ode [R]eferences')
  nmap('<leader>ci', vim.lsp.buf.implementation, '[C]ode [I]mplementation')
  nmap('<leader>ct', vim.lsp.buf.type_definition, '[C]ode [T]ype')

  nmap('<leader>fs', require('telescope.builtin').lsp_document_symbols, '[F]ile [S]ymbols')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('<leader>ps', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[P]roject [S]ymbols')
  nmap('<leader>pa', vim.lsp.buf.add_workspace_folder, '[P]roject [A]dd Folder')
  nmap('<leader>pr', vim.lsp.buf.remove_workspace_folder, '[P]roject [R]emove Folder')
  nmap('<leader>pl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[P]roject [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  clangd = {},
  gopls = {},
  -- pyright = {},
  rust_analyzer = {},
  -- tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
