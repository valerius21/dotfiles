local utils = require("new-file-template.utils")

local function base_template(relative_path, filename)
  return [[

  ]]
end

local function route_template(relative_path, filename)
  return [[
import type { NextRequest } from "next/server";

export async function GET(req: NextRequest) {}

// export async function POST(req: NextRequest) {
//
// }
//
// export async function PUT(req: NextRequest) {
//
// }
//
// export async function DELETE(req: NextRequest) {
//
// }
]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = "route.ts", content = route_template },
    { pattern = ".*", content = base_template },
  }

  return utils.find_entry(template, opts)
end
