local extensions = require('el.extensions')
local sections = require "el.sections"
local subscribe = require('el.subscribe')
-- local builtin = require('el.builtin')
local space= " "


local file = function(_, buffer)
  if buffer.name == "" then
    return "[No Name]"
  end

  return buffer.name
end

require('el').setup {
    generator = function(_window, buffer)
        local el_segments = {}

        table.insert(el_segments, space)

        table.insert(el_segments, extensions.mode)

        table.insert(el_segments, space)

        table.insert(el_segments, file(_window, buffer))
        --
        -- local file_namer = function(_window, buffer)
        --   return buffer.name
        -- end
        -- table.insert(el_segments, file_namer)

        table.insert(el_segments, {sections.split, required = true})

        table.insert(el_segments, space)

        table.insert(el_segments,
            subscribe.buf_autocmd(
                "el_file_icon",
                "BufRead",
                function()
                    return extensions.file_icon(_, buffer)
                end
            ))

        table.insert(el_segments, space)

        table.insert(el_segments, vim.bo.filetype)

        table.insert(el_segments, space)

        return el_segments
    end
}
