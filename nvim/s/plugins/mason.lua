-- return {
-- 
-- 	"williamboman/mason.nvim",
-- 	lazy = false,
-- 	config = function()
-- 		require("mason.nvim.configs").setup();
-- 	end
-- }
return {
	-- Mason: For managing LSP servers, DAPs, linters and formatters
	{ 
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
					    package_installed = "✓",
					    package_pending = "➜",
					    package_uninstalled = "✗"
					}
				}
			})
		end,
	},
	-- Mason-lspconfig: Bridges Mason with nvim-lspconfig
	{ 
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "rust_analyzer" },
			})
		end,
	},
	-- LSPConfig: Native LSP configurations for Neovim
	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local lspconfig = require("lspconfig")

			-- Example setup for lua_ls (Lua Language Server)
			lspconfig.lua_ls.setup({
			settings = {
			  Lua = {
			    diagnostics = {
			      globals = { "vim" }, -- Prevent warnings for 'vim'
			    },
			    workspace = {
			      library = vim.api.nvim_get_runtime_file("", true),
			      checkThirdParty = false,
			    },
			    telemetry = { enable = false },
			  },
			},
			})

			-- Example setup for pyright (Python)
			lspconfig.pyright.setup({})

			-- Example setup for rust_analzyer (Rust)
			lspconfig.rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true, -- Enables all features in your Rust project
						},
						checkOnSave = {
							command = "clippy", -- Run Clippy for linting on save
						},
					}
				}
			})

			end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
}
