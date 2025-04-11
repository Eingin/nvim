local function git_branch()
  local pipe = io.popen 'git branch --show-current'
  if pipe then
    local c = pipe:read('*l'):match '^%s*(.-)%s*$'
    pipe:close()
    return c
  end
  return 'default list'
end

return {
  'ThePrimeagen/harpoon',
  lazy = false,
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list(git_branch()):add()
    end, { desc = '[A]dd harpoon' })

    vim.keymap.set('n', '<leader>dh', function()
      harpoon:list(git_branch()):remove()
    end, { desc = '[D]elete [H]arpoon' })

    -- vim.keymap.set('n', '<C-e>', function()
    --   harpoon.ui:toggle_quick_menu(harpoon:list(git_branch()))
    -- end)

    vim.keymap.set('n', '<leader>1', function()
      harpoon:list(git_branch()):select(1)
    end, { desc = '[1]st harpoon' })

    vim.keymap.set('n', '<leader>2', function()
      harpoon:list(git_branch()):select(2)
    end, { desc = '[2]nd harpoon' })

    vim.keymap.set('n', '<leader>3', function()
      harpoon:list(git_branch()):select(3)
    end, { desc = '[3]rd harpoon' })

    vim.keymap.set('n', '<leader>4', function()
      harpoon:list(git_branch()):select(4)
    end, { desc = '[4]th harpoon' })

    vim.keymap.set('n', '<leader>5', function()
      harpoon:list(git_branch()):select(5)
    end, { desc = '[5]th harpoon' })

    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list(git_branch()):prev()
    end)
    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list(git_branch()):next()
    end)

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<C-e>', function()
      toggle_telescope(harpoon:list(git_branch()))
    end, { desc = 'Open harpoon window' })
  end,
}
