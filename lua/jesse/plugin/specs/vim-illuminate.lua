return {
  "RRethy/vim-illuminate",
  config = function()
    require('illuminate').configure({
      delay = 1000
    })
  end
}
