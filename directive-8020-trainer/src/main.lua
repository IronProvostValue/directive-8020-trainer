#!/usr/bin/env lua
local trainer = require("trainer")
local scenario = require("scenario")
local result = require("result")

local function main()
   print("Directive 8020 Trainer v1.0")
   print("----------------------------")

   local sc = scenario.new("Compliance Alpha", 8020)
   local tr = trainer.new(sc)

   tr:run()

   local res = result.new(tr)
   res:print()
end

main()