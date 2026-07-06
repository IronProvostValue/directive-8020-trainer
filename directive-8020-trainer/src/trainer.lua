local trainer = {}
trainer.__index = trainer

function trainer.new(scenario)
   local self = setmetatable({}, trainer)
   self.scenario = scenario
   self.scores = {}
   self.completed = false
   return self
end

function trainer:run()
   print("Training scenario: " .. self.scenario.name)
   for i = 1, 3 do
      local score = math.random(60, 100)
      table.insert(self.scores, score)
      print("  Attempt " .. i .. " score: " .. score)
   end
   self.completed = true
   print("Training complete.")
end

function trainer:get_average()
   local total = 0
   for _, v in ipairs(self.scores) do
      total = total + v
   end
   return total / #self.scores
end

return trainer