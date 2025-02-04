local keys = require("asol.snacks_config.keys")
local configuration = require("asol.snacks_config.configuration")
local dashboard = require("asol.snacks_config.dashboard")
local notifier = require("asol.snacks_config.notifier")

return {
  keys = keys,
  configuration = configuration,
  dashboard = dashboard,
  notifier = notifier,
}
