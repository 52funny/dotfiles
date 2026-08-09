return {
  'NMAC427/guess-indent.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    filetype_exclude = {
      'tex',
    },
  },
}
