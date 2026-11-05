return {
	"saghen/blink.cmp",
	opts = {
		keymap = {
			preset = "none", -- Отменяем дефолтную схему LazyVim, где Enter подтверждает выбор

			-- Переназначаем клавиши вручную:
			["<CR>"] = { "fallback" }, -- Enter теперь просто переносит строку

			-- Tab теперь подтверждает выбор или забирает серый текст (ghost text)
			["<Tab>"] = { "select_and_accept", "fallback" },

			-- Оставляем стандартную навигацию по меню
			["<Down>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
		},
	},
}
