return {
    'github/copilot.vim',
    lazy = false,
    setup = function()
        vim.keymap.set('i', '<M-l>', 'copilot#Accept()');
    end
}
