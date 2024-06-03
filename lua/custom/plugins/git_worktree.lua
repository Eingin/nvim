return {
  {
    'ThePrimeagen/git-worktree.nvim',
    config = function()
      local Job = require 'plenary.job'
      local Worktree = require 'git-worktree'
      local fidget = require 'fidget'

      Worktree.setup {
        update_on_change_command = ':Neotree position=current',
      }

      require('telescope').load_extension 'git_worktree'

      Worktree.on_tree_change(function(op, metadata)
        -- Open telescope git file finer
        local builtin = require 'telescope.builtin'
        builtin.git_files()

        -- TODO: If we open up a worktree that has a package.json file, install the dependencies with pnpm
        -- if op == Worktree.Operations.Create and vim.fn.filereadable(metadata.path .. 'pnpm-lock.yaml') then
        --   local job_progress = fidget.progress.handle.create {
        --     title = 'Installing dependencies',
        --     lsp_client = { name = 'worktree' },
        --   }
        --   local run_yarn = Job:new {
        --     command = 'pnpm install',
        --     cwd = metadata.path,
        --     on_stdout = function(_, data, _)
        --       job_progress.message = data
        --     end,
        --   }
        --   run_yarn:start()
        --   run_yarn:after(function()
        --     job_progress:finish()
        --     vim.cmd 'LspRestart'
        --   end)
        -- end
      end)
    end,
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      'j-hui/fidget.nvim',
    },
    --stylua: ignore
    keys = {
      {"<leader>gwm", function() require("telescope").extensions.git_worktree.git_worktrees() end, desc = "[G]it [W]orktree [M]anage"},
      {"<leader>gwc", function() require("telescope").extensions.git_worktree.create_git_worktree() end, desc = "[G]it [W]orktree [C]reate"},
    },
  },
}
