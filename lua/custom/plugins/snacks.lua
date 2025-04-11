return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    {
      '<leader><space>',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Smart Find Files',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
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
    {
      '<leader>sf',
      function()
        Snacks.picker.git_files()
      end,
      desc = '[T]erminal',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = '[T]erminal',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = '[T]erminal',
    },
  },
  opts = {
    bigfile = { enabled = true },
    lazygit = {
      enabled = true,
      config = {
        gui = {
          spinner = {
            frames = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
            rate = 100,
          },
        },
      },
    },
    dashboard = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = { enabled = true },
  },
}
