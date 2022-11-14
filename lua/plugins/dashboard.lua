local if_nil = vim.F.if_nil

local ascii = {
"                                                                                          ",
"            _///     _//_////////    _////     _//         _//_//_//       _//            ",
"            _/ _//   _//_//        _//    _//   _//       _// _//_/ _//   _///            ",
"            _// _//  _//_//      _//        _//  _//     _//  _//_// _// _ _//            ",
" \\    /\\    _//  _// _//_//////  _//        _//   _//   _//   _//_//  _//  _//            ",
"  )  ( ')   _//   _/ _//_//      _//        _//    _// _//    _//_//   _/  _//            ",
" (  /  )    _//    _/ //_//        _//     _//      _////     _//_//       _//            ",
"  \\(__)|    _//      _//_////////    _////           _//      _//_//       _//            "
}

local ascii1 = {
"               _   _   U _____ u U  ___ u__     __             __  __               ",
"              | \\ |\"|  \\| ___\"|/  \\/\"_ \\/\\ \\   /\"/u  ___     U|' \\/ '|u             ",
"             <|  \\| |>  |  _|\"    | | | | \\ \\ / //  |_\"_|    \\| |\\/| |/             ",
"\\    /\\ᵐᵉᵒʷ  U| |\\  |u  | |___.-,_| |_| | /\\ V /_,-. | |      | |  | |              ",
" )  ( ')      |_| \\_|   |_____|\\_)-\\___/ U  \\_/-(_/U/| |\\u    |_|  |_|              ",
"(  /  )       ||   \\\\,-.<<   >>     \\\\     //   .-,_|___|_,-.<<,-,,-.               ",
" \\(__)|       (_\")  (_/(__) (__)   (__)   (__)   \\_)-' '-(_/  (./  \\.)              "
}

local default_header = {
    type = "text",
    val = ascii1,
    opts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow";
    },
}

local footer = {
    type = "text",
    val = "",
    opts = {
        position = "center",
        hl = "Number",
    },
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
        -- local key = vim.api.nvim_replace_termcodes(keybind .. "<Ignore>", true, false, true)
        local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("n", "  New file", "<cmd>ene <CR>"),
        button("f", "  Find file", "<cmd>:Telescope find_files<CR>"),
        button("r", "  Recently opened files", "<cmd>:Telescope oldfiles<CR>"),
        button("i", "  Frecency/MRU", "<cmd>:Telescope frecency<CR>"),
        button("w", "  Find word", "<cmd>:Telescope grep_string<CR>"),
        button("b", "  Bookmarks", "<cmd>:Telescope bookmarks<CR>"),
        button("q", "  Quit"),
    },
    opts = {
        spacing = 1,
    },
}




local group = vim.api.nvim_create_augroup("CleanDashboard", {})

vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "AlphaReady",
  callback = function()
    -- vim.opt.showtabline = 0
    vim.opt.showmode = false
    vim.opt.laststatus = 0
    vim.opt.showcmd = false
    vim.opt.ruler = false
    vim.wo.fillchars = 'eob: ' 
  end,
})

vim.api.nvim_create_autocmd("BufUnload", {
  group = group,
  pattern = "<buffer>",
  callback = function()
    -- vim.opt.showtabline = 2
    vim.opt.showmode = true
    vim.opt.laststatus = 3
    vim.opt.showcmd = true
    vim.opt.ruler = true
  end,
})




local section = {
    header = default_header,
    buttons = buttons,
    footer = footer,
}

local config = {
    layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        section.footer,
    },
    opts = {
        margin = 5,
    },
}

return {
    button = button,
    section = section,
    config = config,
    -- theme config
    leader = leader,
    -- deprecated
    opts = config,
}
