-- Heavily modified version of catppuccin's intgration.
-- Going to restructure this at some point, but it works
local b = vim.b

local assets = {
  left_flame = "'",
  right_flame = "",
}

local clrs = require "catppuccin.core.color_palette"

-- settings
local sett = {
  bkg = clrs.black3,
  diffs = clrs.mauve,
  extras = clrs.gray1,
  curr_file = clrs.maroon,
  curr_dir = clrs.flamingo,
}

local mode_colors = {
  ["n"] = { "NORMAL", clrs.lavender },
  ["no"] = { "N-PENDING", clrs.lavender },
  ["i"] = { "INSERT", clrs.green },
  ["ic"] = { "INSERT", clrs.green },
  ["t"] = { "TERMINAL", clrs.green },
  ["v"] = { "VISUAL", clrs.flamingo },
  ["V"] = { "V-LINE", clrs.flamingo },
  [""] = { "V-BLOCK", clrs.flamingo },
  ["R"] = { "REPLACE", clrs.maroon },
  ["Rv"] = { "V-REPLACE", clrs.maroon },
  ["s"] = { "SELECT", clrs.maroon },
  ["S"] = { "S-LINE", clrs.maroon },
  [""] = { "S-BLOCK", clrs.maroon },
  ["c"] = { "COMMAND", clrs.peach },
  ["cv"] = { "COMMAND", clrs.peach },
  ["ce"] = { "COMMAND", clrs.peach },
  ["r"] = { "PROMPT", clrs.teal },
  ["rm"] = { "MORE", clrs.teal },
  ["r?"] = { "CONFIRM", clrs.mauve },
  ["!"] = { "SHELL", clrs.green },
}

local shortline = false

-- Initialize the components table
local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {}) -- (1) left
table.insert(components.active, {}) -- (2) center
table.insert(components.active, {}) -- (3) right

table.insert(components.inactive, {}) -- (1) left
table.insert(components.inactive, {}) -- (2) center
table.insert(components.inactive, {}) -- (3) right
-- global components
local invi_sep = {
  str = " ",
  hl = {
    fg = sett.bkg,
    bg = sett.bkg,
  },
}

-- helpers
local function any_git_changes()
  local gst = b.gitsigns_status_dict -- git stats
  if gst then
    if
      gst["added"] and gst["added"] > 0
      or gst["removed"] and gst["removed"] > 0
      or gst["changed"] and gst["changed"] > 0
    then
      return true
    end
  end
  return false
end

-- #################### STATUSLINE ->

-- ######## Left

-- Current vi mode ------>
local vi_mode_hl = function()
  return {
    fg = sett.bkg,
    bg = mode_colors[vim.fn.mode()][2],
    style = "bold",
  }
end

local component_part_init_left_spacer_active = {
  provider = " ",
  hl = function()
    return {
      fg = mode_colors[vim.fn.mode()][2],
      bg = mode_colors[vim.fn.mode()][2],
    }
  end,
}
local component_part_init_left_spacer_inactive = {
  provider = " ",
  hl = function()
    return {
      fg = clrs.black2,
      bg = clrs.black2,
    }
  end,
}
components.active[1][1] = component_part_init_left_spacer_active
components.inactive[1][1] = component_part_init_left_spacer_inactive

local component_part_mode = {
  provider = "",
  hl = function()
    return {
      fg = sett.bkg,
      bg = mode_colors[vim.fn.mode()][2],
    }
  end,
}
components.active[1][2] = component_part_mode

local component_part_mode_text = {
  provider = function()
    return " " .. mode_colors[vim.fn.mode()][1] .. " "
  end,
  hl = vi_mode_hl,
}
components.active[1][3] = component_part_mode_text

-- enable if git diffs are not available
local mode_part_flame_divider = {
  provider = assets.right_flame,
  hl = function()
    return {
      fg = mode_colors[vim.fn.mode()][2],
      bg = sett.bkg,
    }
  end,
  enabled = function()
    return not any_git_changes()
  end,
}
components.active[1][4] = mode_part_flame_divider

-- enable if git diffs are available
local mode_part_flame_diff_divider = {
  provider = assets.right_flame,
  hl = function()
    return {
      fg = mode_colors[vim.fn.mode()][2],
      bg = sett.diffs,
    }
  end,
  enabled = function()
    return any_git_changes()
  end,
}
components.active[1][5] = mode_part_flame_diff_divider
-- Current vi mode ------>

-- Diffs ------>
local component_part_diff_added = {
  provider = "git_diff_added",
  hl = {
    fg = sett.bkg,
    bg = sett.diffs,
  },
  icon = "  ",
}
components.active[1][6] = component_part_diff_added

local component_part_diff_changed = {
  provider = "git_diff_changed",
  hl = {
    fg = sett.bkg,
    bg = sett.diffs,
  },
  icon = "  ",
}
components.active[1][7] = component_part_diff_changed

local component_part_diff_removed = {
  provider = "git_diff_removed",
  hl = {
    fg = sett.bkg,
    bg = sett.diffs,
  },
  icon = "  ",
  right_sep = {
    str = " ",
    hl = {
      fg = sett.bkg,
      bg = sett.diffs,
    },
  },
}
components.active[1][8] = component_part_diff_removed

local diff_part_flame_divider = {
  provider = assets.right_flame,
  hl = {
    fg = sett.diffs,
    bg = sett.bkg,
  },
  enabled = function()
    return any_git_changes()
  end,
}
components.active[1][9] = diff_part_flame_divider
-- Diffs ------>

-- Extras ------>

-- file progess
components.active[1][10] = {
  provider = function()
    local current_line = vim.fn.line "."
    local total_line = vim.fn.line "$"

    if current_line == 1 then
      return " Top "
    elseif current_line == vim.fn.line "$" then
      return " Bot "
    end
    local result, _ = math.modf((current_line / total_line) * 100)
    return " " .. result .. "%% "
  end,
  hl = {
    fg = sett.extras,
    bg = sett.bkg,
  },
  left_sep = invi_sep,
}

-- position
components.active[1][11] = {
  provider = "position",
  hl = {
    fg = sett.extras,
    bg = sett.bkg,
  },
  left_sep = invi_sep,
}
-- Extras ------>

-- ######## Left

-- ######## Right
local component_git_branch = {
  provider = "git_branch",
  enabled = shortline or function()
    return vim.api.nvim_win_get_width(0) > 70
  end,
  hl = {
    fg = sett.extras,
    bg = sett.bkg,
  },
  icon = "  ",
  left_sep = invi_sep,
  right_sep = invi_sep,
}
components.active[3][1] = component_git_branch

local component_current_file = {
  provider = function()
    local filename = vim.fn.expand "%:t"
    local extension = vim.fn.expand "%:e"
    local icon = require("nvim-web-devicons").get_icon(filename, extension)
    if icon == nil then
      icon = "   "
      return icon
    end
    return " " .. icon .. " " .. filename .. " "
  end,
  enabled = shortline or function()
    return vim.api.nvim_win_get_width(0) > 70
  end,
  hl = {
    fg = sett.bkg,
    bg = sett.curr_file,
  },
  left_sep = {
    str = assets.left_flame,
    hl = {
      fg = sett.curr_file,
      bg = sett.bkg,
    },
  },
}
components.active[3][2] = component_current_file

local component_current_dir = {
  provider = function()
    local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    return "  " .. dir_name .. " "
  end,

  enabled = shortline or function()
    return vim.api.nvim_win_get_width(0) > 80
  end,

  hl = {
    fg = sett.bkg,
    bg = sett.curr_dir,
  },
  left_sep = {
    str = assets.left_flame,
    hl = {
      fg = sett.curr_dir,
      bg = sett.curr_file,
    },
  },
}
components.active[3][3] = component_current_dir
-- ######## Right

return components
