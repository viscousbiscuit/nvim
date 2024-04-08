local telescope = require('telescope.builtin')
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local actions = require "telescope.actions"
local conf = require("telescope.config").values
local action_state = require 'telescope.actions.state'

local workspace = '~/scratch';

local langs = {
    go = {
        name = "go",
        ext = "go",
    },
    javascript = {
        name = "javascript",
        ext = "js",
        execute = "w !node"
    },
    json = {
        name = "json",
        ext = "json",
    },
    php = {
        name = "php",
        ext = "php",
    },
    typescript = {
        name = "typescript",
        ext = "ts",
    },
}
local displayLangs = {}
for _, lang in pairs(langs) do
    table.insert(displayLangs, lang.name)
end


local split = function(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

local findLang = function(ext)
    if ext == nil then
        return nil
    end
    for lang, l in pairs(langs) do
        if l.ext == ext then
            return langs[lang]
        end
    end
    return nil
end

local checkDir = function(path)
    os.execute("mkdir " .. "~/scratch")
    os.execute("mkdir " .. path)
end

local setFilename = function(matchedLang, fileName)
    local path = string.format("%s/%s/",
        workspace,
        matchedLang.ext)
    local file = string.format("%s.%s",
        fileName,
        matchedLang.ext)
    checkDir(path)
    vim.cmd(string.format(":edit %s", path .. file))
end

local scratch = function()
    pickers.new({
        theme = "dropdown",
    }, {
        prompt_title = "New Buffer",
        finder = finders.new_table {
            results = displayLangs,
        },
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local inputTxt = action_state.get_current_line()
                if selection == nil then
                    vim.cmd(":enew")
                    local filenameParts = split(inputTxt, ".")
                    if #filenameParts > 1 then
                        local matchedLang = findLang(filenameParts[#filenameParts])
                        if matchedLang ~= nil then
                            setFilename(matchedLang, filenameParts[1])
                            vim.cmd(string.format(":setf %s", matchedLang.name))
                        end
                    else
                        vim.cmd(string.format(":edit %s", inputTxt))
                    end
                else
                    vim.cmd(":enew")
                    local matchedLang = langs[selection.value]
                    setFilename(matchedLang,
                        string.format("%s_%s_%s", matchedLang.ext, "scratch", os.date("%Y_%m_%d_%H%M%S")))
                    vim.cmd(string.format(":setf %s", matchedLang.name))
                end
            end)
            return true
        end,
        sorter = conf.generic_sorter({}),
    }):find()
end

local executeScript = function()
    local filename = vim.api.nvim_buf_get_name(0)
    local filenameParts = split(filename, ".")
    if #filenameParts > 1 then
        local matchedLang = findLang(filenameParts[#filenameParts])
        if matchedLang ~= nil then
            if matchedLang.execute ~= nil then
                vim.cmd(matchedLang.execute)
            end
        end
    end
end

local findFiles = function()
    telescope.find_files({ cwd = "~/scratch" });
end


return {
    scratch = scratch,
    executeScript = executeScript,
    findFiles = findFiles,

}
