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
      -- Grab the source of the file
      local current_file = vim.fn.expand('%:p')
      -- Define the directory the file is to be placed in
      local dest_direcotry = "/home/squidmilk/Documents/Braincage/001 Literature Notes"
      -- Check if the directory exists
      if vim.fn.isdirectory(dest_direcotry) == 0 then
        vim.api.nvim_err_writeln(dest_direcotry .. " does not exist.")
        return
      end
      -- Get just the file name
      local filename = vim.fn.expand('%:t')
      -- Construct the new file path
      local new_file = dest_direcotry .. '/' .. filename
      local success = os.rename(current_file, new_file)
      if success then
        print("Note successfully moved to " .. new_file)
      else
        vim.api.nvim_err_writeln("Failed to move literature note.")
        return
      end

      -- Remove the file from the quickfix list
      vim.cmd("Trouble qflist toggle")
      local qf_list = vim.fn.getqflist()
      local current_bufnr = vim.fn.bufnr('%')
      local new_qf_list = {}
      for _, item in ipairs(qf_list) do
        if item.bufnr ~= current_bufnr then
          table.insert(new_qf_list, item)
        end
      end
      vim.fn.setqflist(new_qf_list)
      vim.cmd("Trouble qflist toggle")

      -- Close the current buffer
      vim.cmd('bdelete')
      -- Go to the next item in the quickfix list
      vim.cmd('cnext')
      -- If the end of the quickfix list has been hit, wrap to the first item in the list
      if vim.v.exception:match('E553') then
        vim.cmd('cfirst')
      end
    end
    -- function()
    --   local file_path = "/home/squidmilk/Documents/Braincage/001 Literature Notes/" ..
    --       vim.fn.input("Enter a note name: ", "", "file") .. ".md"
    --   if vim.fn.empty(vim.fn.glob(file_path)) > 0 then
    --     vim.cmd("silent! !touch " .. vim.fn.fnameescape(file_path))
    --   end
    --   vim.cmd("edit " .. vim.fn.fnameescape(file_path))
    --   vim.api.nvim_set_current_dir('/home/squidmilk/Documents/Braincage/')
    --   vim.cmd("ObsidianTemplate Literature Notes Template")
    -- end
    , { desc = "Move [L]iterature Note" }),
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
  vim.keymap.set("n", "<leader>oo", function()
    vim.cmd("cd $HOME/Documents/Braincage/ | Telescope find_files")
    -- local success = vim.loop.chdir("/home/squidmilk/Documents/Braincage/")
    -- if not success then
    --   vim.notify("Unable to go to Obsidian Vault", vim.log.levels.ERROR)
    -- else
    --   vim.notify("Changed to Obsidian Vault", vim.log.levels.INFO)
    -- end
  end, { desc = "[O]pen Vault" }),
  vim.keymap.set("n", "<leader>oq", function()
    local curr_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h')
    local target_dir = vim.fn.fnamemodify("/home/squidmilk/Documents/Braincage/", ':p:h')
    if curr_dir ~= target_dir then
      vim.fn.chdir(target_dir)
    end
    vim.cmd("ObsidianQuickSwitch")
  end, { desc = "[Q]uick Switcher" }),
}
