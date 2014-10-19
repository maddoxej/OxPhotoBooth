OxPhotoBooth
============

Take 4 pictures on a Canon camera using a CHKD script in BASIC

[Canon Hack Development Kit](http://chdk.wikia.com/wiki/CHDK)

Installation
------------
After installing the CHKD firmware on to an SD card. Copy the script OxPhotoBooth.BAS to the SD card in the folder \CHDK\SCRIPTS. 

I used an external button to trigger the picture taking, but it is not necessary. 
To enable an external button that uses the USB port: 
----------------------------------------------------
* Select menu, CHKD Settings, Remote parameters.
* Set Enable remote,
* Set switch Type = OnePush
* Set control Mode = Normal
* Set Enable Script Start
* Plug the USB cord with button into a power supply, and the camera's USB port. You will not be able to use the USB cord with switch to transfer files to a computer. The USB cord does not charge the camera. 
Once the button is enabled, the CHKD settings are saved to the SD card and do not need to be reset.


Setting up for shooting
-----------------------
This needs to be done each time the camera is turned off.

* Install SD card.
* Turn on camera in play mode. (this will not work if the lense is out)
* hit menu. Choose firmware update (last option). Hit OK.
 CHKD will load and display startup screen. (Firmware will not be updated)
* press printer button ( not a long press) - that enters ALT mode. OxPhotoBooth should be displayed in the bottom.

* Turn the dial to switch the camera to Auto picture mode.

* press the switch, or the regular shutter button. The camera will wait 3 seconds, then take 4 pictures. 
The pictures are saved to the SD Card. 


CHKD allows sending parameters to the script. These are configured using the menu on the camera. 
Parameters 
----------

start delay (sec)
> Before taking the first picture the camera counts down in seconds 3 ... 2 ... 1. There may be an additional delay as the camera has to charge the flash before shooting the first picture. The default is 3 seconds. 

time between shots (sec)
> The minimum time between each of the pictures, given in seconds. The default is 3 seconds. This makes the cadence consistent, as the time to charge the flash between pictures is inconsistent. 

Debug and timing
> Check this box to include more timing information on the screen. The information is also appended to a file on the SD card \CHDK\LOGS\LOG_0002.TXT

