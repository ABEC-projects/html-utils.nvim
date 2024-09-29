local M = {}

function M.tag_under_cursor()
    local tag = vim.fn.expand("<cword>")
    vim.cmd("normal ciw<"..tag.."></"..tag..">")
end

function M.tag_under_cursor_newline()
    local tag = vim.fn.expand("<cword>")
    vim.cmd("normal ciw<"..tag.."></"..tag..">")
    vim.cmd("normal bba")
    vim.cmd("normal ko")
end

function M.setup(opts)
    local tucn_map = opts.tag_newline or "<c-T>"
    local tuc_map = opts.tag or "<c-t>"
    vim.keymap.set("i", tucn_map, M.tag_under_cursor_newline, {})
    vim.keymap.set("i", tuc_map, M.tag_under_cursor_newline, {})
end

return M
