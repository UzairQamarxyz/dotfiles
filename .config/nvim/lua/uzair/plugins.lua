local status, packer = pcall(require, "packer")

if not status then
    print("Packer is not installed")
    return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])

return require('packer').startup(function(use)

    -- Packer
    use("wbthomason/packer.nvim")

    -- TreeSitter
    use {'nvim-treesitter/nvim-treesitter'}

    -- nvim-surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- LuaLine
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Ayu
    use({"Shatur/neovim-ayu"})

    -- colorizer
    use ({'NvChad/nvim-colorizer.lua'})

    -- whichkey
    use ({'folke/which-key.nvim'})

    if packer_bootstrap then
        packer.sync()
    end
end)
