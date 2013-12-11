Hypercane Build System for OUYA
====
The Hypercane Build System for OUYA is a simple solution to get your Shiva engine games running on the OUYA with full gamepad integration and purchasing support.  The process works as follows.

1. Generate an Android Project Zip from the Shiva UAT
2. Load project zip into Hypercane Build System
3. Press some buttons
4. Run game on OUYA!

Prerequisites
====
You need the following working on your system to be able to build.  If you can't build an android project in the shiva UAT, then you'll need to fix that before you can proceed.

1. Android SDK 4.1.2
2. Android NDK (latest)
3. Ant
4. Java JDK
5. (Optional) ant binary in your path

Authoring Tool Notes
====================
The first step is generating an Android Project from your STK file.  Of particular importance are the following fields in the UAT.

Authoring Tab
--
**Authoring type** should be set to *Project*

**Bundle Identifier** should be the same bundle identifier that is set in the OUYA dev portal for your new game.  If you haven't made a new game yet, then make one in the OUYA dev portal.

![set the bundle id](/screenshots/bundleid.PNG?raw=true)

Build Tab
--
Use the following settings:
```
[ ] Use OpenGLES 1.1
[X] Use 32 bits color buffer
[ ] Use Stencil buffer
Audio Backend: OpenAL
Minimum OS Support: Android 4.1.2 (API level: 16)
```
*Note*: You can disable 32-bit color buffer if needed.  It gives a slight FPS boost in dire situations by sacrificing a bit of visual quality.

Using the Build App (hbsGUI.exe)
============
The app itself is simple to use.  There are 2 windows in the app:

*  The GUI window, where you fill out all the fields

![set the bundle id](/screenshots/finalmenu.PNG?raw=true)
*  The debug window where you see what went wrong

Data Fields
--
###Shiva Configuration

####Project Name
The name that will be given to the output folder for this project.  No spaces, unless you want a slap on the hand.

####UAT Project Zip
The UAT zip file that you generated using the recommended settings above.

####Destination Folder
Where you want the final project to be generated.


###OUYA Settings
####Purchasables
This is where you place a list of your purchasables, comma separated.  For instance on the OUYA dev portal, I've defined these products:
![set the bundle id](/screenshots/purchasables.PNG?raw=true)

So, to add these, I would enter:

```ARC_ALPHA, TEST_ENTITLEMENT```

####Developer ID
You get this from the developer portal front page.

![set the bundle id](/screenshots/developerid.PNG?raw=true)

####Ouya Icon
You need a 732x412 png file for your OUYA icon.  Put the full path here.

####key.der file
You'll find this on the OUYA dev portal in the Games tab.  Just download it and plop it in.

![set the bundle id](/screenshots/keyder.PNG?raw=true)

####Do the Magic
This is where the magic happens, hopefully!  Look at the console menu to see if any of the steps failed.  For instance:
```
---VALIDATING---
[OK] Developer ID
[OK] UAT Project Zip
[OK] Destination folder
[OK] ouya_icon.png
[FAILED] key.der - file does not exist!
```

If all went well, you will see the following message:

```
----Magic Completed----
Your project is ready to build :)
```
At this point you can build with ant from the command line e.g.:

```G:\project>ant "Build debug apk"```

BOOOM!

```adb install -r bin/Game-debug.apk```

If you fizzle rather than boom at this step then your environment isn't setup correctly.  See Prerequisites at the top.

Game Engine Notes
=============

Gamepads
--
OUYA gamepads can be read in the default user AI shiva joypad handlers.  The gamepad shows up as controller type Xbox and the button codes match the xbox controller constants.  See the OuyaGame example for a full example of this.

System Button
--
The OUYA System button is a special case.  Double tapping the System button will open an OUYA menu that lets users exit/pause the game.  Your game has no control over this menu and due to the special way the system button is handled, button pressure events for the system button (input.kJoypadButtonXbox360Start) are always positive.

*What does all this mean!?*  It means that you will never receive an nPressure value of 0 for the System button!  Ever!  So if you actually do anything with the System key, just assume that an nPressure value > 0 means it was pressed.  Don't try to latch or debounce it like you might do with other buttons.

Purchasing
--
Included with the demo project is an AI called OuyaPurchase.  It has everything you need to perform purchases on the OUYA.

###Functions you need to customize

* ```loadEntitlements()``` Put any special logic for reading saved entitlements in an offline situation here.
* ```rewardConsumable()``` Give rewards for consumable purchases here.
* ```rewardReceipts()``` Give rewards for entitlement purchases here.

###How it Works
When initialized, the OuyaPurchase AI does the following:
* Loads saved environment entitlements
* Requests a list of products from the server
* Requests a list of receipts from the server
* Requests the gamer ID

###Listing Items for Sale
To get a list of items that can be purchased you can use the set of tables:

* ```tProductCost``` Cost of item in cents
* ```tProductID``` Product ID as defined on OUYA portal
* ```tProductName``` Product name as defined on OUYA portal

###Example that logs a full product
```
log.message ( "Name: " ..table.getAt ( this.tProductName ( ), nIndex ) 
    .. " with ID: " .. table.getAt ( this.tProductID ( ), nIndex ) 
    .. " costs " .. table.getAt ( this.tProductCost ( ), nIndex ) 
)
```

###Timing
You will know that products are locked and loaded by checking out `onReceiveOuyaProduct()` which will receive an `sID` of `"done"` when all products are loaded.  You can launch an event here or store a boolean or just throw your hands way up in the air and wave 'em around like you just don't care... and you'll probably be ok.

###Making Purchases
To make a purchase you can use 1 of 2 calls.  

If you have the string ID that was defined on the OUYA portal, use call #1: `onRequestOuyaPurchaseByID( sID )` passing in the string ID as defined in the OUYA portal.  

If you have the index in the table of tProduct* for the item you want to buy, use call #2: `onRequestOuyaPurchase( nIndex)` passing in the index that you want to purchase.