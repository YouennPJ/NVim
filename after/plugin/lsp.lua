local on_attach = function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)
end

local lspconfig = require('lspconfig')
lspconfig.jedi_language_server.setup {
    on_attach = on_attach,
}
lspconfig.svelte.setup {
    on_attach = on_attach,
}
lspconfig.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = { "python" },
    init_options = {
        formatters = {
            black = {
                command = "black",
                args = { "--quiet", "--line-length", "79", "-" },
                rootPatterns = { "pyproject.toml" },
            },
        },
        formatFiletypes = {
            python = { "black" }
        }
    }
}
lspconfig.tsserver.setup {
    on_attach = on_attach,
}
lspconfig.jdtls.setup {
    on_attach = on_attach,
}
lspconfig.clangd.setup {
    on_attach = on_attach,
    cmd = {
        "clangd",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--header-insertion-decorators",
        "--pch-storage=memory",
        "--enable-config"
    },
    flags = {
        debounce_text_changes = 150,
    }
}
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ['rust-analyzer'] = {},
    },
}
lspconfig.lua_ls.setup {
    on_attach = on_attach,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                    runtime = {
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME
                            -- "${3rd}/luv/library"
                            -- "${3rd}/busted/library",
                        }
                    }
                }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end
}

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<CR>")
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
