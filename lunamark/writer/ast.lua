-- Return an abstract syntax tree

local M = {}

local format = string.format
local util = require("lunamark.util")
local generic = require("lunamark.writer.generic")
local entities = require("lunamark.entities")

function M.new(options)
  local options = options or {}
  local AST = generic.new(options)

  function AST.merge(result) return result end
  
  AST.genericCommand = function(name) return function(s)
      local node = { id = name }
      node[1] = s
      return node
    end
  end

  AST.strong = AST.genericCommand("strong")
  AST.emphasis = AST.genericCommand("emphasis")
  AST.blockquote = AST.genericCommand("blockquote")
  AST.verbatim =AST.genericCommand("verbatim")

  return AST
end

return M