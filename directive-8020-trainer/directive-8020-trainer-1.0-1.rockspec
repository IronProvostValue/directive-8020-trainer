package = "directive-8020-trainer"
version = "1.0-1"
source = {
   url = "git://github.com/user/directive-8020-trainer.git"
}
description = {
   summary = "Directive 8020 compliance trainer.",
   detailed = [[
      A small Lua project for simulating Directive 8020 training scenarios.
   ]],
   homepage = "https://github.com/user/directive-8020-trainer",
   license = "MIT"
}
dependencies = {
   "lua >= 5.3",
   "lunarml >= 1.0"
}
build = {
   type = "builtin",
   install = {
      bin = { "src/main.lua" },
      lib = { "src/trainer.lua", "src/scenario.lua", "src/result.lua" }
   }
}