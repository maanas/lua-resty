-- Copyright (C) 2015 Maanas Royy (m4manas)

-- Lua User Module 


local mysql = require "resty.mysql"

local db_host = ngx.var.db_host
local db_name = ngx.var.db_name
local db_user = ngx.var.db_user
local db_pass = ngx.var.db_pass
local db, err = mysql:new()

-- Instantiate a db connection
if not db then
    return nil
end

db:set_timeout(1000) -- 1 sec

local ok, err, errno, sqlstate = db:connect{
    host = db_host,
    port = 3306,
    database = db_name,
    user = db_user,
    password = db_pass,
    max_packet_size = 1024 * 1024 
}

if not ok then
    return nil
end

local _M = {
	_VERSION = '0.01'
}

function _M.get_hash()
	return db:query("SELECT SHA2(UUID(), 256) AS hash")
end

return _M

