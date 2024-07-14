-- TODO: Have to fix all three functions to work properly
return {
  vim.keymap.set("n", "<leader>oi",
    function()
      local file_path = "/home/squidmilk/Documents/Braincage/! Inbox/" ..
          vim.fn.input("Enter a note name: ", "", "file") .. ".md"
      if vim.fn.empty(vim.fn.glob(file_path)) > 0 then
        vim.cmd("silent! !touch " .. vim.fn.fnameescape(file_path))
      end
      vim.cmd("edit " .. file_path)
      vim.api.nvim_command('cd %:p:h')
      vim.cmd("ObsidianTemplate Fleeting Notes Template")
      -- vim.cmd("write" .. vim.fn.fnameescape(file_path))
    end
    , { desc = "Add [I]nbox Note" }),
  vim.keymap.set("n", "<leader>ol",
    function()
      local file_path = "/home/squidmilk/Documents/Braincage/001 Literature Notes/" ..
          vim.fn.input("Enter a note name: ", "", "file") .. ".md"
      if vim.fn.empty(vim.fn.glob(file_path)) > 0 then
        vim.cmd("silent! !touch " .. vim.fn.fnameescape(file_path))
      end
      vim.cmd("edit " .. vim.fn.fnameescape(file_path))
      vim.api.nvim_set_current_dir('/home/squidmilk/Documents/Braincage/')
      vim.cmd("ObsidianTemplate Literature Notes Template")
    end
    , { desc = "Add [L]iterature Note" }),
  vim.keymap.set("n", "<leader>op",
    function()
      local file_path = "/home/squidmilk/Documents/Braincage/002 Permanent Notes/" ..
          vim.fn.input("Enter a note name: ", "", "file") .. ".md"
      if vim.fn.empty(vim.fn.glob(file_path)) > 0 then
        vim.cmd("silent! !touch " .. vim.fn.fnameescape(file_path))
      end
      vim.cmd("edit " .. vim.fn.fnameescape(file_path))
      vim.api.nvim_set_current_dir('/home/squidmilk/Documents/Braincage/')
      vim.cmd("ObsidianTemplate Permanent Notes Template")
    end
    , { desc = "Add [P]ermanent Note" }),
  vim.keymap.set("n", "<leader>ot",
    function()
      vim.cmd("ObsidianTemplate")
    end
    , { desc = "Select [T]emplate" }),
  -- vim.keymap.set("n", "<leader>ot", function()
  --   local file_path = "/home/squidmilk/Documents/Braincage/003 Daily Notes/" .. os.date("%Y-%m-%d")
  --
  --   local dir_path = vim.fn.fnamemodify(file_path, ":h")
  --   if vim.fn.empty(vim.fn.glob(dir_path)) > 0 then
  --     vim.fn.mkdir(dir_path, "p")
  --   end
  --   if vim.fn.empty(vim.fn.glob(file_path)) > 0 then
  --     local file = io.open(file_path, "w")
  --     if file then
  --       file:close()
  --     end
  --   end
  --
  --   local task = "- [ ] #task " .. vim.fn.input("Enter a task: ", "", "file")
  --   local heading = "## Tasks"
  --   local new_lines = {}
  --   local lines = vim.fn.readfile(file_path)
  --   for i, line in ipairs(lines) do
  --     table.insert(new_lines, line)
  --     if line:match("^#%s*" .. heading) then
  --       local j = i + 1
  --       while j <= #lines and not lines[j]:match("^%s*$") do
  --         table.insert(new_lines, lines[j])
  --         j = j + 1
  --       end
  --       table.insert(new_lines, task)
  --       i = j
  --     end
  --   end
  --   vim.fn.writefile(new_lines, "file_path")
  -- end, { desc = "Add [T]ask" }),
  --
  -- vim.keymap.set("n", "<leader>oo", function()
  --   vim.cmd("cd $HOME/Documents/Braincage/ | Telescope find_files")
  --   -- local success = vim.loop.chdir("/home/squidmilk/Documents/Braincage/")
  --   -- if not success then
  --   --   vim.notify("Unable to go to Obsidian Vault", vim.log.levels.ERROR)
  --   -- else
  --   --   vim.notify("Changed to Obsidian Vault", vim.log.levels.INFO)
  --   -- end
  -- end, { desc = "[O]pen Vault" }),
}
