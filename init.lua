vim.g.mapleader = " "
vim.o.guicursor = ""
vim.o.mouse = ""
vim.o.clipboard = ""
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.autoindent = true
vim.o.hlsearch = false
vim.o.scrolloff = 10
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.diagnostic.config({ virtual_text = true })

-- plugins
vim.pack.add({
	{ src = "https://github.com/ThorstenRhau/token" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup()
require("fzf-lua").setup()
require("nvim-autopairs").setup()
require("conform").setup({
	formatters_by_ft = {
		html = { "prettier" },
		css = { "prettier" },
		javascript = { "prettier" },
		rust = { "rustfmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- colorscheme
vim.cmd("colorscheme token")

-- remaps
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n" }, "<leader>f", ":FzfLua files<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
  end,
})

-- auto commands
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	callback = function()
-- 		vim.lsp.buf.format()
-- 	end,
-- })
