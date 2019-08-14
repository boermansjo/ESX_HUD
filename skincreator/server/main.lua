ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
-- Update all properties
RegisterServerEvent("updateSkin")
AddEventHandler("updateSkin", function(dad, mum, dadmumpercent, skin, eyecolor, acne, skinproblem, freckle, wrinkle, wrinkleopacity, eyebrow, eyebrowopacity, beard, beardopacity, beardcolor, hair, haircolor, torso, torsotext, leg, legtext, shoes, shoestext, accessory, accessorytext, undershirt, undershirttext, torso2, torso2text, prop_hat, prop_hat_text, prop_glasses, prop_glasses_text, prop_earrings, prop_earrings_text, prop_watches, prop_watches_text)
	TriggerEvent('es:getPlayerFromId', source, function(user)
		local player = user.getIdentifier()
		local skin_data = {}
		
		skin_data = '{"sun_2":0,"hair_1":'..hair..',"lipstick_1":'..lipsticktype..',"glasses_2":'..prop_glasses_text..',"face":'..dad..',"lipstick_4":0,"makeup_1":'..makeuptype..',"helmet_1":'..prop_hat..',"chain_2":0,"tshirt_1":'..undershirt..',"lipstick_3":'..lipstickcolor1..',"chain_1":0,"makeup_4":'..makeupcolor2..',"blush_1":'..blushtype..',"complexion_1":'..skinproblem..',"blemishes_2":0,"moles_1":'..freckle..',"bodyb_2":0,"beard_4":0,"decals_1":0,"mask_1":0,"blemishes_1":0,"chest_3":0,"bproof_2":0,"bags_1":0,"tshirt_2":'..undershirttext..',"blush_2":'..blushintensidad..',"glasses_1":'..prop_glasses..',"blush_3":'..blushcolor..',"bproof_1":0,"pants_1":'..leg..',"torso_1":'..torso2..',"age_1":'..wrinkle..',"eyebrows_2":'..eyebrowopacity..',"mask_2":0,"ears_2":'..prop_earrings_text..',"ears_1":'..prop_earrings..',"watches_1":'..prop_watches..',"shoes_1":'..shoes..',"makeup_3":'..makeupcolor1..',"age_2":'..wrinkleopacity..',"decals_2":0,"moles_2":'..freckleopacity..',"beard_1":'..beard..',"helmet_2":'..prop_hat_text..',"eye_color":'..eyecolor..',"complexion_2":'..skinproblemopacity..',"eyebrows_3":0,"watches_2":'..prop_watches_text..',"bags_2":0,"beard_2":'..beardopacity..',"pants_2":'..legtext..',"makeup_2":'..makeupintensidad..',"hair_color_1":'..haircolor..',"hair_color_2":'..haircolor2..',"beard_3":'..beardcolor..',"shoes_2":'..shoestext..',"chest_1":0,"eyebrows_1":'..eyebrow..',"bracelets_1":-1,"hair_2":0,"bracelets_2":0,"torso_2":'..torso2text..',"arms_2":'..torsotext..',"sun_1":0,"eyebrows_4":0,"bodyb_1":0,"lipstick_2":'..lipstickintensidad..',"skin":'..skin..',"sex":'..sex..',"chest_2":0,"arms":'..torso..'}'

		MySQL.Async.execute("UPDATE users SET skin=@skin WHERE identifier=@identifier", 
		{['@identifier']= player, ['@skin'] = skin_data})

		print("Outfits successfully updated !")
	end)
end)

RegisterServerEvent("hud:save")
AddEventHandler('hud:save', function(skin)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET `skin` = @skin WHERE identifier = @identifier',
	{
		['@skin']       = json.encode(skin),
		['@identifier'] = xPlayer.identifier
	})
end)

ESX.RegisterServerCallback('hud:getPlayerSkin', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		local user = users[1]
		local skin = nil

		local jobSkin = {
			skin_male   = xPlayer.job.skin_male,
			skin_female = xPlayer.job.skin_female
		}
		
		if user.skin ~= nil then
			skin = json.decode(user.skin)
		end

		cb(skin, jobSkin)
	end)
end)