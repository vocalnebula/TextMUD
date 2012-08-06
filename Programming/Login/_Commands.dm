client
	verb
		Answer(T as text)
			if(!T)
				return
			switch(ckey(T))
				if("no")
					global.Names -= usr.name
					usr.name = null
					Window_Refresh(usr,"Name","CreatingType","Creating",Name_Message)
				if("yes")
					Window_Refresh(usr,"Race","CreatingType","Creating",Race_Message)
		Race(T as text)
			if(!T)
				return
			if(ckey(T) != "continue")
				return
			winshow(usr,"Creation",0)
			winshow(usr,"Selections",1)
			winset(usr,"Selection","focus=true")
			Window_Refresh(usr,0,null,"SelectionO",Race_Selection)
		Creation(T as text)
			if(!T)
				return
			if(findtext(T," "))
				return
			switch(ckey(T))
				if("create")
					Window_Refresh(usr,"Name","CreatingType","Creating",Name_Message)
				if("quit")
					del(usr)
		Name(T as text)
			if(!T)
				return
			if(ckey(T) == "back")
				Window_Refresh(usr,"Creation","CreatingType","Creating",Opening_Message)
			else
				var/Spaces
				var/list/Illegal = list("!","@","#","$","%","^","&","*","(",")","_","-","+","=","1","2","3","4","5",
				"6","7","8","9","0","`","~","/","\\","<",",",">",".","?",":",";","'","\"","\[","]","{","}")
				for(var/I in Illegal)
					if(findtext(T,I))
						Window_Refresh(usr,0,null,"CreatingType","Creating",Illegal_Error)
						usr << output(null,"Creating")
						usr << output(Illegal_Error,"Creating")
						return
				if(lentext(T) < 6 || lentext(T) > 22)
					Window_Refresh(usr,0,null,"Creating",Length_Error)
					return
				var/Snippet = T
				while(1)
					if(findtext(Snippet," "))
						var/Space = findtext(Snippet," ")
						Spaces ++
						Snippet = copytext(Snippet,Space + 1,lentext(Snippet) + 1)
					else
						break
				if(Spaces > 2)
					Window_Refresh(usr,0,null,"Creating",Space_Error)
					return
				if(Names.Find(ckey(T)))
					Window_Refresh(usr,0,null,"Creating",Name_Error)
					return
				var/Ensure_Message = {"
				<center>##################################################
					<br>#------------------------------------------------#
					<br>#------------------------------------------------#
					<br>#----------------- <font color = yellow>Is your name</font> -----------------#
					[Fit_Text(T,"White")]
					<br>#------------------------------------------------#
					<br>#---- <font color = yellow>Type <font color = green>yes</font> to confirm and <font color = green>no</font> to decline</font> -----#
					<br>#------------------------------------------------#
					<br>#------------------------------------------------#
					<br>##################################################
				"}
				Window_Refresh(usr,"Answer","CreatingType","Creating",Ensure_Message)
				usr.name = T
				global.Names += T


