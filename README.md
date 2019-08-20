# ESX_HUD
Working version of Naiko's script.
https://github.com/Naikzer/HUD-GTAVRP

All credits go to him.

## How to install

* Copy and paste ```skincreator``` folder to ```resources```
* Add ```start skincreator``` to your ```server.cfg``` file

* Open ```esx_identity\client\main.lua```
* Find ```TriggerEvent('esx_skin:openSaveableMenu', myIdentifiers.id)``` and change it into ```TriggerEvent('hud:loadMenu')```

* Make sure that all the spawnpoints are with the mp_m_freemode_01 model.
 Example : ```spawnpoint 'mp_m_freemode_01' { x = -1044.73, y = -2749.13, z = 21.3634 }```
 
## To Do
* Female skins
* Clean-up code

## Changes
* HTML, CSS, Javascript changes.
* Camera is now fixed.
* Starting to revamp the entire script !!! Only Hats are working correctly (the legend not yet) The Hat data is also saved via skinchanger.
* Character now loads correctly after the initial login.
