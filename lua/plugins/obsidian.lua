return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Braincage",
        path = "/home/squidmilk/Documents/Braincage",
      },
    },
    templates = {
      folder = "007 Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
    daily_notes = {
      folder = "003 Daily Notes",
      template = "Daily Notes Template"
    },
    notes_subdir = "! Inbox",
    new_notes_location = "notes_subdir",
  },
  -- TODO: configure obsidian
}
