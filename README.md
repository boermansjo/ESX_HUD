# ESX_HUD
Working version of Naiko's script.
https://github.com/Naikzer/HUD-GTAVRP

All credits go to him.

## How to install

!!!If you plan to use skinchanger, you don't need to import this!!!

* Import ```outfits.sql``` to your database 

!!!!!

* Copy and paste ```skincreator``` folder to ```resources```
* Add ```start skincreator``` to your ```server.cfg``` file

* Open ```esx_identity\client\main.lua```
* Find ```TriggerEvent('esx_skin:openSaveableMenu', myIdentifiers.id)``` and change it into ```TriggerEvent('hud:loadMenu')```
* Open ```esx_identity\server\main.lua```

!!!If you plan to use skinchanger, you don't need to import this!!!
* Find ```MySQL.Async.execute('INSERT INTO characters [...]``` and add the following just before or after :
```
MySQL.Async.execute("INSERT INTO outfits (idSteam) VALUES (@identifier)", {
		['@identifier']		= identifier
	})
```
!!!!
* Make sure that all the spawnpoints are with the mp_m_freemode_01 model.
 Example : ```spawnpoint 'mp_m_freemode_01' { x = -1044.73, y = -2749.13, z = 21.3634 }```
 
## To Do
* Modifier how data is saved.
* Female skins
* Add locals for easy translation
* Changes in the HTML and CSS. (Now all 3 menus are scrolling at the same time)

## Changes
* HTML, CSS, Javascript changes.
* Camera is still in progress. Can rotate. But formula is still not correct.
* Starting to revamp the entire script !!! Only Hats are working correctly (the legend not yet) The Hat data is also saved via skinchanger.
