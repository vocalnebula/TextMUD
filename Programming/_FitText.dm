proc/Fit_Text(Message,Font_Color = "Yellow",HTML = 0,Character_Limit = 50,Outer_Symbol = "#",Inner_Symbol = "-")
	var
		Snippet
		Characters = lentext(Message)
		Spacious = Character_Limit - 4
	if(HTML)
		Characters = lentext(Filter_HTML(Message))
	while(1)
		Snippet += "<br>"
		if(Characters >= Spacious)
			var
				First_Half
			First_Half = copytext(Message,1,Spacious + 1)
			Message = copytext(Message,Spacious + 1,Characters + 1)
			if(HTML)
				Characters = lentext(Filter_HTML(Message))
			else
				Characters = lentext(Message)
			var/list/Punctuations = list(". ","? ","! ")
			var/Punctuate = 0
			for(var/P in Punctuations)
				if(findtext(First_Half,P))
					Punctuate = 1
					Snippet += "[Outer_Symbol][Inner_Symbol]<font color=[Font_Color]>[First_Half]</font>[Outer_Symbol]"
			if(!Punctuate)
				Snippet += "[Outer_Symbol][Inner_Symbol]<font color=[Font_Color]>[First_Half]</font>[Inner_Symbol][Outer_Symbol]"
		else
			var
				Inside_Amount = 0
				Left = 0
				Right = 0
			Inside_Amount = Spacious - Characters
			if(Inside_Amount % 2)
				Left = (round(Inside_Amount / 2)) + 1
				Right = (round(Inside_Amount / 2))
			else
				Left = round(Inside_Amount / 2)
				Right = round(Inside_Amount / 2)
			Snippet += "[Outer_Symbol]"
			for(var/I = 1, I <= Left, I ++)
				Snippet += "[Inner_Symbol]"
			Snippet += "[Inner_Symbol]<font color=[Font_Color]>[Message]</font>[Inner_Symbol]"
			for(var/I = 1, I <= Right, I ++)
				Snippet += "[Inner_Symbol]"
			Snippet += "[Outer_Symbol]"
			break
	return Snippet
proc/Filter_HTML(Message)
	var/Snippet
	if(findtext(Message,"<"))
		while(1)
			if(findtext(Message,"<"))
				var
					Start = findtext(Message,"<")
					End = findtext(Message,">")
					Before = copytext(Message,1,Start)
				Snippet += "[Before]"
				Message = copytext(Message,End + 1,lentext(Message) + 1)
			else
				Snippet += "[Message]"
				break
	else
		Snippet = Message
	return Snippet