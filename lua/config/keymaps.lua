local keymap = vim.keymap.set

-- Mejorar el movimiento con j y k
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Inicio y fin de linea con Shif + H/L
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- Escape usando kk
keymap("i", "kk", "<ESC>")
keymap("t", "kk", "<C-\\><C-n>")

-- Limpiar las búsquedas con ESC
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape desmarca las búsquedas" })

-- Mejorar el indentado
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Centrar las búsquedas (creo)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Scrolling
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Better escape using jk in insert and terminal mode
-- keymap("i", "jk", "<ESC>")
keymap("t", "<C-[>", "<C-\\><C-n>")
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Add undo break-points
keymap("i", ",", ",<c-g>u")
keymap("i", ".", ".<c-g>u")
keymap("i", ";", ";<c-g>u")

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dp')

-----------
-- Archivos
-----------

-- Guardar archivo
keymap("n", "<leader>fw", "<cmd>w<cr>", { desc = "Guardar archivo" })

-- Archivo nuevo
keymap("n", "<leader>fn", "<cmd>enew<cr>", { desc = "Nuevo archivo" })

-----------
-- Ventanas: Leader W
-----------
keymap("n", "<leader>ww", "<C-W>p", { desc = "Cambiar de ventana", remap = true })
keymap("n", "<leader>wd", "<C-W>c", { desc = "Cerrar ventana", remap = true })
keymap("n", "<leader>w-", "<C-W>s", { desc = "Abrir ventana abajo", remap = true })
keymap("n", "<leader>w|", "<C-W>v", { desc = "Abrir ventana a la derecha", remap = true })

-- Moverse entre ventanas usando Ctrl y hjkl
keymap("n", "<C-k>", "<C-w>k", { desc = "Saltar hacia arriba", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Saltar hacia abajo", remap = true })
keymap("n", "<C-h>", "<C-w>h", { desc = "Saltar a la izquierda", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Saltar a la derecha", remap = true })

-- Cambiar el tamaño de las ventanas usando CTRL y flechas
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Aumentar altura" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Disminuir altura" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Aumentar ancho" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Disminuir ancho" })

----------
-- Buffers: Leader B
----------
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Cambiar de buffer" })
keymap("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
keymap("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Buffer siguiente" })
keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Cerrar buffer" })



-- Salir de Neovim
keymap("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Salir de Neovim" })

-- Auto indent
keymap("n", "i", function()
  if #vim.fn.getline "." == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true })
