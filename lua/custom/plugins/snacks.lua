return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    { '<leader>sn', '<cmd>lua require("snacks").open()<cr>', desc = '[S]nacks' },
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = '[G]it [B]rowse',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = '[G]it [B]lame Line',
    },
    {
      '<leader>gf',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'Lazy[G]it Current [F]ile History',
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazy[G]it',
    },
    {
      '<leader>tt',
      function()
        Snacks.terminal()
      end,
      desc = '[T]erminal',
    },
  },
  opts = {
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = { enabled = true },
  },
}
