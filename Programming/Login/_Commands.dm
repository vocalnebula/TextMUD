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
					var/Spaced = findtext(Snippet," ",1)
					Spaces ++
					Snippet = copytext(Snippet,Spaced + 1, lentext(Snippet) + 1)
				else
					break
			if(Spaces > 1)
				Window_Refresh(usr,0,null,"SelectionO",Invalid_Format)
				return
			var/list/Races = list()
			for(var/V in typesof(/Race))
				if(V == "Race/")
					return
				var/Race/R = text2path("[V]")
				Races += new R
			Action = copytext(T,1,Space)
			Race = copytext(T,Space + 1, lentext(T) + 1)
			switch(ckey(Action))
				if("view")
					for(var/Race/R in Races)
						if(ckey(R.Name) == ckey(Race))
							var/Message = {"
							<center>##################################################
								<br>#------------------------------------------------#
								<br>#------------------------------------------------#
								<br>#------------------- <u><font color = red>+ [R.Name] +</u> ------------------#
								<br>
								<br><font color = yellow>[R.Description]</font>
								<br>
								<br>#----------------- <u><font color = blue>+ Alliances +</font></u> ----------------#
								<br>
							"}
							for(var/V in R.Alliances)
								Message += "<br><font color = yellow>[V]</font>"
							Message += {"
								<br>
								<br>#------------------------------------------------#
								<br>#--- <font color = yellow>To pick this race, simply type <font color = green>pick</font> <font color = #9900CC>[R.Name]</font></font> --#
								<br>#- <font color = yellow>To return to the selection screen, type <font color = green>back</font></font> -#
								<br>#------------------------------------------------#
								<br>#------------------------------------------------#
								<br>##################################################
							"}
							Window_Refresh(usr,0,null,"SelectionO",Message)
							return
				if("pick")
					world << output("pick","SelectionO")
				if("back")
					Window_Refresh(usr,0,null,"SelectionO",Race_Selection)
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
					<br><font color = red>[T]</font>
					<br>#------------------------------------------------#
					<br>#---- <font color = yellow>Type <font color = green>yes</font> to confirm and <font color = green>no</font> to decline</font> -----#
					<br>#------------------------------------------------#
					<br>#------------------------------------------------#
					<br>##################################################
				"}
				Window_Refresh(usr,"Answer","CreatingType","Creating",Ensure_Message)
				usr.name = T
				global.Names += T


