#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; Stay open in background
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#include Lib\AutoHotInterception.ahk
global AHI := new AutoHotInterception()
global keyboardId := AHI.GetKeyboardId(0x0951, 0x16BE) ; You can get this code with monitor.ahk
global mouseId := AHI.GetMouseId(0x046D, 0xC539) ; You can get this code with monitor.ahk
global stratagems := ""
ReadStratagemsNames()

; Gui
Gui, Add, GroupBox, w250 h125, Stratagems
Gui, Add, Text, x25 y29, Numpad0
Gui, Add, Text, x25 y54, Numpad1
Gui, Add, Text, x25 y79, Numpad2
Gui, Add, Text, x25 y104, Numpad3
Gui, Add, DDL, Choose1 x75 y25 w175 vFirstStratagem gAction, % stratagems
Gui, Add, DDL, Choose2 x75 y50 w175 vSecondStratagem gAction, % stratagems
Gui, Add, DDL, Choose3 x75 y75 w175 vThirdStratagem gAction, % stratagems
Gui, Add, DDL, Choose4 x75 y100 w175 vFourthStratagem gAction, % stratagems
Gui, Show, w275 h150, Easy Stratagems
return

GuiClose:
ExitApp

Action:
    Gui, Submit, NoHide
return

ReadStratagemsNames(){
    Loop, Read, StratagemsNames.txt
    {
        stratagems := stratagems A_LoopReadLine "|"
    }
}

#IfWinActive, ahk_class stingray_window
    ; Bind your hotkeys below.

    ; Global

    ; Weapons
*XButton1::
    UseUnsafeRailgun()
return

*XButton2::
    while GetKeyState("XButton2", "P"){
        UseRapidFireArcThrower()
    }
return

; Common
*NumpadDot::
    StratUploadData()
return

*NumpadEnter::
    StratSeafArtillery()
return

*NumpadDiv::
    StratHellbomb()
return

*NumpadMult::
    StratSosBeacon()
return

*NumpadSub::
    StratReinforce()
return

*NumpadAdd::
    StratResupply()
return

; Hotkeys
*Numpad0::
    if (FirstStratagem != ""){
        %FirstStratagem%()
    }
return

*Numpad1::
    if (SecondStratagem != ""){
        %SecondStratagem%()
    }
return

*Numpad2::
    if (ThirdStratagem != ""){
        %ThirdStratagem%()
    }
return

*Numpad3::
    if (FourthStratagem != ""){
        %FourthStratagem%()
    }
return

*Numpad9::
    StratEagleRearm()
return

; Stratagem functions with key sequences.
; Generic Stratagems
StratReinforce() {
    RunKeys(["up", "down", "right", "left", "up"])
}
StratSosBeacon() {
    RunKeys(["up", "down", "right", "Up"])
}
StratResupply() {
    RunKeys(["down", "down", "up", "right"])
}
StratUploadData() {
    RunKeys(["left", "right", "up", "up", "up"])
}
StratEagleRearm() {
    RunKeys(["up", "up", "left", "up", "right"])
}
StratSeafArtillery() {
    RunKeys(["right", "up", "up", "down"])
}
StratHellbomb() {
    RunKeys(["right", "up", "up", "down"])
}

; Patriotic Administration Centre
StratMachineGun() {
    RunKeys(["down", "left", "down", "up", "right"])
}
StratAntiMaterielRifle() {
    RunKeys(["down", "left", "right", "up", "down"])
}
StratStalwart() {
    RunKeys(["down", "left", "down", "up", "up", "left"])
}
StratExpendableAntiTank() {
    RunKeys(["down", "down", "left", "up", "right"])
}
StratRecoillessRifle() {
    RunKeys(["down", "left", "right", "right", "left"])
}
StratFlamethrower() {
    RunKeys(["down", "left", "up", "down", "up"])
}
StratAutocannon() {
    RunKeys(["down", "left", "down", "up", "up", "right"])
}
StratRailgun() {
    RunKeys(["down", "right", "down", "up", "left", "right"])
}
StratSpear() {
    RunKeys(["down", "down", "up", "down", "down"])
}

; Orbital Cannon
StratOrbitalGatlingBarrage() {
    RunKeys(["right", "down", "left", "up", "up"])
}
StratOrbitalAirburstStrike() {
    RunKeys(["right", "right", "right"])
}
StratOrbital120mmHeBarrage() {
    RunKeys(["right", "right", "down", "left", "right", "down"])
}
StratOrbital380mmHeBarrage() {
    RunKeys(["right", "down", "up", "up", "left", "down", "down"])
}
StratOrbitalWalkingBarrage() {
    RunKeys(["right", "down", "right", "down", "right", "down"])
}
StratOrbitalLaser() {
    RunKeys(["right", "down", "up", "right", "down"])
}
StratOrbitalRailcannonStrike() {
    RunKeys(["right", "up", "down", "down", "right"])
}

; Hangar
StratEagleStrafingRun() {
    RunKeys(["up", "right", "right"])
}
StratEagleAirstrike() {
    RunKeys(["up", "right", "down", "right"])
}
StratEagleClusterBomb() {
    RunKeys(["up", "right", "down", "down", "right"])
}
StratEagleNapalmStrike() {
    RunKeys(["up", "right", "down", "up"])
}
StratJumpPack() {
    RunKeys(["down", "up", "up", "down", "up"])
}
StratEagleSmokeStrike() {
    RunKeys(["up", "right", "up", "down"])
}
StratEagle110mmRocketPods() {
    RunKeys(["up", "right", "up", "left"])
}
StratEagle500kgBomb() {
    RunKeys(["up", "right", "down", "down", "down"])
}

; Bridge
StratOrbitalPrecisionStrike() {
    RunKeys(["right", "right", "up"])
}
StratOrbitalGasStrike() {
    RunKeys(["right", "right", "down", "right"])
}
StratOrbitalEmsStrike() {
    RunKeys(["right", "right", "left", "down"])
}
StratOrbitalSmokeStrike() {
    RunKeys(["right", "right", "down", "up"])
}
StratHmgEmplacement() {
    RunKeys(["down", "up", "left", "right", "right", "left"])
}
StratShieldGeneratorRelay() {
    RunKeys(["down", "down", "left", "right", "left", "right"])
}
StratTeslaTower() {
    RunKeys(["down", "up", "right", "up", "left", "right"])
}

; Engineering Bay
StratAntiPersonnelMinefield() {
    RunKeys(["down", "left", "up", "right"])
}
StratSupplyPack() {
    RunKeys(["down", "left", "down", "up", "up", "down"])
}
StratGrenadeLauncher() {
    RunKeys(["down", "left", "up", "left", "down"])
}
StratLaserCannon() {
    RunKeys(["down", "left", "down", "up", "left"])
}
StratIncendiaryMines() {
    RunKeys(["down", "left", "left", "down"])
}
StratGuardDogRover() {
    RunKeys(["down", "up", "left", "up", "right", "right"])
}
StratBallisticShieldBackpack() {
    RunKeys(["down", "left", "down", "down", "up", "left"])
}
StratArcThrower() {
    RunKeys(["down", "right", "down", "up", "left", "left"])
}
StratShieldGeneratorPack() {
    RunKeys(["down", "up", "left", "right", "left", "right"])
}

; Robotics Workshop
StratMachineGunSentry() {
    RunKeys(["down", "up", "right", "right", "up"])
}
StratGatlingSentry() {
    RunKeys(["down", "up", "right", "left"])
}
StratMortarSentry() {
    RunKeys(["down", "up", "right", "right", "down"])
}
StratGuardDog() {
    RunKeys(["down", "up", "right", "up", "right", "down"])
}
StratAutocannonSentry() {
    RunKeys(["down", "up", "right", "up", "left", "up"])
}
StratRocketSentry() {
    RunKeys(["down", "up", "right", "right", "left"])
}
StratEmsMortarSentry() {
    RunKeys(["down", "up", "right", "down", "right"])-
}
StratExoSuit() {
    RunKeys(["left", "down", "right", "up", "left", "down", "down"])
}

UseUnsafeRailgun(){
    SendLeftClickDown()
    Sleep, 2400
    SendLeftClickUp()
    Sleep, 50
    SendKeyDown("r")
    Sleep, 50
    SendKeyUp("r")
}

UseRapidFireArcThrower(){
    SendLeftClickDown()
    Sleep, 800
    SendLeftClickUp()
}

; Run keyList
RunKeys(keyList) {
    Random, initialDelay, 40, 50
    SendKeyDown("LControl")
    Sleep, % initialDelay

    For key, value in keyList {
        Random, delay, 40, 50
        Random, pressDuration, 20, 25

        SendKeyDown(value)
        Sleep, % pressDuration
        SendKeyUp(value)
        Sleep, % delay
    }
    SendKeyUp("LControl")
}

; AHI
SendLeftClickDown()
{
    AHI.SendMouseButtonEvent(mouseId, 0, 1)
}

SendLeftClickUp()
{
    AHI.SendMouseButtonEvent(mouseId, 0, 0)
}

SendKeyUp(key)
{
    AHI.SendKeyEvent(keyboardId, GetKeySC(key), 0)
}

SendKeyDown(key)
{
    AHI.SendKeyEvent(keyboardId, GetKeySC(key), 1)
}