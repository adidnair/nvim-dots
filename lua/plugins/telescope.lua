require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-d>'] = require('telescope.actions').delete_buffer
            },
            n = {
                ['<C-d>'] = require('telescope.actions').delete_buffer
            },
        },
    },
    extensions = {
        bookmarks = {
            -- Available: 'brave', 'buku', 'chrome', 'chrome_beta', 'edge', 'safari', 'firefox', 'vivaldi'
            selected_browser = 'firefox',

            -- Either provide a shell command to open the URL
            url_open_command = 'open',

            -- Or provide the plugin name which is already installed
            -- Available: 'vim_external', 'open_browser'
            url_open_plugin = nil,

            -- Show the full path to the bookmark instead of just the bookmark name
            full_path = true,

            -- Provide a custom profile name for Firefox
            firefox_profile_name = nil,
        },
    }
}
