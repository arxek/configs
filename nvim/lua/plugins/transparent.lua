return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1500, -- Загружается сразу после темы
    opts = {
      -- Перечисляем группы, которые должны быть прозрачными
      extra_groups = {
        "NormalFloat", -- Плавающие окна
        "TabLineSel",   -- Активные вкладки
        "NeoTreeNormal", -- Боковая панель Neo-tree
        "NeoTreeNormalNC",
      },
    },
  }
}

