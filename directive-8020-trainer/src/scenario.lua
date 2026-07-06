local scenario = {}
scenario.__index = scenario

function scenario.new(name, directive_id)
   local self = setmetatable({}, scenario)
   self.name = name or "Untitled"
   self.directive_id = directive_id or 0
   self.parameters = { difficulty = "medium", duration = 30 }
   return self
end

function scenario:info()
   return string.format("Scenario '%s' (Directive %d)", self.name, self.directive_id)
end

return scenario