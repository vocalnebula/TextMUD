mob/Login()
	src.client.Set_Resolution()
	Center_Window(src,"Default")
	Center_Window(src,"Creation")
	Center_Window(src,"Selections")
	..()
proc/Window_Refresh(mob/M,Command,CommandOutput,Output,Message)
	if(Command)
		winset(M,"[CommandOutput]","command=\"[Command]\"")
	M << output(null,"[Output]")
	M << output(Message,"[Output]")
proc/Fit_Text(Message,Font_Color = "Yellow",Character_Limit = 50,Outer_Symbol = "#",Inner_Symbol = "-")
	var
		Snippet
		Characters = lentext(Message)
	while(1)
		Snippet += "<br>"
		if(Characters > Character_Limit - 4)
			var
				First_Half
			First_Half = copytext(Message,1,Character_Limit - 4)
			Characters = lentext(copytext(Message,Character_Limit - 4,lentext(Message) + 1))
			Message = copytext(Message,Character_Limit - 4,lentext(Message) + 1)
			var/list/Punctuations = list(".","!","?")
			var/Punctuate = 0
			for(var/P in Punctuations)
				if(findtext(First_Half,P))
					Punctuate = 1
					Snippet += "[Outer_Symbol][Inner_Symbol] <font color = [Font_Color]>[First_Half]</font> [Outer_Symbol]"
			var
				Commas
				Temporary = First_Half
			while(1)
				if(findtext(Temporary,","))
					Commas ++
					Temporary = copytext(Temporary,findtext(Temporary,",")+1,lentext(Temporary) + 1)
				else
					break
			if(!Punctuate)
				if(Commas == 2)
					Snippet += "[Outer_Symbol][Inner_Symbol] <font color = [Font_Color]>[First_Half]</font> [Inner_Symbol][Outer_Symbol]"
					Punctuate = 1
				if(Commas == 1)
					Snippet += "[Outer_Symbol][Inner_Symbol][Inner_Symbol] <font color = [Font_Color]>[First_Half]</font> [Inner_Symbol][Outer_Symbol]"
					Punctuate = 1
			if(!Punctuate)
				Snippet += "[Outer_Symbol][Inner_Symbol][Inner_Symbol] <font color = [Font_Color]>[First_Half]</font> [Inner_Symbol][Outer_Symbol]"
		else
			var
				Limit = Character_Limit - 4
				Left_Inside_Amount = 0
				Right_Inside_Amount = 0
				Inside_Amount = 0
			Inside_Amount = Limit - Characters
			if(Inside_Amount % 2)
				if(rand(1,2) == 1)
					Left_Inside_Amount = (round(Inside_Amount / 2)) + 1
					Right_Inside_Amount = (round(Inside_Amount / 2))
				else
					Left_Inside_Amount = (round(Inside_Amount / 2))
					Right_Inside_Amount = (round(Inside_Amount / 2)) + 1
			else
				Left_Inside_Amount = Inside_Amount / 2
				Right_Inside_Amount = Inside_Amount / 2
			Snippet += "[Outer_Symbol]"
			for(var/I = 1, I <= Left_Inside_Amount, I ++)
				Snippet += "[Inner_Symbol]"
			Snippet += " <font color = [Font_Color]>[Message]</font> "
			for(var/I = 1, I <= Right_Inside_Amount, I ++)
				Snippet += "[Inner_Symbol]"
			Snippet += "[Outer_Symbol]"
			break
	return Snippet