------------------------------------------------------------------
--                          Variables
------------------------------------------------------------------
ESX = nil
local cam = -1 -- Camera control
local heading = 332.219879 -- Heading coord
local zoom = "visage" -- Define which tab is shown first (Default: Head)
local isCameraActive, lastSkin
local FirstSpawn = true
local PlayerLoaded = false
local PrevHat, PrevGlasses, PrevEars, PrevGender, PrevPants, PrevShoes, PrevWatches
local face

Citizen.CreateThread(
	function()
		while ESX == nil do
			TriggerEvent(
				"esx:getSharedObject",
				function(obj)
					ESX = obj
				end
			)
			Citizen.Wait(0)
		end
	end
)

------------------------------------------------------------------
--                          NUI
------------------------------------------------------------------

RegisterNUICallback(
	"updateSkin",
	function(data)
		local playerPed = PlayerPedId()
		v = data.value
		-- Face
		dad = tonumber(data.dad)
		mum = tonumber(data.mum)
		gender = tonumber(data.gender)
		skin = tonumber(data.skin)
		eyecolor = tonumber(data.eyecolor)
		acne = tonumber(data.acne)
		skinproblem = tonumber(data.skinproblem)
		freckle = tonumber(data.freckle)
		wrinkle = tonumber(data.wrinkle)
		wrinkleopacity = tonumber(data.wrinkleopacity)
		hair = tonumber(data.hair)
		haircolor = tonumber(data.haircolor)
		eyebrow = tonumber(data.eyebrow)
		eyebrowopacity = tonumber(data.eyebrowopacity)
		beard = tonumber(data.beard)
		beardopacity = tonumber(data.beardopacity)
		beardcolor = tonumber(data.beardcolor)
		-- Clothes
		hats = tonumber(data.hats)
		hats_texture = tonumber(data.hats_texture)
		glasses = tonumber(data.glasses)
		glasses_texture = tonumber(data.glasses_texture)
		ears = tonumber(data.ears)
		ears_texture = tonumber(data.ears_texture)
		tops_torso_a = tonumber(data.tops_torso_a)
		tops_torso_b = tonumber(data.tops_torso_b)
		tops_neck_a = tonumber(data.tops_neck_a)
		tops_neck_b = tonumber(data.tops_neck_b)
		tops_undershirt_a = tonumber(data.tops_undershirt_a)
		tops_undershirt_b = tonumber(data.tops_undershirt_b)
		tops_hands = tonumber(data.tops_hands)
		pants = tonumber(data.pants)
		pants_texture = tonumber(data.pants_texture)
		shoes = tonumber(data.shoes)
		shoes_texture = tonumber(data.shoes_texture)
		watches = tonumber(data.watches)
		watches_texture = tonumber(data.watches_texture)

		if (v == true) then
			local ped = playerPed
			local hand = GetPedDrawableVariation(ped, 3)
			local handtext = GetPedTextureVariation(ped, 3)
			local leg = GetPedDrawableVariation(ped, 4)
			local legtext = GetPedTextureVariation(ped, 4)
			local shoes = GetPedDrawableVariation(ped, 6)
			local shoestext = GetPedTextureVariation(ped, 6)
			local accessory = GetPedDrawableVariation(ped, 7)
			local accessorytext = GetPedTextureVariation(ped, 7)
			local undershirt = GetPedDrawableVariation(ped, 8)
			local undershirttext = GetPedTextureVariation(ped, 8)
			local torso = GetPedDrawableVariation(ped, 11)
			local torsotext = GetPedTextureVariation(ped, 11)
			local prop_hat = GetPedPropIndex(ped, 0)
			local prop_hat_text = GetPedPropTextureIndex(ped, 0)
			local prop_glasses = GetPedPropIndex(ped, 1)
			local prop_glasses_text = GetPedPropTextureIndex(ped, 1)
			local prop_earrings = GetPedPropIndex(ped, 2)
			local prop_earrings_text = GetPedPropTextureIndex(ped, 2)
			local prop_watches = GetPedPropIndex(ped, 6)
			local prop_watches_text = GetPedPropTextureIndex(ped, 6)

			local skin_data = {
				["sex"] = gender,
				["face"] = face,
				["skin"] = skin,
				["eye_color"] = eyecolor,
				["complexion_1"] = skinproblem,
				["complexion_2"] = 1,
				["moles_1"] = freckle,
				["moles_2"] = 1,
				["age_1"] = wrinkle,
				["age_2"] = wrinkleopacity,
				["eyebrows_1"] = eyebrow,
				["eyebrows_2"] = eyebrowopacity,
				["beard_1"] = beard,
				["beard_2"] = beardopacity,
				["beard_3"] = beardcolor,
				["beard_4"] = beardcolor,
				["hair_1"] = hair,
				["hair_2"] = 0,
				["hair_color_1"] = haircolor,
				["hair_color_2"] = haircolor,
				["arms"] = hand,
				["arms_2"] = handtext,
				["pants_1"] = leg,
				["pants_2"] = legtext,
				["shoes_1"] = shoes,
				["shoes_2"] = shoestext,
				["chain_1"] = accessory,
				["chain_2"] = accessorytext,
				["tshirt_1"] = undershirt,
				["tshirt_2"] = undershirttext,
				["torso_1"] = torso,
				["torso_2"] = torsotext,
				["helmet_1"] = prop_hat,
				["helmet_2"] = prop_hat_text,
				["glasses_1"] = prop_glasses,
				["glasses_2"] = prop_glasses_text,
				["ears_1"] = prop_earrings,
				["ears_2"] = prop_earrings_text,
				["watches_1"] = prop_watches,
				["watches_2"] = prop_watches_text
			}

			TriggerServerEvent("esx_skin:save", skin_data)
			TriggerEvent('skinchanger:loadSkin', skin_data)
			Citizen.Wait(1000)

			CloseSkinCreator()
		else
			if PrevGender ~= gender then
				local characterModel

				if gender == 0 then
					TriggerEvent("skinchanger:change", "sex", 0)
					face = dad
				else
					TriggerEvent("skinchanger:change", "sex", 1)
					face = mum
				end
			end

			-- Face
			--TO DO : Add dadmumpercent into skinchanger
			--SetPedHeadBlendData			(playerPed, face, face, face, skin, skin, skin, dadmumpercent * 0.1, dadmumpercent * 0.1, 1.0, true)
			SetPedHeadBlendData(playerPed, face, face, face, skin, skin, skin, 1.0, 1.0, 1.0, true)

			SetPedEyeColor(playerPed, eyecolor)
			if acne == 0 then
				SetPedHeadOverlay(playerPed, 0, acne, 0.0)
			else
				SetPedHeadOverlay(playerPed, 0, acne, 1.0)
			end
			SetPedHeadOverlay(playerPed, 6, skinproblem, 1.0)
			if freckle == 0 then
				SetPedHeadOverlay(playerPed, 9, freckle, 0.0)
			else
				SetPedHeadOverlay(playerPed, 9, freckle, 1.0)
			end

			SetPedHeadOverlay(playerPed, 3, wrinkle, wrinkleopacity * 0.1)
			SetPedComponentVariation(playerPed, 2, hair, 0, 2)
			SetPedHairColor(playerPed, haircolor, haircolor)
			SetPedHeadOverlay(playerPed, 2, eyebrow, eyebrowopacity * 0.1)
			SetPedHeadOverlay(playerPed, 1, beard, beardopacity * 0.1)
			SetPedHeadOverlayColor(playerPed, 1, 1, beardcolor, beardcolor)
			SetPedHeadOverlayColor(playerPed, 2, 1, beardcolor, beardcolor)

			-- Clothes variations
			if PrevHat ~= hats then
				PrevHat = hats
				hats_texture = 0
				local maxHat
				if hats == 0 then
					maxHat = 0
				else
					maxHat = GetNumberOfPedPropTextureVariations(playerPed, 0, hats) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "helmet_2",
						defaultVal = 0,
						maxVal = maxHat
					}
				)
			end

			if hats == 0 then
				ClearPedProp(playerPed, 0)
			else
				SetPedPropIndex(playerPed, 0, hats, hats_texture, 2)
			end

			if PrevGlasses ~= glasses then
				PrevGlasses = glasses
				glasses_texture = 0
				local maxGlasses
				if glasses == 0 then
					maxGlasses = 0
				else
					maxGlasses = GetNumberOfPedPropTextureVariations(playerPed, 1, glasses) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "glasses_2",
						defaultVal = 0,
						maxVal = maxGlasses
					}
				)
			end
			if glasses == 0 then
				ClearPedProp(playerPed, 1)
			else
				SetPedPropIndex(playerPed, 1, glasses, glasses_texture, 2)
			 --Glasses
			end

			if PrevEars ~= ears then
				PrevEars = ears
				ears_texture = 0
				local maxEars
				if ears == 0 then
					maxEars = 0
				else
					maxEars = GetNumberOfPedPropTextureVariations(playerPed, 2, ears) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "ears_2",
						defaultVal = 0,
						maxVal = maxEars
					}
				)
			end
			if ears == 0 then
				ClearPedProp(playerPed, 2)
			else
				SetPedPropIndex(playerPed, 2, ears, ears_texture, 2)
			end

			-- Keep these 4 variations together.
			-- It avoids empty arms or noisy clothes superposition
			SetPedComponentVariation(playerPed, 7, tops_neck_a, tops_neck_b, 2) -- Neck
			SetPedComponentVariation(playerPed, 8, tops_undershirt_a, tops_undershirt_b, 2) -- Undershirt
			SetPedComponentVariation(playerPed, 11, tops_torso_a, tops_torso_b, 2) -- Torso 2
			SetPedComponentVariation(playerPed, 3, tops_hands, 0, 2)

			if PrevPants ~= pants then
				PrevPants = pants
				pants_texture = 0
				local maxPants
				if pants == 0 then
					maxPants = 0
				else
					maxPants = GetNumberOfPedTextureVariations(playerPed, 4, pants) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "pantalons_2",
						defaultVal = 0,
						maxVal = maxPants
					}
				)
			end

			SetPedComponentVariation(playerPed, 4, pants, pants_texture, 2)

			if PrevShoes ~= shoes then
				PrevShoes = shoes
				shoes_texture = 0
				local maxShoes
				if shoes == 0 then
					maxShoes = 0
				else
					maxShoes = GetNumberOfPedTextureVariations(playerPed, 6, shoes) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "chaussures_2",
						defaultVal = 0,
						maxVal = maxShoes
					}
				)
			end

			SetPedComponentVariation(playerPed, 6, shoes, shoes_texture, 2)

			if PrevWatches ~= watches then
				PrevWatches = watches
				watches_texture = 0
				local maxWatches
				if shoes == 0 then
					maxWatches = 0
				else
					maxWatches = GetNumberOfPedPropTextureVariations(playerPed, 6, watches) - 1
				end
				SendNUIMessage(
					{
						type = "updateMaxVal",
						classname = "montre_2",
						defaultVal = 0,
						maxVal = maxWatches
					}
				)
			end

			if watches == -1 then
				ClearPedProp(playerPed, 6)
			else
				SetPedPropIndex(playerPed, 6, watches, watches_texture, 2)
			end

			-- Unused yet
			-- These presets will be editable in V2 release
			SetPedHeadOverlay(playerPed, 4, 0, 0.0) -- Lipstick
			SetPedHeadOverlay(playerPed, 8, 0, 0.0) -- Makeup
			SetPedHeadOverlayColor(playerPed, 4, 1, 0, 0) -- Makeup Color
			SetPedHeadOverlayColor(playerPed, 8, 1, 0, 0) -- Lipstick Color
			SetPedComponentVariation(playerPed, 1, 0, 0, 2) -- Mask
		end
	end
)

-- Character rotation
RegisterNUICallback(
	"rotateleftheading",
	function(data)
		local currentHeading = GetEntityHeading(playerPed)
		heading = heading + tonumber(data.value)
	end
)

RegisterNUICallback(
	"rotaterightheading",
	function(data)
		local currentHeading = GetEntityHeading(playerPed)
		heading = heading - tonumber(data.value)
	end
)

-- Define which part of the body must be zoomed
RegisterNUICallback(
	"zoom",
	function(data)
		zoom = data.zoom
	end
)

------------------------------------------------------------------
--                          Functions
------------------------------------------------------------------
function CloseSkinCreator()
	local ped = PlayerPedId()
	ShowSkinCreator(false)
	isCameraActive = false
	SetCamActive(cam, false)
	RenderScriptCams(false, true, 500, true, true)
	cam = nil

	-- Player
	SetPlayerInvincible(ped, false)
end

function ShowSkinCreator(enable)
	local elements = {}
	TriggerEvent(
		"skinchanger:getData",
		function(components, maxVals)
			local _components = {}

			for i = 1, #components, 1 do
				_components[i] = components[i]
			end

			-- Insert elements
			for i = 1, #_components, 1 do
				local value = _components[i].value
				local componentId = _components[i].componentId

				if componentId == 0 then
					value = GetPedPropIndex(playerPed, _components[i].componentId)
				end

				local data = {
					label = _components[i].label,
					name = _components[i].name,
					value = value,
					min = _components[i].min
				}

				for k, v in pairs(maxVals) do
					if k == _components[i].name then
						data.max = v
						break
					end
				end

				table.insert(elements, data)
			end
		end
	)
	isCameraActive = true
	SetNuiFocus(enable, enable)
	SendNUIMessage(
		{
			openSkinCreator = enable
		}
	)

	for index, data in ipairs(elements) do
		local name, Valmax

		for key, value in pairs(data) do
			if key == "name" then
				name = value
			end
			if key == "max" then
				Valmax = value
			end
		end

		SendNUIMessage(
			{
				type = "updateMaxVal",
				classname = name,
				defaultVal = 0,
				maxVal = Valmax
			}
		)
	end
end

RegisterNetEvent("hud:loadMenu")
AddEventHandler(
	"hud:loadMenu",
	function()
		ShowSkinCreator(true)
	end
)

-- Disable Controls
Citizen.CreateThread(
	function()
		while true do
			Citizen.Wait(0)
			if isCameraActive == true then
				DisableControlAction(2, 14, true)
				DisableControlAction(2, 15, true)
				DisableControlAction(2, 16, true)
				DisableControlAction(2, 17, true)
				DisableControlAction(2, 30, true)
				DisableControlAction(2, 31, true)
				DisableControlAction(2, 32, true)
				DisableControlAction(2, 33, true)
				DisableControlAction(2, 34, true)
				DisableControlAction(2, 35, true)
				DisableControlAction(0, 25, true)
				DisableControlAction(0, 24, true)

				local ped = PlayerPedId()

				-- Player
				SetPlayerInvincible(ped, true)

				-- Camera
				RenderScriptCams(false, false, 0, 1, 0)
				DestroyCam(cam, false)
				if (not DoesCamExist(cam)) then
					cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
					SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
					SetCamRot(cam, 0.0, 0.0, 0.0)
					SetCamActive(cam, true)
					RenderScriptCams(true, false, 0, true, true)
					SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
				end
				local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
				if zoom == "visage" or zoom == "pilosite" or zoom == "Head" then
					SetCamCoord(cam, x + 0.2, y + 0.5, z + 0.7)
					SetCamRot(cam, 0.0, 0.0, 150.0)
				elseif zoom == "vetements" or zoom == "All" then
					SetCamCoord(cam, x + 0.3, y + 2.0, z + 0.0)
					SetCamRot(cam, 0.0, 0.0, 170.0)
				end
				SetEntityHeading(PlayerPedId(), heading)
			else
				Citizen.Wait(500)
			end
		end
	end
)

AddEventHandler(
	"esx:onPlayerSpawn",
	function()
		Citizen.CreateThread(
			function()
				while not PlayerLoaded do
					Citizen.Wait(100)
				end
				if FirstSpawn then
					ESX.TriggerServerCallback(
						"esx_skin:getPlayerSkin",
						function(skin, jobSkin)
							if skin == nil then
								TriggerEvent("skinchanger:loadSkin", {sex = 0})
							else
								TriggerEvent("skinchanger:loadSkin", skin)
							end
						end
					)

					FirstSpawn = false
				end
			end
		)
	end
)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler(
	"esx:playerLoaded",
	function(xPlayer)
		PlayerLoaded = true
	end
)

AddEventHandler(
	"esx_skin:getLastSkin",
	function(cb)
		cb(lastSkin)
	end
)

AddEventHandler(
	"esx_skin:setLastSkin",
	function(skin)
		lastSkin = skin
	end
)

RegisterNetEvent("esx_skin:openMenu")
AddEventHandler(
	"esx_skin:openMenu",
	function(submitCb, cancelCb)
		OpenMenu(submitCb, cancelCb, nil)
	end
)

RegisterNetEvent("esx_skin:openRestrictedMenu")
AddEventHandler(
	"esx_skin:openRestrictedMenu",
	function(submitCb, cancelCb, restrict)
		OpenMenu(submitCb, cancelCb, restrict)
	end
)

RegisterNetEvent("esx_skin:openSaveableMenu")
AddEventHandler(
	"esx_skin:openSaveableMenu",
	function(submitCb, cancelCb)
		ShowSkinCreator(true)
	end
)

RegisterNetEvent("esx_skin:openSaveableRestrictedMenu")
AddEventHandler(
	"esx_skin:openSaveableRestrictedMenu",
	function(submitCb, cancelCb, restrict)
		OpenSaveableMenu(submitCb, cancelCb, restrict)
	end
)

RegisterNetEvent("esx_skin:requestSaveSkin")
AddEventHandler(
	"esx_skin:requestSaveSkin",
	function()
		TriggerEvent(
			"skinchanger:getSkin",
			function(skin)
				TriggerServerEvent("esx_skin:responseSaveSkin", skin)
			end
		)
	end
)
