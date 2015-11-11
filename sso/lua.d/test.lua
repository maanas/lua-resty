-- Test lua file
local db = require "db"
local dbc = db.new()

local res = dbc:query("SELECT u_username FROM user")
ngx.say(res)