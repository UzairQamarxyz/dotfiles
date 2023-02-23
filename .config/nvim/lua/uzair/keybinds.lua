local g = vim.g
local o = vim.o
local opt = vim.opt

-- Keybindings
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map("n", "j", "gj")
map("n", "k", "gk")
map("n", "S", ":%s///g<Left><Left><Left>")
