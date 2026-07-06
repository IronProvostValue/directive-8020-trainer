local trainer = require("trainer")
local scenario = require("scenario")
local result = require("result")

local function test_scenario_creation()
   local sc = scenario.new("Test Scenario", 8020)
   assert(sc.name == "Test Scenario", "Scenario name mismatch")
   assert(sc.directive_id == 8020, "Directive ID mismatch")
   print("[PASS] test_scenario_creation")
end

local function test_trainer_run()
   local sc = scenario.new("Test", 8020)
   local tr = trainer.new(sc)
   tr:run()
   assert(#tr.scores == 3, "Expected 3 scores")
   assert(tr.completed == true, "Trainer should be completed")
   local avg = tr:get_average()
   assert(avg >= 60 and avg <= 100, "Average out of range")
   print("[PASS] test_trainer_run")
end

local function test_result_pass()
   local sc = scenario.new("Pass", 8020)
   local tr = trainer.new(sc)
   tr.scores = {85, 90, 92}
   tr.completed = true
   local res = result.new(tr)
   local ok = pcall(res.print, res)
   assert(ok, "Result print should not error")
   print("[PASS] test_result_pass")
end

local function test_result_fail()
   local sc = scenario.new("Fail", 8020)
   local tr = trainer.new(sc)
   tr.scores = {50, 60, 55}
   tr.completed = true
   local res = result.new(tr)
   local ok = pcall(res.print, res)
   assert(ok, "Result print should not error")
   print("[PASS] test_result_fail")
end

test_scenario_creation()
test_trainer_run()
test_result_pass()
test_result_fail()

print("\nAll tests passed.")