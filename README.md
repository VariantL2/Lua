# Atomic

This is a remake of Cynn UI which will be my main UI Library now. I will add more things inside the library, remodel some things, and add more tweening. Some elements are pretty bugged so either use it or report it to me (cynnomni).

# UI Preview
![UIPrivew](https://github.com/VariantL2/Lua/assets/129179825/66b3f175-15fe-4824-835e-4599d4decd2f)

# Changelogs
- Added button and interact text (totally not inspired from Rayfield)
- Added switch and "FirstState" constructor
- Added label
- Added dropdown
- Added slider
- Added notification

# Plans
- Remodeling controller frame
- Revamping close and minimize function
- Adding notification sound
- Config saving

# Getting started
First of all; if you want to use this UI, put this into your code.
```lua
local Atomic = loadstring(game:HttpGet('https://raw.githubusercontent.com/VariantL2/Lua/main/Source.lua', true))()
```
To start the library you must setup a few things as the following code.
```lua
local Window = Atomic:StartAsset({
  Title = 'Atomic UI', -- Your desired title.
  UIController_Frame = true, -- Always set this to true, else there wont be any way to close or minimize the UI.
  OpenCloseKeybind = Enum.KeyCode.BackSlash, -- This is your keybind to open the UI after you minimized it.
})
```
After this you should create a tab to hold an element. To create a tab, simply follow this.
```lua
local Tab = Window:PlaceTab('Tab Name', 1234567890)
```
FYI; The tab uses image instead of text box. Default image is home icon.
After all things are set, we can get into the element functions.

## Button
To create a button, do this.
```lua
local Button = Tab:DefineButton({
  Name = 'Button name',
  Interact = 'Interaction', -- Totally not heavily inspired from Rayfield
  Callback = function()
    -- The function you want to execute when the button is clicked
  end
})
```
You of course can update a button. I will explain this function one by one. The function is only one and it looks like this.
```lua
Button:Update(arg, bool)
```
To update a button's name, you do this.
```lua
Button:Update('New button name', false) -- Make sure you put the boolean as false otherwise it would change the interact text.
```
To update a button's interact text, you do this.
```lua
Button:Update('New interact text', true) -- Make sure you put the boolean as true otherwise it would change the name.
```
To update a button's function, you do this.
```lua
Button:Update(function()
  -- New function
end)
-------------OR--------------
Button:Update(functionName)
```

## Label
To create a label, do this.
```lua
local Label = Tab:DefineLabel('Label content')
````
To update a label's content, you do this.
```lua
Label:SetContent('New content')
```

## Slider
To create a slider, do this.
```lua
local Slider = Tab:DefineSlider({
  Name = 'Slider name',
  Min = 16,
  Max = 50,
  FirstValue = 16,
  Callback = function(Value)
    -- Value here is a variable that holds the slider's current value.
  end
})
```
I recommend to set FirstValue not less than Min or not higher than Max.

To update a slider's value, you do this.
```lua
Slider:SetValue(10) -- Argument must be number otherwise it would bug.
```
To get a slider's current value, do this.
```lua
Slider:RetrieveValue() -- This function returns the current slider value.
```

## Switch
To create a switch, you do this.
```lua
local Switch = Tab:DefineSwitch({
  Name = 'Switch name',
  FirstState = false,
  Callback = function(State)
    -- State here is a variable that holds the current switch's state.
  end
})
```
To update a switch's state, do this.
```lua
Switch:SetState(true) -- Argument must be boolean otherwise it would bug.
```

## Dropdown
To create a dropdown, you do this.
```lua
local Dropdown = Tab:DefineDropdown({
  Name = 'Dropdown name',
  Callback = function(Selected)
    -- Selected here is a variable that holds the selected dropdown item.
  end
})
```
To add an item to a dropdown, do this.
```lua
Dropdown:AddItem('Item name', 'Item value') -- First argument is the item name, second argument is the item's value.
```
To remove an item, do this.
```lua
Dropdown:SetVoid('Item name') -- Item name must exist in a dropdown, otherwise it will index nil and bug.
```
To remove all items, do this.
```lua
Dropdown:VoidItem()
```

# Notification
Best part about this is: The only nice interface i've created

To make a notification, you simply do this.
```lua
Atomic:Notify({
  Title = 'Notification title',
  Content = 'Notification content here.',
  Duration = 3
```
FYI: Notification will appear from the bottom.
