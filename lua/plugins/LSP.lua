local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local function setCommon()
    -- Code action
    vim.keymap.set('n', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', {silent = true})
    -- Show info
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    -- Go to definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    -- Navigate diagnostic messages
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer = 0})
    -- Show floating diagnostic message
    vim.keymap.set('n', '<leader>ds', '<cmd>lua vim.diagnostic.open_float()<CR>')
    -- Rename
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
end

-- C++
require'lspconfig'.clangd.setup{
    capabilities = capabilities,
    on_attach = function()
        setCommon()
    end,
}

-- Python
require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = function()
        setCommon()
    end,
}

-- Bash
require'lspconfig'.bashls.setup{
    capabilities = capabilities,
    on_attach = function()
        setCommon()
    end,
}

-- Lua
require'lspconfig'.sumneko_lua.setup{
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'luajit',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = function()
        setCommon()
    end,
}

-- TypeScript
require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    on_attach = function()
        setCommon()
    end,
}

-- HTML
require'lspconfig'.html.setup{
    capabilities = capabilities,
    on_attach = function()
        setCommon()
    end,
}
