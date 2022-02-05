vim.notify = require "notify"

vim.cmd [[ 
  highlight NotifyERRORBorder guifg=#E28C8C
  highlight NotifyWARNBorder guifg=#E28C8C
  highlight NotifyINFOBorder guifg=#B3E1A3
  highlight NotifyDEBUGBorder guifg=#EADDA0
  highlight NotifyTRACEBorder guifg=#EADDA0
  highlight NotifyERRORIcon guifg=#E28C8C
  highlight NotifyWARNIcon guifg=#E28C8C
  highlight NotifyINFOIcon guifg=#B3E1A3
  highlight NotifyDEBUGIcon guifg=#EADDA0
  highlight NotifyTRACEIcon guifg=#EADDA0
  highlight NotifyERRORTitle  guifg=#E28C8C
  highlight NotifyWARNTitle guifg=#E28C8C
  highlight NotifyINFOTitle guifg=#B3E1A3
  highlight NotifyDEBUGTitle  guifg=#EADDA0
  highlight NotifyTRACETitle  guifg=#EADDA0
  highlight link NotifyERRORBody Normal
  highlight link NotifyWARNBody Normal
  highlight link NotifyINFOBody Normal
  highlight link NotifyDEBUGBody Normal
  highlight link NotifyTRACEBody Normal
]]
