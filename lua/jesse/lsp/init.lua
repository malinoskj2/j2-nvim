-- LSP

local languages = require "jesse.lsp.languages"
local lsp_installer = require "jesse.lsp.lsp-installer"
local lsp_setup = require "jesse.lsp.lsp-setup"
local null_lsp_setup = require "jesse.lsp.null-lsp-setup"

-- Mason busted for NixOS. Going to install binaries outside of this config
-- via Nix package manager for now.
-- lsp_installer.install(languages)
lsp_setup.setup()
null_lsp_setup.setup()
