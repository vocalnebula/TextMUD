client
	verb
		RaceChoose(T as text)
			if(!T)
				return
			var
				Action = null
				Space = findtext(T," ")
				Race = null
				Snippet = T
				Spaces = 0
			while(1)
				if(findtext(Snippet," "))
					Spaces ++
					Snippet = copytext(Snippet,findtext(Snippet," ") + 1, lentext(Snippet) + 1)
				else
					break
			if(Spaces >= 2)
				Window_Refresh(usr,0,"SelectionO",Invalid_Format)
				return
			Action = copytext(T,1,Space)
			Race = copytext(T,Space + 1, lentext(T) + 1)
			switch(ckey(Action))
				if("view")
					world << output("view","SelectionO")
				if("pick")
					world << output("pick","SelectionO")
		Answer(T as text)
			if(!T)
				return
			switch(ckey(T))
				if("no")
					global.Names -= usr.name
					usr.name = null
					winset(usr,"CreatingType","command=\"Name\"")
					usr << output(null,"Creating")
					usr << output(Name_Message,"Creating")
				if("yes")
					winset(usr,"CreatingType","command=\"Race\"")
					usr << output(null,"Creating")
					usr << output(Race_Message,"Creating")
		Race(T as text)
			if(!T)
				return
			if(ckey(T) != "continue")
				return
			winshow(usr,"Creation",0)
			winshow(usr,"Selections",1)
			usr << output(null,"SelectionO")
			usr << output(Race_Selection,"SelectionO")
		Creation(T as text)
			if(!T)
				return
			if(findtext(T," "))
				return
			switch(ckey(T))
				if("create")
					winset(usr,"CreatingType","command=\"Name\"")
					usr << output(null,"Creating")
					usr << output(Name_Message,"Creating")
				if("quit")
					del(usr)
		Name(T as text)
			if(!T)
				return
			if(ckey(T) == "back")
				winset(usr,"CreatingType","command=\"Creation\"")
				usr << output(null,"Creating")
				usr << output(Opening_Message,"Creating")
			else
				var/Spaces
				var/list/Illegal = list("!","@","#","$","%","^","&","*","(",")","_","-","+","=","1","2","3","4","5",
				"6","7","8","9","0","`","~","/","\\","<",",",">",".","?",":",";","'","\"","\[","]","{","}")
				for(var/I in Illegal)
					if(findtext(T,I))
						usr << output(null,"Creating")
						usr << output(Illegal_Error,"Creating")
						return
				if(lentext(T) < 6 || lentext(T) > 22)
					usr << output(null,"Creating")
					usr << output(Length_Error,"Creating")
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
					usr << output(null,"Creating")
					usr << output(Space_Error,"Creating")
					return
				if(Names.Find(ckey(T)))
					usr << output(null,"Creating")
					usr << output(Name_Error,"Creating")
					return
				winset(usr,"CreatingType","command=\"Answer\"")
				var/Ensure_Message = {"
				<center>##################################################
					<br>#------------------------------------------------#
					<br>#------------------------------------------------#
					<br>#----------------- <font color = yellow>Is your name</font> -----------------#
					<br><font color = red>[T]</font>
					<br>#------------------------------------------------#
					<br>#---- <font color = yellow>Type <font color = green>yes</font> to confirm and <font color = green>no</font> to decline</font> -----#
					<br>#------------------------------------------------#
					<br>#------------------------------------------------#
					<br>##################################################
				"}
				usr << output(null,"Creating")
				usr.name = T
				global.Names += T
				usr << output(Ensure_Message,"Creating")


