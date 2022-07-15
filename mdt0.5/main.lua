guiEnabled = false
Citizen.CreateThread(function()
  while true do
    if guiEnabled then
      DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
      DisableControlAction(0, 2, guiEnabled) -- LookUpDown

      DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate

      DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride
    end
    Citizen.Wait(0) --MH LUA
  end
end)

function PrintChatMessage(text)
  TriggerEvent('chatMessage', "system", { 255, 0, 0 }, text)
end
  
RegisterNUICallback('NUIFocusOff', function()  
  toggleGui(false)
end)


RegisterCommand("cad", function(source, args, rawCommand)
  if guiEnabled then
    toggleGui(false)
  else
    toggleGui(true)
  end
end, false)

function toggleGui(state)
  print(state)
  if state then
    SetNuiFocus(true, true)
    guiEnabled = true
    SendNUIMessage({
      type = "enableui",
      enable = true
    })

  else 
    SetNuiFocus(false, false)
    guiEnabled = false
    SendNUIMessage({
      type = "enableui",
      enable = false
    })
  end
end


AddEventHandler('onClientResourceStart', function(resourceName) --When resource starts, stop the GUI showing. 
  if(GetCurrentResourceName() ~= resourceName) then
    return
  end
  toggleGui(false)
end)


--RegisterNetEvent("output")
--AddEventHandler("output", function(argument)
  --  TriggerEvent("chatMessage", "[Success]", {0,255,0}, argument)
--end)