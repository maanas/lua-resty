-- Test lua file
local user = require "user"

ngx.say(user:get_hash())