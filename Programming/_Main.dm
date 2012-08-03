var
	list/Names = list()
proc
	Timestamp()
		return time2text(world.timeofday,"hh:mm:ss")
client
	Command(Input)
		var
			Space = findtext(Input," ")
			Command = copytext(Input,1,Space)
			Action = null
			Verb = null
		if(Space)
			Action = copytext(Input,Space + 1,lentext(Input) + 1)
		for(var/V in mob.verbs)
			if(ckey(Command) == V:name)
				call(mob,V:name)(Action)
				Verb = 1
		if(!Verb)
			mob << output("<font color = red><b>Error -</b> Command not recognized.","Communication")
		..(Input)
	New()
		..()
		mob << output(Opening_Message,"Creating")
world/New()
	..()
	world.log = "Errors.txt"
client
	var
		X_Resolution
		Y_Resolution
	proc
		Set_Resolution()
			winset(src,"Resolution","is-maximized=true:size=9999x9999")
			X_Resolution = Get_Window_X_Size(src,"Resolution")
			Y_Resolution = Get_Window_Y_Size(src,"Resolution")

proc
	Center_Window(mob/M,Window)
		if(!M.client)
			return
		winset(M, Window, "pos = [(M.client.X_Resolution/2)-(Get_Window_X_Size(M,Window)/2)],[(M.client.Y_Resolution/2)-(Get_Window_Y_Size(M,Window)/2)]")
	Get_Window_X_Size(mob/M,Window)
		var/Window_Size = winget(M,Window,"size")
		var/X_Position = findtext(Window_Size, "x")
		var/WX = copytext(Window_Size, 1, X_Position)
		return text2num(WX)
	Get_Window_Y_Size(mob/M,Window)
		var/Window_Size = winget(M,Window,"size")
		var/X_Position = findtext(Window_Size, "x")
		var/WY = copytext(Window_Size, X_Position+1, 0)
		return text2num(WY)


