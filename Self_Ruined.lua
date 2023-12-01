getgenv().MetaMode = false
getgenv().FunctionMode = false

if getgenv().MetaMode then
    local Oldmeta; Oldmeta = hookmetamethod(game, '__namecall', newcclosure(function(self, ...)
        local args = {...}
        local namecall = getnamecallmethod()
        local checkcall = checkcaller()
        if checkcall and namecall == 'GetService' and args[1] == 'ReplicatedStorage' then
            return 'hookmetamethod worked succesfully!'
        end
        return Oldmeta(self, ...)
    end))
    print(game:GetService('ReplicatedStorage'))
elseif getgenv().FunctionMode then
    local function test(givenArgs)
        print(givenArgs)
    end
    local Oldfunction; Oldfunction = hookfunction(test, function(...)
        local args = {...}
        print(args[1]:reverse())
        return Oldfunction(args)
    end)
    print('yllufseccus dekrow noitcunfkooh')
end
