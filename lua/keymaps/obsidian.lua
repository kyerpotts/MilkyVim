-- TODO: Have to fix all three functions to work properly
local function new_note()
  local file_path = "/home/squidmilk/Documents/Braincage/! Inbox/" ..
      vim.fn.input("Enter a note name: ", "", "file") .. ".md"
  if vim.fn.empty(vim.fn.glob(file_path)) > 0 then
    vim.cmd("silent! !touch " .. vim.fn.fnameescape(file_path))
  end
  vim.cmd("edit " .. file_path)
  vim.api.nvim_command('cd %:p:h')
  vim.cmd("ObsidianTemplate Fleeting Notes Template")
end

local function delete_note()
  local current_file = vim.fn.expand('%:p')
  local current_dir = vim.fn.expand('%:p:h')

  -- Prompt for confirmation
  local confirm = vim.fn.input("Are you sure you want to delete " .. current_file .. "? (y/n): ")
  if confirm:lower() ~= 'y' then
    print("File deletion cancelled.")
    return
  end

  -- Close the buffer

  -- Delete the file
  local success, err = os.remove(current_file)
  if not success then
    print("Error deleting file: " .. (err or "Unknown error"))
    return
  end
  print("File deleted: " .. current_file)

  if #vim.fn.getqflist() > 0 then
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
    vim.cmd('bdelete!')
    vim.fn.setqflist(new_qf_list)
    vim.cmd("Trouble qflist toggle")
  end
end

local function send_note(directory)
  -- Grab the source of the file
  local current_file = vim.fn.expand('%:p')
  -- Define the directory the file is to be placed in
  local dest_direcotry = directory
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
    vim.api.nvim_err_writeln("Failed to move note to " .. directory)
    return
  end

  if #vim.fn.getqflist() > 0 then
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
end

return {
  vim.keymap.set("n", "<leader>oi",
    new_note
    , { desc = "Add [I]nbox Note" }),
  vim.keymap.set("n", "<leader>od",
    delete_note
    , { desc = "[D]elete Note" }),
  vim.keymap.set("n", "<leader>ol",
    function()
      send_note("/home/squidmilk/Documents/Braincage/001 Literature Notes")
    end
    , { desc = "Move [L]iterature Note" }),
  vim.keymap.set("n", "<leader>op",
    function()
      send_note("/home/squidmilk/Documents/Braincage/002 Permanent Notes")
    end
    , { desc = "Move [P]ermanent Note" }),
  vim.keymap.set("n", "<leader>ot",
    function()
      vim.cmd("ObsidianTemplate")
    end
    , { desc = "Select [T]emplate" }),
  vim.keymap.set("n", "<leader>oo", function()
    vim.cmd("cd $HOME/Documents/Braincage/ | Telescope find_files")
  end, { desc = "[O]pen Vault" }),
  vim.keymap.set("n", "<leader>oq", function()
    local curr_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h')
    local target_dir = vim.fn.fnamemodify("/home/squidmilk/Documents/Braincage/", ':p:h')
    if curr_dir ~= target_dir then
      vim.api.nvim_err_writeln("Not in obsidian vault.")
      return
    end
    vim.cmd("ObsidianQuickSwitch")
  end, { desc = "[Q]uick Switcher" }),
  vim.keymap.set("x", "<leader>oe", ':ObsidianExtractNote<cr>', { desc = "[E]xtract Note" }),
}
