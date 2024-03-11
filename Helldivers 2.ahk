#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; Stay open in background
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#include Lib\AutoHotInterception.ahk
#include ShinsImageScanClass\ShinsImageScanClass.ahk
global AHI := new AutoHotInterception()
global imageScan := new ShinsImageScanClass(ahk_class stingray_window)
global keyboardId := AHI.GetKeyboardId(0x0951, 0x16BE)
global mouseId := AHI.GetMouseId(0x046D, 0xC539)
global stratagemsSelected := ["", "", "", ""]

#IfWinActive, ahk_class stingray_window
    ; Bind your hotkeys below.

    ; Common

    *F9::
        ScanStratagems()
    return

    *XButton1::
        UseUnsafeRailgun()
    return

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

    ; Stratagems

    *Numpad0::
        switch (stratagemsSelected[0]) {
        case "StratExoSuit":
            StratExoSuit()
        return
    }
    return

    *Numpad1::
        switch (stratagemsSelected[1]) {
        case "StratArcThrower":
            StratArcThrower()
        return
    }
    return

    *Numpad2::
        switch (stratagemsSelected[2]) {
        case "StratExoSuit":
            StratExoSuit()
        return
    }
    return

    *Numpad3::
        switch (stratagemsSelected[3]) {
        case "StratExoSuit":
            StratExoSuit()
        return
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
        RunKeys(["up", "down", "right", "left"])
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
        RunKeys(["right", "up", "up", "down"]) ;TODO: Update
    }

    ; Patriotic Administration Centre
    StratMachineGun() {
        RunKeys(["down", "left", "down", "up", "right"])
    }
    StratAntiMaterielRifle() {
        RunKeys(["down", "left", "right", "up", "down"])
    }
    StratStalwart() {
        RunKeys([])
    }
    StratExpendableAntiTank() {
        RunKeys(["down", "down", "left", "up", "right"])
    }
    StratRecoillessRifle() {
        RunKeys([])
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
        RunKeys([])
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
        RunKeys([])
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
        RunKeys([])
    }
    StratEagleNapalmStrike() {
        RunKeys(["up", "right", "down", "up"])
    }
    StratJumpPack() {
        RunKeys(["down", "up", "up", "down", "up"])
    }
    StratEagleSmokeStrike() {
        RunKeys([])
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
        RunKeys([])
    }
    StratOrbitalEmsStrike() {
        RunKeys([])
    }
    StratOrbitalSmokeStrike() {
        RunKeys([])
    }
    StratHmgEmplacement() {
        RunKeys(["down", "up", "left", "right", "right", "left"])
    }
    StratShieldGeneratorRelay() {
        RunKeys([])
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
        RunKeys([])
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
    }

    UseRapidFireArcThrower(){
        SendLeftClickDown()
        Sleep, 500
        SendLeftClickUp()
    }

    ScanStratagems(){
        amountFound := 1
        Loop, icons\*.png {
            if (imageScan.Image(A_LoopFileFullPath, 50, x, y)){
                fileName := StrSplit(A_LoopFileName, ".")
                stratagemsSelected[amountFound] := fileName[1]
                amountFound++
            }
            If (amountFound > 4){
                break
            }
        }
        MsgBox % "Stratagems Scaned, Found " stratagemsSelected[1] "," stratagemsSelected[2] "," stratagemsSelected[3] "," stratagemsSelected[4]
    }

    ; Run keyList
    RunKeys(keyList) {
        Random, initialDelay, 40, 50
        SendKeyDown("LControl")
        ;Send {Ctrl Down}
        Sleep, % initialDelay

        For key, value in keyList {
            Random, delay, 40, 50
            Random, pressDuration, 20, 25

            SendKeyDown(value)
            ;Send, {%value% Down}
            Sleep, % pressDuration
            SendKeyUp(value)
            ;Send, {%value% Up}
            Sleep, % delay
        }
        SendKeyUp("LControl")
        ;Send {Ctrl Up}
    }

    SendLeftClickDown()
    {
        AHI.SendMouseButtonEvent(mouseId, 0, 1)
    return
}

SendLeftClickUp()
{
    AHI.SendMouseButtonEvent(mouseId, 0, 0)
    return
}

SendKeyUp(key)
{
    AHI.SendKeyEvent(keyboardId, GetKeySC(key), 0)
    return
}

SendKeyDown(key)
{
    AHI.SendKeyEvent(keyboardId, GetKeySC(key), 1)
    return
}