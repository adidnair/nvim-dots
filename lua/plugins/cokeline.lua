local get_hex = require('cokeline/utils').get_hex
local yellow = vim.g.terminal_color_3
local space = {text = " "}

local X = {}

local config = {
    mappings = {
              cycle_prev_next = true,
            },

    default_hl = {
        fg = function(buffer)
            return
                buffer.is_focused and nil or get_hex("Comment", "fg")
        end,
        bg = "none",
    },

	sidebar = {
		filetype = 'CHADTree',
		components = {
			{
				text = '  CHADTree',
				fg = yellow,
				bg = get_hex('CHADTreeNormal', 'bg'),
				style = 'bold',
			},
		}
	},

    components = {
                space,
                {
                    text = function(buffer)
                        return buffer.devicon.icon
                    end,
                    fg = function(buffer)
                        return buffer.devicon.color
                    end
                },
                {
                    text = function(buffer)
                        return buffer.filename
                    end,
                    fg = function(buffer)
                        if buffer.is_focused then
                            return "#78dce8"
                        end
                        if buffer.is_modified then
                            return "#e5c463"
                        end
                        -- if buffer.lsp.errors ~= 0 then
                        --     return "#fc5d7c"
                        -- end
                    end,
                    style = function(buffer)
                        if buffer.is_focused then
                            return "underline"
                        end
                        return nil
                    end
                },
                {
                    text = function(buffer)
                        if buffer.is_readonly then
                            return " 🔒"
                        end
                        return ""
                    end
                },
                space
            }

}

function X.getConfig()
    return config
end

return X
