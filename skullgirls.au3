#include <Misc.au3>

Func press($key, $updown)
	Send("{" & $key & " " & $updown & "}")
EndFunc
Func tutorial_prep($delay = 500, $move_delay = 500)
	Sleep($delay)
	$prev = Opt("SendKeyDownDelay",200)
	Send("a")
	Sleep(1000)
	move_right($move_delay)
	Opt("SendKeyDownDelay", $prev)
EndFunc
Func move($direction, $delay = 500)
	press($direction,"down")
	Sleep($delay)
	press($direction,"up")
EndFunc
Func move_right($delay = 500)
	move("RIGHT", $delay)
EndFunc
Func move_left($delay = 500)
	move("LEFT", $delay)
EndFunc

; Generic
Func throw($delay = 2000, $hold = "")
	$opt1 = Opt("SendKeyDelay",0)
	$opt2 = Opt("SendKeyDownDelay",0)
	If $hold <> ""

	EndIf
	Send("{a DOWN}{z DOWN}")
	Sleep(200)
	Send("{a UP}{z UP}")
	Opt("SendKeyDelay",$opt1)
	Opt("SendKeyDownDelay",$opt2)
	Sleep(2000)
EndFunc

; Filia
Func hairball()
	Opt("SendKeyDelay",0)
	Opt("SendKeyDownDelay",5)
	press("DOWN","down")
	Sleep(50)
	press("LEFT", "down")
	Sleep(50)
	press("DOWN","up")
	Send("c")
	press("LEFT","up")
	Sleep(450)
EndFunc
Func sampson()
	Opt("SendKeyDelay",0)
	Opt("SendKeyDownDelay",5)
	press("DOWN","down")
	Sleep(50)
	press("LEFT", "down")
	Sleep(50)
	press("DOWN","up")
	press("c","down")
	press("x","down")
	Sleep(50)
	press("c","up")
	press("x","up")
	press("LEFT","up")
	Sleep(50)
EndFunc

; Tutorial ch2.4
Func tutorial24()
	;jhp, clk
	;clk, <- + hk
	;jhp, clk, cmk, chk
	Opt("SendKeyDelay",0)
	Opt("SendKeyDownDelay",250)
	tutorial_prep(0,1000)
	Send("{UP}d")
	Sleep(150)
	Send("{DOWN down}z")
	Opt("SendKeyDownDelay",200)
	tutorial_prep(2000, 1000)
	Send("z{DOWN up}{LEFT down}c{LEFT up}")
	tutorial_prep(6000,6000)
	While not _IsPressed(51) ; do until q is pressed
		Send("{UP}")
		Sleep(150)
		Send("d")
		Sleep(200)
		Opt("SendKeyDownDelay",250)
		Send("{DOWN down}zx{DOWN up}")
		Send("{LEFT down}c{LEFT up}")
		move_right(2000)
		Sleep(1000)
	Wend
EndFunc

; Tutorial ch2.5
Func tutorial25()
	;throw x3
	For $i = 1 To 3
		throw(2500)
	Next
EndFunc

; Tutorial ch3.3
Func tutorial33_1()
	;hk, hairball
	Opt("SendKeyDelay",0)
	Opt("SendKeyDownDelay",250)
	Send("c")
	hairball()
EndFunc
Func tutorial33_2()
	;hk, sampson
	Opt("SendKeyDelay",0)
	Opt("SendKeyDownDelay",250)
	Send("c")
	sampson()
EndFunc
Func tutorial33_3()
	;hairball, sampson
	hairball()
	sampson()
EndFunc
Func tutorial33_4()
	;lp, lk, mk, hk, hairball, sampson
	Opt("SendKeyDelay",0)
	Opt("SendKeyDownDelay",250)
	press("RIGHT","down")
	Send("azxc")
	press("RIGHT","up")
	hairball()
	sampson()
EndFunc
Func tutorial33()
	tutorial_prep(1000)
	tutorial33_1()
	tutorial_prep(6000)
	tutorial33_2()
	tutorial_prep(6000)
	tutorial33_3()
	tutorial_prep(8000,2000)
	tutorial33_4()
EndFunc

; Tutorial ch3.4
Func tutorial34_1()
	; hp, jump, hp
	Opt("SendKeyDelay",0)
	Opt("SendKeyDownDelay",250)
	press("RIGHT","down")
	Send("d{UP}d")
	press("RIGHT","up")
EndFunc
Func tutorial34_2()
	; hp, jump, lp, lk, hk
	Opt("SendKeyDelay",0)
	Opt("SendKeyDownDelay",250)
	press("RIGHT","down")
	Send("d{UP}azc")
	press("RIGHT","up")
EndFunc
Func tutorial34_3()
	; hp, jump, lp, lk, mk, hairball
	Opt("SendKeyDelay",0)
	Opt("SendKeyDownDelay",250)
	press("RIGHT","down")
	Send("d{UP}azx")
	press("RIGHT","up")
	Sleep(200)
	hairball()
EndFunc
Func tutorial34_4()
	; lp, lk, mk, hp, jump, lp, lk, mk, hairball, sampson
	Opt("SendKeyDelay",0)
	press("RIGHT","down")
	Opt("SendKeyDownDelay",200)
	Send("azxd{UP}")
	Sleep(150)
	Opt("SendKeyDownDelay",200)
	Send("azx")
	press("RIGHT","up")
	Sleep(200)
	hairball()
	sampson()
EndFunc
Func tutorial34()
	tutorial_prep(1000)
	tutorial34_1()
	tutorial_prep(2500)
	tutorial34_2()
	tutorial_prep(2500)
	tutorial34_3()
	tutorial_prep(2500)
	tutorial34_4()
EndFunc

Func tutorial41_1()
; jump, hk, stand, mp
EndFunc

HotKeySet("{F1}", "tutorial25")

While 1
WEnd