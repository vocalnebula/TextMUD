mob/verb
	DEBUGs(T as text)
		var/First_Word = copytext(T,1,findtext(T," "))
		var/Command = copytext(T,findtext(T," ",1) + 1,lentext(T) + 1)
		switch(lowertext(First_Word))
			if("lentext")
				if(istext(T))
					usr << output("Length of text string: [lentext(Command)]","DEBUG")
					return
				else
					usr << output("You can only get the length of text strings.","DEBUG")
					return
			if("reboot")
				world.Reboot()