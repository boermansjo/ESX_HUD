# ESX_HUD
Working version of Naiko's script.
https://github.com/Naikzer/HUD-GTAVRP

All credits go to him.

## How to install

* Copy and paste ```skincreator``` folder to ```resources```
* Add ```start skincreator``` to your ```server.cfg``` file

* Make sure that all the spawnpoints are with the mp_m_freemode_01 model.
 Example : ```spawnpoint 'mp_m_freemode_01' { x = -1044.73, y = -2749.13, z = 21.3634 }```
 
* If you use any other scripts that uses esx_skin. You will have to change the dependencies :
```dependencies { 'es_extended', 'esx_skin' }```
into
```dependencies { 'es_extended', 'skincreator' }```
 
## To Do
* Female skins
* Clean-up code

## Changes
* HTML, CSS, Javascript changes.
* Camera is now fixed.
* All cloths are saved. Will add a few more options and female only menus.
* Character now loads correctly after the initial login.
* All native functions of ESX_SKIN are imported in this script.
