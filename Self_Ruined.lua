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
        print(...[1][1])
    end)
    test('yllufseccus dekrow noitcunfkooh')
end
