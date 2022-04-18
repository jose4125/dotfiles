require("filetype").setup({
    overrides = {
        complex = {
            -- Set the filetype of any full filename matching the regex to gitconfig
            ["[Dd]ockerfile"] = "Dockerfile", -- Included in the plugin
            ["[Dd]ockerfile*"] = "Dockerfile", -- Included in the plugin
            ["*.[Dd]ockerfile"] = "Dockerfile", -- Included in the plugin
            ["*.dock"] = "Dockerfile", -- Included in the plugin
            ["[Dd]ockerfile.vim"] = "vim", -- Included in the plugin
            -- Containerfile
            ["[Cc]ontainerfile"] = "Dockerfile", -- Included in the plugin
            ["[Cc]ontainerfile*"] = "Dockerfile", -- Included in the plugin
            ["*.[Cc]ontainerfile"] = "Dockerfile", -- Included in the plugin
        },
    },
})
