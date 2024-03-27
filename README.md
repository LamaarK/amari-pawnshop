# amari-pawnshop (QB-CORE]
![Amari Pawnshop Logo](https://github.com/LamaarK/amari-pawnshop/assets/65554339/ac3bc668-fca8-483c-bac0-379371dc3340)
User Owned Pawnshop
**Discord https://discord.gg/tEyueSVbFF**

Thank you for taking the time to go through the script. This has taken me a full 5 hours in total to rewrite the script with permission from https://github.com/zlexif/ ZLEXIF (amazing creator)

PLEASE DOWNLOAD THE MLO IN ORDER FOR THE SCRIPT TO WORK :)
https://drive.google.com/drive/folders/15O6FNbG6zT84IMj1SOi8eKUTWpJIhZZ3?usp=sharing

LOCATION COORDS : 177.7606, -1315.865, 28.36774

I have started this script as qb-pawn, but ZLEXIF forked from mine creating his own edit, bringing me back to edit to my liking (although I have removed some Events I feel personally I wont need for my server, but added a NEW FEATURE that will blow your mind!!!!

**FEATURES : SMELTING ITEMS AFTER BREAKING**
[1] SMELTING & BREAKING
[2] CRAFTING
[3] MONEYWASH
[4] STASH COUNTERS, STASHES FOR ITEM KEEPING/STOCK KEEPING & BILLING (jim-payments ready)

This is fully configurable in the CONFIG. 
But first, we need to know what to install and how to do it :)

**STEP 1**
DOWNLOAD THE RESOURCE FROM GITHUB
**STEP 2**
RENAME THE FILE TO amari-pawnshop and ensure in server.cfg AND DELETE qb-pawnshop (you dont need it anymore)
**STEP 3**
add the following to your qb-core/shared/items.lua

    goldnugget                          = { name = 'goldnugget', label = 'Gold Nugget', weight = 500, type = 'item', image = 'goldnugget.png', unique = false, usable = true, shouldClose = true, combinable = nil, description = 'Melt these or break it further to craft something, or sell it for some extra cash'},
    goldliquid                          = { name = 'goldliquid', label = 'Gold Liquid', weight = 500, type = 'item', image = 'goldliquid.png', unique = false, usable = true, shouldClose = true, combinable = nil, description = 'Some Golden Liquid you can mold or craft into something better'},
        goldingot                           = { name = 'goldingot', label = 'Gold Ingot', weight = 1000, type = 'item', image = 'goldingot.png', unique = false, usable = true, shouldClose = true, combinable = nil, description = 'a Heavy Brick of Gold'},

**STEP 4**
COPY THE IMAGES FOUND IN THE FILE TO YOUR html/images of your desired inventory (CURRENTLY SUPPORTS qb-inventory and ps-inventory


**STEP 5**
Restart your server and ENJOY
SCREENSHOTS BELOW / I JUST CANT TAKE VIDEOS, IM NOT GOOD AT IT

![image](https://github.com/LamaarK/amari-pawnshop/assets/65554339/d6920af3-b55f-48c6-a452-ce61f02fa3c6)
![image](https://github.com/LamaarK/amari-pawnshop/assets/65554339/23556684-1ca5-40ac-b390-cdedd7eff3e4)
![image](https://github.com/LamaarK/amari-pawnshop/assets/65554339/f6f0f3d9-1c9e-4248-8ca1-ce7acf6d4b61)
![image](https://github.com/LamaarK/amari-pawnshop/assets/65554339/f722026c-4bc4-4cf6-8c42-1806a819b6f3)
![image](https://github.com/LamaarK/amari-pawnshop/assets/65554339/0ca32179-a2bd-4d63-928e-a2b3611f9ec7)
![image](https://github.com/LamaarK/amari-pawnshop/assets/65554339/fbbdf17f-3b60-4371-b27e-8236a841bf21)
![image](https://github.com/LamaarK/amari-pawnshop/assets/65554339/8876a5b7-c190-4ebe-a785-22a108aa8c47)
![image](https://github.com/LamaarK/amari-pawnshop/assets/65554339/e0a2d8ee-a5bf-4996-a306-ff7da0801d1b)
![image](https://github.com/LamaarK/amari-pawnshop/assets/65554339/f7c66e11-91b9-40c9-b71c-b758f6bde48d)
![image](https://github.com/LamaarK/amari-pawnshop/assets/65554339/c7c456bd-4ad6-4ae9-8a5e-d96ead30383d)

