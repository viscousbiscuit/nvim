return {
 'nvimdev/dashboard-nvim', 
 lazy = false,
    opts = {
     theme = 'hyper',
     config = {
       week_header = {
        enable = true,
       },
       shortcut = {
         { desc = '󰊳 Update', group = '@property', action = 'PackerUpdate', key = 'u' },
         {
           icon = ' ',
           icon_hl = '@variable',
           desc = 'Files',
           group = 'Label',
           action = 'Telescope find_files',
           key = 'f',
         },
         {
           desc = ' Apps',
           group = 'DiagnosticHint',
           action = 'Telescope app',
           key = 'a',
         },
         {
           desc = ' Marks',
           group = 'Number',
           action = 'Telescope marks',
           key = 'm',
         },
       },
       footer = {}
     },
   }

}
