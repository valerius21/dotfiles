local utils = require("new-file-template.utils")

local function camelCase(filename)
  -- remove file extension
  local lastDotIndex = filename:find("%.[^%.]*$")

  local cc = "Invalid Filename (neovim)"
  if lastDotIndex then
    cc = filename:sub(1, lastDotIndex - 1)
  end

  cc = utils.kebap_to_camel(cc)
  cc = utils.snake_to_camel(cc)

  return cc
end

local function page_template(relative_path, filename)
  return [[
export default async function Page() {
	return <>|cursor|</>;
}
]]
end

local function layout_template(relative_path, filename)
  return [[
import type { ReactNode } from "react";

export default async function Layout({ children }: { children: ReactNode }) {
	return <>{children}</>;
}
]]
end

local function default_template(relative_path, filename)
  local cc = camelCase(filename)

  return [[
import React from 'react'

export function ]] .. cc .. [[() {
  return  <>]] .. cc .. [[</>;
}
]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = "page.tsx", content = page_template },
    { pattern = "layout.tsx", content = layout_template },
    { pattern = ".*", content = default_template },
  }

  return utils.find_entry(template, opts)
end
