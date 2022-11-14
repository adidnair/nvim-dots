local cmp = require'cmp'

local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end

lspkind.init()

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
	["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
	["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
	["<C-d>"] = cmp.mapping.scroll_docs(-4),
	["<C-f>"] = cmp.mapping.scroll_docs(4),
	["<C-e>"] = cmp.mapping.abort(),
	["<c-y>"] = cmp.mapping(
	    cmp.mapping.confirm {
	    	behavior = cmp.ConfirmBehavior.Insert,
	    				select = true,
	    },
	    { "i", "c" }
	),
	["<c-space>"] = cmp.mapping {
		i = cmp.mapping.complete(),
		c = function(
			_ --[[fallback]]
		)
			if cmp.visible() then
				if not cmp.confirm { select = true } then
					return
				end
			else
				cmp.complete()
			end
		end,
	},

	-- ["<tab>"] = false,
	["<tab>"] = cmp.config.disable,

	-- ["<tab>"] = cmp.mapping {
	--	 i = cmp.config.disable,
	--	 c = function(fallback)
	--		 fallback()
	--	 end,
	-- },

	-- Testing
	["<c-q>"] = cmp.mapping.confirm {
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	},
	}),
    sources = {
        { name = "gh_issues" },

        -- Youtube: Could enable this only for lua, but nvim_lua handles that already.
        { name = "nvim_lua" },

        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 5 },

        { name = "omni" },
    },
    formatting = {
        -- youtube: how to set up nice formatting for your sources.
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "「BUF」",
                nvim_lsp = "「LSP」",
                nvim_lua = "「API」",
                path = "「PATH」",
                luasnip = "「SNIP」",
                gh_issues = "「ISSUES」",
                tn = "「tabnine」",
            },
        },
    },
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
-- 	sources = cmp.config.sources({
-- 		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
-- 	}, {
-- 		{ name = 'buffer' },
-- 	})
-- })

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = {
-- 		{ name = 'buffer' }
-- 	}
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = 'path' }
-- 	}, {
-- 		{ name = 'cmdline' }
-- 	})
-- })

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
-- 	capabilities = capabilities
-- }
