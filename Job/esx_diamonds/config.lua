Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true 
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true
Config.EnableLicenses             = true

Config.EnableHandcuffTimer        = false -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 10 * 60000 -- 10 minutes.

Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = false -- Enable esx service?
Config.MaxInService               = -1 -- How much people can be in service at once?

Config.Locale                     = 'de'

Config.diamondsStations = {
	LSPD = {
		Blip = {
			Coords  = vector3(-2646.97, 1317.58, 148.17),
			Sprite  = 617,
			Display = 4,
			Scale   = 1,
			Colour  = 46
		},

		Cloakrooms = {
			vector3(-2674.27, 1304.46, 152.01)
		},

		Armories = {
			vector3(-2678.58, 1334.69, 140.88)
		},

		Vehicles = {
			{
				Spawner = vector3(-2668.35, 1309.87, 147.12),
				InsideShop = vector3(-2671.87, 1342.08, 156.93),
				SpawnPoints = {
					{coords = vector3(-2667.1, 1305.1, 147.12), heading = 276.42, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
                Spawner = vector3(-2634.23, 1381.54, 137.57)
                InsideShop = vector3(-2678.41, 1306.01, 156.93)
                SpawnPoints = {
                    {coords = vector3(-2647.45, 1381.54, 139.11), heading = 270.0, radius = 10.0}
                }
			}
		},

		BossActions = {
            vector3(-2671.84, 1334.91, 144.26)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{weapon = 'WEAPON_PISTOL_MK2', components = {0, 0, 1000, 4000, nil}, price = 1000},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	officer = {
		{weapon = 'WEAPON_PISTOL_MK2', components = {0, 0, 1000, 4000, nil}, price = 1000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 1000},
		{weapon = 'WEAPON_SWITCHBLADE', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	sergeant = {
		{weapon = 'WEAPON_PISTOL_MK2', components = {0, 0, 1000, 4000, nil}, price = 1000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 1000},
		{weapon = 'WEAPON_MINISMG', price = 0},
		{weapon = 'WEAPON_SWITCHBLADE', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	lieutenant = {
		{weapon = 'WEAPON_PISTOL_MK2', components = {0, 0, 1000, 4000, nil}, price = 1000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 1000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 1000},
		{weapon = 'WEAPON_MINISMG', price = 0},
		{weapon = 'WEAPON_SWITCHBLADE', price = 0},
		{weapon = 'WEAPON_PISTOL50', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	boss = {
		{weapon = 'WEAPON_PISTOL_MK2', components = {0, 0, 1000, 4000, nil}, price = 1000},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 1000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 1000},
		{weapon = 'WEAPON_MINISMG', price = 0},
		{weapon = 'WEAPON_SWITCHBLADE', price = 0},
		{weapon = 'WEAPON_PISTOL50', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {},

		officer = {
			{model = 'bmci', price = 0}
		},

		sergeant = {
			{model = 'bmci', price = 0}
		},

		lieutenant = {
			{model = 'bmci', price = 0},
			{model = 'lamg', price = 0}
		},

		boss = {
			{model = 'bmci', price = 0},
			{model = 'lamg', price = 0}
		}
	},

	helicopter = {
		recruit = {},

		officer = {
			{model = 'havok', props = {modLivery = 0}, price = 10000}
		},

		sergeant = {
			{model = 'havok', props = {modLivery = 0}, price = 10000}
		},

		lieutenant = {
			{model = 'havok', props = {modLivery = 0}, price = 0},
			{model = 'volatus', props = {modLivery = 0}, price = 0},
			{model = 'swift2', props = {modLivery = 0}, price = 0}
		},

		boss = {
			{model = 'havok', props = {modLivery = 0}, price = 0},
			{model = 'volatus', props = {modLivery = 0}, price = 0},
			{model = 'swift2', props = {modLivery = 0}, price = 0}
		}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			tshirt_1 = 33,  tshirt_2 = 0,
			torso_1 = 29,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 12,
			pants_1 = 24,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 41,  tshirt_2 = 2,
			torso_1 = 7,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 3,
			pants_1 = 23,   pants_2 = 10,
			shoes_1 = 6,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 33,  tshirt_2 = 0,
			torso_1 = 29,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 12,
			pants_1 = 24,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 41,  tshirt_2 = 2,
			torso_1 = 7,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 3,
			pants_1 = 23,   pants_2 = 10,
			shoes_1 = 6,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 33,  tshirt_2 = 0,
			torso_1 = 29,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 12,
			pants_1 = 24,   pants_2 = 0,
			shoes_1 = 10,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 41,  tshirt_2 = 2,
			torso_1 = 7,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 3,
			pants_1 = 23,   pants_2 = 10,
			shoes_1 = 6,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 31,  tshirt_2 = 0,
			torso_1 = 29,   torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 12,
			pants_1 = 24,   pants_2 = 5,
			shoes_1 = 20,   shoes_2 = 3,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 38,  tshirt_2 = 0,
			torso_1 = 7,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 3,
			pants_1 = 23,   pants_2 = 0,
			shoes_1 = 6,   shoes_2 = 2,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 31,  tshirt_2 = 0,
			torso_1 = 29,   torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 12,
			pants_1 = 24,   pants_2 = 5,
			shoes_1 = 20,   shoes_2 = 3,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 38,  tshirt_2 = 0,
			torso_1 = 7,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 3,
			pants_1 = 23,   pants_2 = 0,
			shoes_1 = 6,   shoes_2 = 2,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	}
}
