vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight when yanking text",
  group = vim.api.nvim_create_augroup("milky-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufWrite", {
  pattern = '*.md',
  callback = function()
    if vim.bo.filetype ~= "markdown" then
      vim.notify("Incorrect filetype")
      return
    end

    -- TODO: Update this to read the default obsidian vault that is enabled by the plugin
    -- Check if we're in an Obsidian vault
    -- local current_file = vim.fn.expand('%:p')
    -- local obsidian_workspace = vim.fn.expand(require("obsidian").workspace.get_workspace_for_dir)
    -- if obsidian_workspace == '' or not current_file:match('^' .. vim.fn.escape(obsidian_workspace, '%-%.%+%[%]%(%)%$%^')) then
    --   vim.notify("Incorrect filetype")
    --   return
    -- end

    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    local frontmatter_end = 0
    local in_frontmatter = false
    local has_title = false

    for i, line in ipairs(lines) do
      if line:match("^%-%-%-$") then
        if in_frontmatter then
          frontmatter_end = i
        else
          in_frontmatter = true
        end
      elseif line:match("^# ") then
        has_title = true
        break
      end
    end

    if not has_title then
      local filename = vim.fn.expand("%:t:r") -- filename without extension
      local title_line = "# " .. filename

      if frontmatter_end > 0 then
        vim.api.nvim_buf_set_lines(0, frontmatter_end, frontmatter_end, false, { "", title_line })
      else
        vim.api.nvim_buf_set_lines(0, 0, 0, false, { title_line, "" })
      end
    end
  end
})
