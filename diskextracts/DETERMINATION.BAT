@echo off
title Determination 1.0
echo DETERMINATION
echo by PeanutFish
echo.
echo Press a key for generate a game and play.
: gen
pause>nul
echo Generating...
set /a monsterA=%RANDOM%/(32767/64)
set /a monsterAType=%RANDOM%/(32767/8)
: regenA
set /a monsterB=%RANDOM%/(32767/64)
if %monsterA%==%monsterB% goto regenA
set /a monsterBType=%RANDOM%/(32767/8)
: regenB
set /a monsterC=%RANDOM%/(32767/64)
if %monsterA%==%monsterC% goto regenB
if %monsterB%==%monsterC% goto regenB
set /a monsterCType=%RANDOM%/(32767/8)
: regenC
set /a monsterD=%RANDOM%/(32767/64)
if %monsterA%==%monsterD% goto regenC
if %monsterB%==%monsterD% goto regenC
if %monsterC%==%monsterD% goto regenC
set /a monsterDType=%RANDOM%/(32767/8)
: regenD
set /a monsterE=%RANDOM%/(32767/64)
if %monsterA%==%monsterE% goto regenD
if %monsterB%==%monsterE% goto regenD
if %monsterC%==%monsterE% goto regenD
if %monsterD%==%monsterE% goto regenD
set /a monsterEType=%RANDOM%/(32767/8)
echo Generation Finished!
echo Press any key for start game!
pause>nul
set /p name="Name of the child :"
cls
set /a step=0
set /a hp=20
set /a lv=1
echo Welcome to the underground!
echo.
echo type 'STEP' for go forward.
echo type 'GIVE UP' for give up your route and die.
echo type 'FIGHT' in a fight for fight the monster.
echo type 'SPARE' for try to spare the monster.
: game
echo HP : %hp% LV : %lv% STEP : %step%
echo.
set /p cmd=">"
if "%cmd%"=="STEP" set /a step=step+1
if "%cmd%"=="GIVE UP" goto giveup
if "%cmd%"=="FIGHT" echo You are fighting the air. It fills you with Determination
if "%cmd%"=="SPARE" echo Who are you sparing?
if "%cmd%"=="HEAL" (
echo You healed yourself
set hp=20
)

if %step%==64 goto winners
set cmd=0

if "%step%"=="%monsterA%" goto MonsterAFight
if "%step%"=="%monsterB%" goto MonsterBFight
if "%step%"=="%monsterC%" goto MonsterCFight
if "%step%"=="%monsterD%" goto MonsterDFight
if "%step%"=="%monsterE%" goto MonsterEFight
goto game

: MonsterAFight
set curtype=%MonsterAType%
goto fight
: MonsterBFight
set curtype=%MonsterBType%
goto fight
: MonsterCFight
set curtype=%MonsterCType%
goto fight
: MonsterDFight
set curtype=%MonsterDType%
goto fight
: MonsterEFight
set curtype=%MonsterEType%
goto fight

: fight
set sparestate=0
if %curtype%==0 (
set quote=Tiiny
set curname=Tiny Monster
set curatk=1
set curhp=5
set sparetrig=2
)
if %curtype%==1 (
set quote=Mediium
set curname=Medium Monster
set curatk=2
set curhp=7
set sparetrig=3
)
if %curtype%==2 (
set quote=I'm greater than you
set curname=Great Monster
set curatk=3
set curhp=10
set sparetrig=4
)
if %curtype%==3 (
set quote=Ribbit ribbit!
set curname=Froggit
set curatk=1
set curhp=3
set sparetrig=1
)
if %curtype%==4 (
set quote=Honk. HOOONK!
set curname=Migospel
set curatk=2
set curhp=10
set sparetrig%=4
)
if %curtype%==5 (
set quote=Bark bark!
set curname=Annoying Dog
set curatk=0
set curhp=10000
set sparetrig=1
)
if %curtype%==6 (
set quote=B-BAKA!
set curname=Tsundereplane
set curatk=5
set curhp=10
set sparetrig=3
)
if %curtype%==7 (
set quote=QUOTE_STR_007
set curname=ENTITY_MONSTER_ID_7
set curatk=UKNOWN
set curhp=UKNOWN
set sparetrig=UKNOWN
)

: fightmode
echo.
set /a sparestate=sparestate+1
if %curhp% LEQ 0 if %curhp% NEQ UKNOWN (
echo %curname% Died. You earned 10 HP and
echo your LOVE increased.
set /a lv=lv+1
set /a hp=hp+10
set /a step=step+1
goto game
)

if %hp% LEQ 0 (
echo YOU DIED! Game Over!
echo Hit any key for exit the game.
pause>nul
exit
)

echo %curname% started fight
echo %curname% : %quote%
echo Ennemy's HP : %curhp%
echo Your HPs : %hp%
if %sparestate% GEQ %sparetrig% echo %curname% is sparing you!

echo.
set /p cmd=">"
if %curtype%==7 (
echo ERROR : Monster doesn't exist
set /a step=step+1
goto game
)
if %cmd%==SPARE if %sparestate% GEQ %sparetrig% (
echo You spared %curname%
echo You earned 7 HP
set /a hp=hp+7
set /a step=step+1
goto game
)

if %cmd%==FIGHT (
echo You fighted %curname%
set /a curhp=curhp-lv*4
)

echo %curname% attacked!
set /a hp=hp-curatk

set cmd=0
goto fightmode

: winners
cls
title Determination 1.0 - Congratulations!
if %lv% GEQ 2 goto genocide


echo CONGRATULATION! YOU WON
echo Now you are in the surface and made friends!
pause>nul
exit

: genocide
echo CONGRATULATIONS! YOU W-...
pause>nul
echo ...
pause>nul
echo AGH!
echo * The narrator died
pause>nul
echo ??? : Greetings
pause>nul
echo ??? : I am %name%
pause>nul
echo %name% : Thank you.
pause>nul
echo %name% : Your power awakened me from death.
pause>nul
echo %name% : My "human soul"
pause>nul
echo %name% : My "determination."
pause>nul
echo %name% : They were not mine. but YOURS.
pause>nul
echo %name% : At first. I was so confused.
pause>nul
echo %name% : Our plan had failed. Hadn't it ?
pause>nul
echo %name% : Why was i brought back to life ?
pause>nul
echo %name% : . . .
pause>nul
echo %name% : You.
pause>nul
echo %name% : With your guidance.
pause>nul
echo %name% : I realized the purpose of my reincarnation.
pause>nul
echo %name% : Power.
pause>nul
echo %name% : Together, we erandicated the enemy and became strong.
pause>nul
echo %name% : HP. ATK. LV.
pause>nul
echo %name% : Every time a number increases, that feeling. . .
pause>nul
echo %name% : That's me.
pause>nul
echo %name% : "%name%"
pause>nul
echo %name% : Now, we have reached the absolute.
pause>nul
echo %name% : There is nothing left for us here.
pause>nul
echo %name% : Let us erase this pointless world.
pause>nul
echo * type 'ERASE' for erase this world. Type something else for don't.
set /p c=">"

if "%c%"=="ERASE" goto eraseshit

echo.
echo No? How curious...
pause>nul
echo You must have misunderstood...
pause>nul
echo SINCE WHEN YOU WERE THE ONE IN CONTROL?
pause>nul
echo * Chara slap you fucking hard
pause>nul
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
echo 99999999999999999999999999999999999999999
pause>nul
exit

: eraseshit
echo * You erased this shit
pause>nul
exit


