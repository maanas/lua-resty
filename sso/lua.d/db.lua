-- Copyright (C) 2015 Maanas Royy (m4manas)

-- Lua DB Module (LORM)

local mysql = require "resty.mysql"

local db, err = mysql:new()

if not db then
    -- ngx.say("failed to instantiate mysql: ", err)
    return nil
end

db:set_timeout(1000) -- 1 sec

local ok, err, errno, sqlstate = db:connect{
    host = ngx.var.db_host,
    port = 3306,
    database = ngx.var.db_name,
    user = ngx.var.db_user,
    password = ngx.var.db_pass,
    max_packet_size = 1024 * 1024 
}

if not ok then
    -- ngx.say("failed to connect: ", err, ": ", errno, " ", sqlstate)
    return nil
end

return db
