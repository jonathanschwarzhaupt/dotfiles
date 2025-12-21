return {
	-- Disable specific snacks.nvim features instead of old plugins
	-- snacks.nvim replaced mini.pairs, noice.nvim, and nvim-notify
	{
		"folke/snacks.nvim",
		opts = {
			-- Keep the features you want, disable what you don't
			notifier = { enabled = false }, -- Replaces nvim-notify & noice notifications
			indent = { enabled = true }, -- Indent guides (you probably want this)
		},
	},
}
