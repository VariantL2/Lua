![AtomBackground](https://github.com/VariantL2/Lua/assets/129179825/ac02f680-af00-4e57-ac7b-eec5d4a73b27)
# Atom
Atom is a free and open sourced Roblox UI Library.
- https://discordapp.com/users/769379614774525973
# Loadstring
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/VariantL2/Lua/main/Source.lua"))()
```
# Features
- Side Tab
- Buttons
- Sliders
- Dropdowns
- Inputs
- Keybinds
- Sections

... and more to be added.

Made by [CynexOmni#1530 / cynnomni]
# Documentation

## Loading the library
```lua
local Atom = loadstring(game:HttpGet("https://raw.githubusercontent.com/VariantL2/Lua/main/Source.lua"))()
```
## Creating the window
```lua
local Window = Atom:StartAsset({
  Title = 'Atom',
  CloseBind = Enum.KeyCode.Insert
})
```
## Tabs
```lua
local Tab = Window:PlaceTab('Tab 1')
```
## Buttons
```lua
local Button = Tab:MakeButton({
  Title = 'Button',
  Interact = 'Customizeable',
  OnEnd = false,
  Callback = function() end
})
```
### OnEnd is a feature which replaces the callback placemenet from when you click to when you let go the click
- Changing a button's name
```lua
Button:SetTitle('New Button Title')
```
- Changing a button's interact
```lua
Button:SetInteract('New Button Interact')
```
- Changing a button's callback
```lua
Button:SetCallback(function() end)
```
## Sliders
```lua
local Slider = Tab:MakeSlider({
  Title = 'Slider',
  Min = 16,
  Max = 50,
  FirstValue = 16,
  Callback = function(Value) end
})
```
### Fires with the current number (FirstValue)
- Changing a slider's first value
```lua
Slider:SetValue(50)
```
- Getting a slider's current value
```lua
Slider:RetrieveValue()
```
## Toggles
```lua
local Toggle = Tab:MakeToggle({
  Title = 'Toggle',
  FirstState = false,
  Callback = function(State) end
})
```
### Fires with a boolean value (Determined by FirstState)
- Changing a toggle's state
```lua
Toggle:SetState(true)
```
## Dropdowns
```lua
local Dropdown = Tab:MakeDropdown({
  Title = 'Dropdown',
  Items = {'Item 1', 'Item 2'},
  Callback = function(Item) end
})
```
### Fires with the item's name
- Adding a new item
```lua
Dropdown:NewItem('New Item')
```
- Deleting an item
```lua
Dropdown:RemoveItem('Item 1') -- Item name is case sensitive.
```
- Deleting every item
```lua
Dropdown:SetVoid()
```
## Input
```lua
local Input = Tab:MakeInput({
  Title = 'Input',
  PlaceholderText = 'PlaceholderText',
  FocusLostRemove = true,
  Callback = function(Input) end
})
```
### Fires with the given input
## Keybind
```lua
local Keybind = Tab:MakeKeybind({
  Title = 'Keybind',
  FirstKeybind = 'One',
  FireWhenHold = true,
  Callback = function(State) end
})
```
### Fires when the keybind is pressed / held
### The parameter state is returned if FireWhenHold is true
- Changing a keybind's current bind
```lua
Keybind:SetKey('BackSlash')
```
## Sections
```lua
local Section = Tab:MakeSection('Guns')
```
- Unuseful: Changing a section's name
```lua
Section:ChangeName('Droplets')
```
## Note that every instances listed here is case sensitive.
