local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport
if syn then request = syn.request end

local game = game --saves 0.00000001 second!!!!
local Players = game:FindService('Players')
local http = game:FindService("HttpService")
local TeleportService = game:FindService("TeleportService")
local jobid = game.JobId
local placeid = game.PlaceId
local filecode
local data

local function jsone(str) return http:JSONEncode(str) end
local function jsond(str) return http:JSONDecode(str) end

if not isfile(('ServerHop\\%s\\code.lua'):format(placeid)) then
    writefile(('ServerHop\\%s\\code.lua'):format(placeid), jsone(loadstring(game:HttpGet('https://pastebin.com/raw/uQBAeRzX'))()))
end

local function updatefile()
	local succ,err = pcall(function()
		writefile(('ServerHop\\%s\\data.json'):format(placeid), jsone(data))
	end)
	if err then return Players.LocalPlayer:Kick('Nuh uh') end
end

local function serverhop()
    local servers = {}
    local cursor = ''
    while cursor and #servers == 0 do
        task.wait()
        local req = request({
            Url = ('https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100&cursor=%s'):format(placeid,cursor)
        })
        local body = jsond(req.Body)

        if body and body.data then
            task.spawn(function()
                for i,v in next, body.data do
                    if type(v) == 'table' and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and not table.find(data.jobids,v.id) then
                        table.insert(servers, 1, v.id)
                    end 
                end
            end)

            if body.nextPageCursor then
                cursor = body.nextPageCursor
            end
        end
    end

    while #servers > 0 do
        local random = servers[math.random(1, #servers)]
        
        TeleportService:TeleportToPlaceInstance(placeid, random, Players.LocalPlayer)
        task.wait(1)
    end
end

if not isfolder('ServerHop') then
    makefolder('ServerHop')
end

if not isfolder(('ServerHop\\%s'):format(placeid)) then
    makefolder(('ServerHop\\%s'):format(placeid))
end

if isfile(("ServerHop\\%s\\data.json"):format(placeid)) then
    local filedata = readfile(('ServerHop\\%s\\data.json'):format(placeid))
    data = jsond(filedata)
else
    data = {
        jobids = {},
        ammount = 0
    }
    writefile(('ServerHop\\%s\\data.json'):format(placeid), jsone(data))
end

if isfile(("ServerHop\\%s\\code.lua"):format(placeid)) then
    local filedata = readfile(('ServerHop\\%s\\code.lua'):format(placeid))
    if #filedata == 0 then return end
    filecode = function()
        loadstring(filedata)()
    end
else
    rprint('FileCode not found','light_red')
    writefile(("ServerHop\\%s\\code.lua"):format(placeid),'')
end

if not table.find(data.jobids,jobid) then
    table.insert(data.jobids,jobid)
end

data.ammount = #data.jobids

updatefile()

repeat task.wait() until game:IsLoaded()

filecode()
queueteleport([[loadstring(game:HttpGet('https://raw.githubusercontent.com/noobhosting/noobscript/main/AutoServerHop.lua'))()]])
serverhop()
