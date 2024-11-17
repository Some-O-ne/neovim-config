local plugin = { "hrsh7th/nvim-cmp" }

plugin.dependencies = {
	"L3MON4D3/LuaSnip",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"onsails/lspkind.nvim",
}

plugin.event = "InsertEnter"

plugin.config = function()
	local cmp = require("cmp")

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		},
		formatting = {
			format = require("lspkind").cmp_format({
				mode = "symbol_text", -- Show both icons and text
				maxwidth = 30, -- Truncate long entries
				ellipsis_char = "...", -- Add an ellipsis if text is truncated
			}),
		},
		mapping = {
			["<Tab>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-e>"] = cmp.mapping.abort(),
		},
	})
end

return plugin
