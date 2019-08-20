# ESX_HUD
Working version of Naiko's script.
https://github.com/Naikzer/HUD-GTAVRP

All credits go to him.

## How to install

* Copy and paste ```skincreator``` folder to ```resources```
* Add ```start skincreator``` to your ```server.cfg``` file

!!!Temporarily you need to do this to get the menu open. Will be changed later!!!
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
* All cloths are saved. Will add a few more options and female only menus.
* Character now loads correctly after the initial login.
