local colorscheme = "srcerite"

if colorscheme ~= "none" then
    local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
    if colorscheme == "catppuccin" then
        vim.g.catppuccin_flavour = "latte"
    end
    if not status_ok then
        vim.notify("colorscheme '" .. colorscheme .. "' not detected!")
      return
    end
end
