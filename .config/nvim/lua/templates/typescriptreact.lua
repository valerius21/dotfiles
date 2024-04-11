local utils = require("new-file-template.utils")

local function camelCase(fileName)
  -- Split the file name into words based on underscores and hyphens
  local words = {}
  for word in string.gmatch(fileName, "[^%-%_]+") do
    table.insert(words, word)
  end

  -- Capitalize the first letter of each word except the first one
  for i = 2, #words do
    words[i] = words[i]:sub(1, 1):upper() .. words[i]:sub(2)
  end

  -- Concatenate the words to form the CamelCased string
  return table.concat(words)
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
  local lastDotIndex = filename:find("%.[^%.]*$")

  local cc = "what"
  if lastDotIndex then
    cc = filename:sub(1, lastDotIndex - 1)
  end

  cc = utils.kebap_to_camel(cc)
  cc = utils.snake_to_camel(cc)

  return [[
import React from 'react'

export function ]] .. cc .. [[ () {
  return  <> ]] .. cc .. [[ </>;
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
