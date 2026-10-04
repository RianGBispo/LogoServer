local editing = false

RegisterNUICallback("ready", function(_, cb)
	local saved = GetResourceKvpString("logo_pos")
	cb({ pos = saved and json.decode(saved) or nil })
end)

RegisterCommand("logo", function()
	editing = not editing
	SetNuiFocus(editing, editing)
	SendNUIMessage({ action = "edit", state = editing })
end)

RegisterNUICallback("save", function(data, cb)
	SetResourceKvp("logo_pos", json.encode(data))
	editing = false
	SetNuiFocus(false, false)
	cb("ok")
end)

-- esconde a logo no menu de pausa
CreateThread(function()
	local hidden = false
	while true do
		Wait(250)
		local paused = IsPauseMenuActive()
		if paused ~= hidden then
			hidden = paused
			SendNUIMessage({ action = "visible", state = not paused })
		end
	end
end)
