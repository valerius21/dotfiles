local utils = require("new-file-template.utils")

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

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = "page.tsx", content = page_template },
    { pattern = "layout.tsx", content = layout_template },
  }

  return utils.find_entry(template, opts)
end
