# ESX_HUD
Working version of Naiko's script.
https://github.com/Naikzer/HUD-GTAVRP

All credits go to him.

## How to install

* Import ```outfits.sql``` to your database
* Copy and paste ```skincreator``` folder to ```resources```
* Add ```start skincreator``` to your ```server.cfg``` file

* Open ```esx_identity\client\main.lua```
* Find ```TriggerEvent('esx_skin:openSaveableMenu', myIdentifiers.id)``` and change it into ```TriggerEvent('hud:loadMenu')```
* Open ```esx_identity\server\main.lua```
* Find ```MySQL.Async.execute('INSERT INTO characters [...]``` and add the following just before or after :
```
MySQL.Async.execute("INSERT INTO outfits (idSteam) VALUES (@identifier)", {
		['@identifier']		= identifier
	})
```
## To Do
* Modifier how data is saved.
* Fix rotation buttons
* Female skins
* Add locals for easy translation
* Changes in the HTML and CSS. (Now all 3 menus are scrolling at the same time)
