M = {}

M.config = {
    size = 20,
    open_mapping = [[<c-\>]],
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
    float_opts = {
		border = "curved",
	},
    highlights = {
        FloatBorder = {
            guifg = "#6e6a86"
        },
    },
}

return M
