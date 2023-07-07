# Cynn UI V1

This is like my first time making a UI Library so I can't add a lot of stuff into it. Still planning on reworking the label and making paragraph.
FYI; This UI uses size scaling.

# UI Preview
![UIPrivew](https://github.com/VariantL2/Lua/assets/129179825/76ca970e-1d20-48d7-b815-0d4946998960)

# Changelogs
- Changed tab constructor to arguments
- Added auto scale for paragraph and label -- Is not working really well
- Added paragraph
- Added minimize support

# Known Bug
- Dropdown:SweepItems() indexing nil

## Booting the library
```lua
local CynnUI = loadstring(game:HttpGet('https://raw.githubusercontent.com/VariantL2/Lua/main/Source.lua'))()
```
## Creating the window
```lua
local Window = CynnUI:CreateWindow({
  Name = 'Cynn UI Default',
  MainFrameUIStroke = Color3.fromRGB(10, 38, 161),
  SecondaryFrameUIStroke = Color3.fromRGB(139, 0, 0)
})
```
## Creating a tab
```lua
local Tab = Window:CreateTab({
  Name = 'A Tab'
})
```
## Creating a button
```lua
local Button = Tab:CreateButton({
  Name = 'Button 1',
  Callback = function()
    -- The function which will get called if you click the button.
  end
})
```
You can also do this to save time if you don't know.
```lua
local function prinn()
  print('Cllicked')
end

local Button = Tab:CreateButton({
  Name = 'Click to call function',
  Callback = prinn -- This will set the callback to prinn function
})
```
### Updating a button
```lua
Button:SetText('Button title has been changed')
Button:SetCallback(-- The new function to replace the old function --)
```
## Creating a label
```lua
local Label = Tab:CreateLabel({
  Content = 'Label text here',
  MiddleUIGradient = true
})
```
### Updating a label
```lua
Label:Set('Label text here')
```
## Creating a slider
```lua
local Slider = Tab:CreateSlider({
  Name = 'A Slider',
  Min = 50,
  Max = 100,
  Default = 50,
  Callback = function(value)
    print(value)
  end
})
```
### Updating a slider
```lua
Slider:SetValue(-- The number should not be higher than max)
Slider:SetGetValue() -- Returns the slider's current value
```
## Creating a toggle
```lua
local Toggle = Tab:CreateToggle({
  Name = 'A toggle here',
  Callback = function(bool) -- I might add a CurrentState constructor
    print(bool)
  end
})
```
### Updating a toggle
```lua
Toggle:SetState(true)
```
## Creating a dropdown
```lua
local Dropdown = Tab:CreateDropdown({
  Name = 'A Dropdown',
  Info = 'An info about the dropdown',
  Callback = function(v)
    print(v)
  end
})
```
### Updating a dropdown
```lua
Dropdown:AddItem('Item name', 99) -- First argument is the item name, second is the item's value
Dropdown:RemoveItem('Item name') -- Item name must be the same to not create an nil indexing error
Dropdown:SweepItems() -- Clears every item and its value inside a dropdown
```
Big credit to
# Deity
For the UI Tutorial.
