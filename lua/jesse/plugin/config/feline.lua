local b = vim.b
local clrs = require "catppuccin.core.color_palette"

local shortline = false

local assets = {
  left_flame = "'",
  right_flame = "",
}

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

-- helpers
local vi_mode_hl = function()
  return {
    fg = sett.bkg,
    bg = mode_colors[vim.fn.mode()][2],
    style = "bold",
  }
end

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

-- global components
local invi_sep = {
  str = " ",
  hl = {
    fg = sett.bkg,
    bg = sett.bkg,
  },
}

-- Initialize the components table
local components = {
  active = {
    -- Left
    {
      -- Spacer
      {
        provider = " ",
        hl = function()
          return {
            fg = mode_colors[vim.fn.mode()][2],
            bg = mode_colors[vim.fn.mode()][2],
          }
        end,
      },
      -- Logo
      {
        provider = "",
        hl = function()
          return {
            fg = sett.bkg,
            bg = mode_colors[vim.fn.mode()][2],
          }
        end,
      },
      -- Title
      {
        provider = function()
          return " " .. mode_colors[vim.fn.mode()][1] .. " "
        end,
        hl = vi_mode_hl,
      },
      -- Flame divider
      {
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
      },
      {
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
      },
      -- Symbol shown when a line is added
      {
        provider = "git_diff_added",
        hl = {
          fg = sett.bkg,
          bg = sett.diffs,
        },
        icon = "  ",
      },
      -- Symbol shown when a line is changed
      {
        provider = "git_diff_changed",
        hl = {
          fg = sett.bkg,
          bg = sett.diffs,
        },
        icon = "  ",
      },
      -- Symbol shown when a line is removed
      {
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
      },
      -- Flame Divider
      {
        provider = assets.right_flame,
        hl = {
          fg = sett.diffs,
          bg = sett.bkg,
        },
        enabled = function()
          return any_git_changes()
        end,
      },
      -- File Progress
      {
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
      },
      -- Line/Col position
      {
        provider = "position",
        hl = {
          fg = sett.extras,
          bg = sett.bkg,
        },
        left_sep = invi_sep,
      },
    },
    -- Center
    {},
    -- Right
    {
      -- Git branch
      {
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
      },
      -- Open file
      {
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
      },
      -- Working directory
      {
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
      },
    },
  },
  inactive = {
    -- Left
    {
      -- Spacer
      {
        provider = " ",
        hl = function()
          return {
            fg = clrs.black2,
            bg = clrs.black2,
          }
        end,
      },
    },
  },
}

return components
