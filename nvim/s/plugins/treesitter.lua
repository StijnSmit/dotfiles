return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
	    -- List of parsers to install or use "all"
	require("nvim-treesitter.configs").setup({
	      ensure_installed = {
		"lua", "python", "javascript", "typescript", "html", "css", "json", "bash", "markdown",
		"markdown_inline", "c", "cpp", "java", "go", "rust", "yaml"
	      },
      -- Install parsers asynchronously
      sync_install = false,
      auto_install = true,  -- Automatically install missing parsers when entering buffer
      highlight = {
        enable = true,       -- Enable syntax highlighting
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,       -- Enable Treesitter-based indentation
      },
      -- Autotagging (useful for HTML and XML-like languages)
      autotag = {
        enable = true,
      },
      -- Enable rainbow parentheses
      rainbow = {
        enable = true,
        extended_mode = true,  -- Highlight also non-bracket delimiters
        max_file_lines = 1000, -- Do not enable for files with more than 1000 lines
      },
      -- Enable incremental selection (useful for expanding and contracting selections)
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      -- Text objects (useful for selecting and operating on code blocks, functions, etc.)
      textobjects = {
        select = {
          enable = true,
          lookahead = true,  -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,  -- Whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
        },
      },

	})
    end
}
