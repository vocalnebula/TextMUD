client
	verb
		ConfirmRace(T as text)
			if(!T)
				return
			if(findtext(T," "))
				T = copytext(T,1,findtext(T," "))
			switch(T)
				if("yes")
					switch(usr.Race_Selection)
						if("Human")
							world << output("Human","DEBUG")
						if("Wakda")
							world << output("Wakda","DEBUG")
						if("Greole")
							world << output("Greole","DEBUG")
				if("no")
					usr.Race_Selection = null
					winset(usr,"Selection","command=\"RaceChoose\"")
					Window_Refresh(usr,0,null,"SelectionO",Race_Selection)
		RaceChoose(T as text)
			if(!T)
				return
			var
				Action = null
				Space = findtext(T," ")
				Command = null
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
			var/list/Classes = list()
			for(var/V in typesof(/Race))
				if(V == "Race/")
					return
				var/Race/R = text2path("[V]")
				Races += new R
			for(var/V in typesof(/Classes))
				if(V == "Classes/")
					return
				var/Classes/C = text2path("[V]")
				Classes += new C
			Action = copytext(T,1,Space)
			Command = copytext(T,Space + 1, lentext(T) + 1)
			switch(ckey(Action))
				if("view")
					for(var/Race/R in Races)
						if(ckey(R.Name) == ckey(Command))
							var/Message = {"
							<center>##################################################
								<br>#------------------------------------------------#
								<br>#------------------------------------------------#
								[Fit_Text(" <u>+ [R.Name] +</u> ","Red",1)]
								[Fit_Text(R.Description)]
								<br>#------------------------------------------------#
								<br>#----------------- <u><font color = #66CCFF>+ Alliances +</font></u> ----------------#
							"}
							for(var/V in R.Alliances)
								Message += "[Fit_Text(V)]"
							Message += {"
								<br>#------------------------------------------------#
								[Fit_Text(" <u>+ Possible Classes +</u> ","#CCFFCC",1)]
							"}
							for(var/V in R.Classes)
								Message += "[Fit_Text(V)]"
							Message += {"
								<br>#------------------------------------------------#
								<br>#--- <font color = yellow>To pick this race, simply type <font color = green>pick</font> <font color = #9900CC>race</font></font> ---#
								[Fit_Text(" To view a class type <font color=green>view</font> <font color=#9900CC>class</font> ","Yellow",1)]
								<br>#- <font color = yellow>To return to the selection screen, type <font color = green>back</font></font> -#
								<br>#------------------------------------------------#
								<br>#------------------------------------------------#
								<br>##################################################
							"}
							Window_Refresh(usr,0,null,"SelectionO",Message)
							return
					for(var/Classes/C in Classes)
						if(ckey(C.Class) == ckey(Command))
							var/Message = {"
							<center>##################################################
								<br>#------------------------------------------------#
								<br>#------------------------------------------------#
								[Fit_Text(" <u>+ [C.Class] +</u> ","#CCFFCC",1)]
								[Fit_Text(C.Description)]
								<br>#------------------------------------------------#
								[Fit_Text(" <u>+ Starting Abilities +</u> ","Green",1)]
							"}
							for(var/V in C.Starting_Abilities)
								Message += "[Fit_Text(V)]"
							Message += {"
								<br>#------------------------------------------------#
								[Fit_Text(" <u>+ Strengths +</u> ","#66CCFF",1)]
							"}
							for(var/A in C.Strengths)
								Message += "[Fit_Text(A)]"
							Message += {"
								<br>#------------------------------------------------#
								[Fit_Text(" <u>+ Weaknesses +</u> ","#CCFFCC",1)]
							"}
							for(var/A in C.Weaknesses)
								Message += "[Fit_Text(A)]"
							Message += {"
								<br>#------------------------------------------------#
								[Fit_Text(" <u>+ Possible Races with Class +</u> ","#9900CC",1)]
							"}
							for(var/A in C.Available_Races)
								Message += "[Fit_Text(A)]"
							Message += {"
								<br>#------------------------------------------------#
								<br>#- <font color=yellow>To selection this class with a race, simply</font> --#
								<br>#------------ <font color=yellow>type <font color=green>pick</font> <font color=#9900CC>race</font> <font color=#9900CC>class</font></font> --------------#
								<br>#- <font color=yellow>To return to the selection process, type <font color=green>back</font></font>-#
								<br>#------------------------------------------------#
								<br>#------------------------------------------------#
								<br>##################################################
							"}
							Window_Refresh(usr,0,null,"SelectionO",Message)
							return
				if("pick")
					for(var/Race/R in Races)
						if(ckey(R.Name) == ckey(Command))
							var/Message = {"
							<center>##################################################
								<br>#------------------------------------------------#
								<br>#------------------------------------------------#
								[Fit_Text(" <font color=red>+</font> <font color=white>[usr.name]</font> the <font color=#9900CC>[R.Name]</font> <font color=red>+</font> ","Yellow",1)]
								<br>#------------------------------------------------#
								<br>#----------------- <font color=yellow>Is this okay?</font> ---------------#
								<br>#---------------------- <font color=green>yes</font> ---------------------#
								<br>#---------------------- <font color=green>no</font> ----------------------#
								<br>#------------------------------------------------#
								<br>#--- <font color = yellow>Type <font color=green>yes</font> to confirm your race, and <font color=green>no</font> to</font> ---#
								<br>#-------- <font color = yellow>return to the selection screen</font> --------#
								<br>#------------------------------------------------#
								<br>#------------------------------------------------#
								<br>##################################################
							"}
							usr.Race_Selection = R.Name
							winset(usr,"Selection","command=\"ConfirmRace\"")
							Window_Refresh(usr,0,null,"SelectionO",Message)
							return
				if("back")
					Window_Refresh(usr,0,null,"SelectionO",Race_Selection)