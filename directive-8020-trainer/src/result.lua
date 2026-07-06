local result = {}
result.__index = result

function result.new(trainer)
   local self = setmetatable({}, result)
   self.trainer = trainer
   return self
end

function result:print()
   if not self.trainer.completed then
      print("Result: training not completed.")
      return
   end
   local avg = self.trainer:get_average()
   print("Average score: " .. string.format("%.1f", avg))
   if avg >= 80 then
      print("Status: PASS (Directive 8020 compliant)")
   else
      print("Status: FAIL (retraining required)")
   end
end

return result