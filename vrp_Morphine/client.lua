local hasInjected = false
local morphineTimer = 0

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent('OurStoryMorphine:inject')
AddEventHandler('OurStoryMorphine:inject', function()
	prop_name = 'p_syringe_01_s'
	Citizen.CreateThread(function()
		local playerPed = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(playerPed))
		local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
		local boneIndex = GetPedBoneIndex(playerPed, 18905)
		AttachEntityToEntity(prop, playerPed, boneIndex, 0.14, 0.03, 0.02, -50.0, 130.0, -.0, true, true, false, true, 1, true)
		loadAnimDict('mp_arresting')
		TaskPlayAnim(playerPed, 'mp_arresting', 'a_uncuff', 8.0, -8, -1, 49, 0, 0, 0, 0)
		SetPedMoveRateOverride(PlayerId(),10.0)
		SetRunSprintMultiplierForPlayer(PlayerId(),1.03)
		SetSwimMultiplierForPlayer(PlayerId(),1.06)
		Citizen.Wait(1200)
		Citizen.Wait(2500)
		ClearPedSecondaryTask(playerPed)
		DeleteObject(prop)
		ClearAllPedProps(prop)
		ClearPedTasks(playerPed)
    Citizen.Wait(3000)
    ClearPedTasksImmediately(playerPed)
    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "MOVE_M@QUICK", true)
    SetPedIsDrunk(playerPed, true)
	SetPedMoveRateOverride(PlayerId(),10.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.49)
    AnimpostfxPlay("DrugsMichaelAliensFight", 10000001, true)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)
    Citizen.Wait(10000)
-- after wait stop all 
    SetPedMoveRateOverride(PlayerId(),1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
    SetPedIsDrunk(GetPlayerPed(-1), false)		
    SetPedMotionBlur(playerPed, false)
    ResetPedMovementClipset(GetPlayerPed(-1))
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
		if hasInjected == false then
			hasInjected = true
			while morphineTimer < 1800 do
				morphineTimer = morphineTimer + 1
				local HP = GetEntityHealth(PlayerPedId())
				HP = HP + 1
				SetEntityHealth(PlayerPedId(), HP)
				Citizen.Wait(1000)
			end
			if hasInjected == true then
				hasInjected = false
				morphineTimer = 0
				SetPedMoveRateOverride(PlayerId(),10.0)
				SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
				SetSwimMultiplierForPlayer(PlayerId(),1.0)
			end
		else
		end
	end)
end)