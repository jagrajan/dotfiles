local telescope = require('telescope')
local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')

telescope.setup {
  defaults = {
    file_sorter = sorters.get_fzy_sorter,
    prompt_prefix = '>',

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<c-x>"] = false,
        ["<c-q>"] = actions.send_to_qflist
      },
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

telescope.load_extension('fzy_native')

