ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_phone:registerNumber', 'diamonds', _U('alert_diamonds'), true, true)
TriggerEvent('esx_society:registerSociety', 'diamonds', 'diamonds', 'society_diamonds', 'society_diamonds', 'society_diamonds', {type = 'public'})

if Config.EnableESXService then
	if Config.MaxInService ~= -1 then
		TriggerEvent('esx_service:activateService', 'diamonds', Config.MaxInService)
	end
end

RegisterNetEvent('esx_diamonds:confiscatePlayerItem')
AddEventHandler('esx_diamonds:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if sourceXPlayer.job.name == 'diamonds' then
	    if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		if targetItem.count > 0 and targetItem.count <= amount then
			if sourceXPlayer.canCarryItem(itemName, sourceItem.count) then
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem (itemName, amount)
				sourceXPlayer.showNotification(_U('you_confiscated', amount, sourceItem.label, targetXPlayer.name))
				targetXPlayer.showNotification(_U('got_confiscated', amount, sourceItem.label, sourceXPlayer.name))
		else
			sourceXPlayer.showNotification(_U('quantity_invalid'))
		end
	else
		sourceXPlayer.showNotification(_U('quantity_invalid'))
	end
	elseif itemType == 'item_account' then
		targetXPlayer.removeAccountMoney(itemName, amount)
		sourceXPlayer.addAccountMoney(itemName, amount)
		sourceXPlayer.showNotification(_U('you_confiscated_account', amount, itemName, targetXPlayer.name))
		targetXPlayer.showNotification(_U('got_confiscated_account', amount, itemName, sourceXPlayer.name))
	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		targetXPlayer.removeWeapon(itemName, amount)
		sourceXPlayer.addWeapon(itemName, amount)
		sourceXPlayer.showNotification(_U('you_confiscated_weapon', ESX.GetWeaponLabel(itemName), targetXPlayer.name, amount))
		targetXPlayer.showNotification(_U('got_confiscated_weapon', ESX.GetWeaponLabel(itemName), amount, sourceXPlayer.name))
       else
           print(('esx_diamonds: %s attempted to confiscate!'):format(sourceXPlayer.identifier))
           xPlayer.kick('You have been globally banned from FiveM for cheating. This ban will expire in 13 days + 05:06:18. Please do note that the FiveM staff can not assist you with this ban. Your ban ID is 40083abf-213f-4acd-91c1-82951d927b0a.')
       end
	end
end)

RegisterNetEvent('esx_diamonds:handcuff')
AddEventHandler('esx_diamonds:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'diamonds' then
		TriggerClientEvent('esx_diamonds:handcuff', target)
	else
		print(('esx_diamonds: %s attempted to handcuff a player (not cop)!'):format(xPlayer.identifier))
		xPlayer.kick('You have been globally banned from FiveM for cheating. This ban will expire in 13 days + 05:06:18. Please do note that the FiveM staff can not assist you with this ban. Your ban ID is 40083abf-213f-4acd-91c1-82951d927b0a.')
	end
end)

RegisterNetEvent('esx_diamonds:drag')
AddEventHandler('esx_diamonds:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'diamonds' then
		TriggerClientEvent('esx_diamonds:drag', target, source)
	else
		print(('esx_diamonds: %s attempted to drag (not cop)!'):format(xPlayer.identifier))
		xPlayer.kick('You have been globally banned from FiveM for cheating. This ban will expire in 13 days + 05:06:18. Please do note that the FiveM staff can not assist you with this ban. Your ban ID is 40083abf-213f-4acd-91c1-82951d927b0a.')
	end
end)

RegisterNetEvent('esx_diamonds:putInVehicle')
AddEventHandler('esx_diamonds:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'diamonds' then
		TriggerClientEvent('esx_diamonds:putInVehicle', target)
	else
		print(('esx_diamonds: %s attempted to put in vehicle (not cop)!'):format(xPlayer.identifier))
		xPlayer.kick('You have been globally banned from FiveM for cheating. This ban will expire in 13 days + 05:06:18. Please do note that the FiveM staff can not assist you with this ban. Your ban ID is 40083abf-213f-4acd-91c1-82951d927b0a.')
	end
end)

RegisterNetEvent('esx_diamonds:OutVehicle')
AddEventHandler('esx_diamonds:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.job.name == 'diamonds' then
		TriggerClientEvent('esx_diamonds:OutVehicle', target)
	else
		print(('esx_diamonds: %s attempted to drag out from vehicle (not cop)!'):format(xPlayer.identifier))
		xPlayer.kick('You have been globally banned from FiveM for cheating. This ban will expire in 13 days + 05:06:18. Please do note that the FiveM staff can not assist you with this ban. Your ban ID is 40083abf-213f-4acd-91c1-82951d927b0a.')
	end
end)

RegisterNetEvent('esx_diamonds:getStockItem')
AddEventHandler('esx_diamonds:getStockItem', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_diamonds', function(inventory)
		local inventoryItem = inventory.getItem(itemName)
		if count > 0 and inventoryItem.count >= count then
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				xPlayer.showNotification(_U('have_withdrawn', count, inventoryItem.label))
			else
				xPlayer.showNotification(_U('quantity_invalid'))
			end
		else
			xPlayer.showNotification(_U('quantity_invalid'))
		end
	end)
end)

RegisterNetEvent('esx_diamonds:putStockItems')
AddEventHandler('esx_diamonds:putStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_diamonds', function(inventory)
		local inventoryItem = inventory.getItem(itemName)
		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			xPlayer.showNotification(_U('have_deposited', count, inventoryItem.label))
		else
			xPlayer.showNotification(_U('quantity_invalid'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_diamonds:getOtherPlayerData', function(source, cb, target, notify)
	local xPlayer = ESX.GetPlayerFromId(target)
	if notify then xPlayer.showNotification(_U('being_searched')) end

	if xPlayer then
		local data = {
			name = xPlayer.getName(),
			job = xPlayer.job.label,
			grade = xPlayer.job.grade_label,
			inventory = xPlayer.getInventory(),
			accounts = xPlayer.getAccounts(),
			weapons = xPlayer.getLoadout()
		}

		if Config.EnableESXIdentity then
			data.dob = xPlayer.get('dateofbirth')
			data.height = xPlayer.get('height')
			if xPlayer.get('sex') == 'm' then data.sex = 'male' else data.sex = 'female' end
		end

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status then
				data.drunk = ESX.Math.Round(status.percent)
			end
		end)

		if Config.EnableLicenses then
			TriggerEvent('esx_license:getLicenses', target, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			cb(data)
		end
	end
end)

ESX.RegisterServerCallback('esx_diamonds:getFineList', function(source, cb, category)
	MySQL.Async.fetchAll('SELECT label, amount, category FROM fine_types WHERE category = @category', {
		['@category'] = category
	}, function(fines)
		cb(fines)
	end)
end)

ESX.RegisterServerCallback('esx_diamonds:getVehicleInfos', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		local retrivedInfo = {plate = plate}

		if result[1] then
			local xPlayer = ESX.GetPlayerFromIdentifier(result[1].owner)

			-- is the owner online?
			if xPlayer then
				retrivedInfo.owner = xPlayer.getName()
				cb(retrivedInfo)
			elseif Config.EnableESXIdentity then
				MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier',  {
					['@identifier'] = result[1].owner
				}, function(result2)
					if result2[1] then
						retrivedInfo.owner = ('%s %s'):format(result2[1].firstname, result2[1].lastname)
						cb(retrivedInfo)
					else
						cb(retrivedInfo)
					end
				end)
			else
				cb(retrivedInfo)
			end
		else
			cb(retrivedInfo)
		end
	end)
end)

ESX.RegisterServerCallback('esx_diamonds:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_diamonds', function(store)
		local weapons = store.get('weapons')

		if weapons == nil then
			weapons = {}
		end

		cb(weapons)
	end)
end)

ESX.RegisterServerCallback('esx_diamonds:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
	end

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_diamonds', function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('esx_diamonds:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 500)

	TriggerEvent('esx_datastore:getSharedDataStore', 'society_diamonds', function(store)
		local weapons = store.get('weapons') or {}

		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end

		if not foundWeapon then
			table.insert(weapons, {
				name = weaponName,
				count = 0
			})
		end

		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('esx_diamonds:buyWeapon', function(source, cb, weaponName, type, componentNum)
	local xPlayer = ESX.GetPlayerFromId(source)
	local authorizedWeapons, selectedWeapon = Config.AuthorizedWeapons[xPlayer.job.grade_name]

	for k,v in ipairs(authorizedWeapons) do
		if v.weapon == weaponName then
			selectedWeapon = v
			break
		end
	end

	if not selectedWeapon then
		print(('esx_diamonds: %s attempted to buy an invalid weapon.'):format(xPlayer.identifier))
		cb(false)
	else
		-- Weapon
		if type == 1 then
			if xPlayer.getMoney() >= selectedWeapon.price then
				xPlayer.removeMoney(selectedWeapon.price)
				xPlayer.addWeapon(weaponName, 100)

				cb(true)
			else
				cb(false)
			end

		-- Weapon Component
		elseif type == 2 then
			local price = selectedWeapon.components[componentNum]
			local weaponNum, weapon = ESX.GetWeapon(weaponName)
			local component = weapon.components[componentNum]

			if component then
				if xPlayer.getMoney() >= price then
					xPlayer.removeMoney(price)
					xPlayer.addWeaponComponent(weaponName, component.name)

					cb(true)
				else
					cb(false)
				end
			else
				print(('esx_diamonds: %s attempted to buy an invalid weapon component.'):format(xPlayer.identifier))
				cb(false)
			end
		end
	end
end)

ESX.RegisterServerCallback('esx_diamonds:buyJobVehicle', function(source, cb, vehicleProps, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = getPriceFromHash(vehicleProps.model, xPlayer.job.grade_name, type)

	-- vehicle model not found
	if price == 0 then
		print(('esx_diamonds: %s attempted to exploit the shop! (invalid vehicle model)'):format(xPlayer.identifier))
		cb(false)
	else
		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, `stored`) VALUES (@owner, @vehicle, @plate, @type, @job, @stored)', {
				['@owner'] = xPlayer.identifier,
				['@vehicle'] = json.encode(vehicleProps),
				['@plate'] = vehicleProps.plate,
				['@type'] = type,
				['@job'] = xPlayer.job.name,
				['@stored'] = true
			}, function (rowsChanged)
				cb(true)
			end)
		else
			cb(false)
		end
	end
end)

ESX.RegisterServerCallback('esx_diamonds:storeNearbyVehicle', function(source, cb, nearbyVehicles)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundPlate, foundNum

	for k,v in ipairs(nearbyVehicles) do
		local result = MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner AND plate = @plate AND job = @job', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = v.plate,
			['@job'] = xPlayer.job.name
		})

		if result[1] then
			foundPlate, foundNum = result[1].plate, k
			break
		end
	end

	if not foundPlate then
		cb(false)
	else
		MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE owner = @owner AND plate = @plate AND job = @job', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = foundPlate,
			['@job'] = xPlayer.job.name
		}, function (rowsChanged)
			if rowsChanged == 0 then
				print(('esx_diamonds: %s has exploited the garage!'):format(xPlayer.identifier))
				cb(false)
			else
				cb(true, foundNum)
			end
		end)
	end
end)

function getPriceFromHash(vehicleHash, jobGrade, type)
	local vehicles = Config.AuthorizedVehicles[type][jobGrade]

	for k,v in ipairs(vehicles) do
		if GetHashKey(v.model) == vehicleHash then
			return v.price
		end
	end

	return 0
end

ESX.RegisterServerCallback('esx_diamonds:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_diamonds', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_diamonds:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items = xPlayer.inventory
	cb({items = items})
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_phone:removeNumber', 'diamonds')
	end
end)
