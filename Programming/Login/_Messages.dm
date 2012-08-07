proc/Load_Races()
	Race_Selection = {"
	<center>##################################################
		<br>#------------------------------------------------#
		<br>#---------------- <font color = red><u>TextMUD Races</u></font> -----------------#
	"}
	var/list/Races = list()
	for(var/V in typesof(/Race))
		if(V == "/Race")
			return
		var/Race/R = text2path("[V]")
		Races += new R
	for(var/Race/R in Races)
		if(R.Name)
			var/Color = pick("Red","Blue","Green","White")
			Race_Selection += "[Fit_Text(" <font color=[Color]>+</font> [R.Name] <font color=[Color]>+</font> ","Yellow",1)]"
	Race_Selection += {" 
		<br>#------------------------------------------------#
		<br>#----------------- <font color = #66CCFF><u>Instructions</u></font> -----------------#
		<br>#--- <font color = yellow>To view a race, simply type <font color = green>view</font> <font color = #9900CC>racename</font></font> --#
		<br>#--- <font color = yellow>To pick a race, simply type <font color = green>pick</font> <font color = #9900CC>racename</font></font> --#
		<br>#---- <font color=yellow>To pick a race and class, simply type</font> -----#
		[Fit_Text(" <font color=green>pick</font> <font color=#9900CC>race</font> <font color=#9900CC>class</font> ","Yellow",1)]
		<br>#------------------------------------------------#
		<br>#--- <font color = yellow>You can cancel the selection process at</font> ----#
		<br># <font color = yellow>anytime by simply typing <font color = green>quit</font> to exit the game</font> #
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>##################################################
	"}
var
	const/Opening_Message = {"
	<center>##################################################
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>#------------- <font color = red>Welcome to TextMUD</font> ---------------#
		<br>#------ <font color = yellow>To continue, please type in one of</font> ------#
		<br>#----- <font color = yellow>the options below into the input bar</font> -----#
		<br>#------------------------------------------------#
		<br>#--- <font color = green>create</font><font color = yellow>(This will create your character)</font> ----#
		<br>#-- <font color = green>load</font><font color = yellow>(This will load an existing character)</font> --#
		<br>#---- <font color = green>quit</font><font color = yellow>(This will exit out of the client)</font> ----#
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>##################################################
	"}
	const/Name_Message = {"
	<center>##################################################
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>#----- <font color = yellow>Please input the name that you would</font> -----#
		<br>#--------- <font color = yellow>like your character to go by</font> ---------#
		<br>#----- <font color = green>First, and last names are encouraged</font> -----#
		<br>#------------------------------------------------#
		<br>#------- <font color = red>Note that names may not contain</font> --------#
		<br>#-------------- <font color = red><u>symbols</u> or <u>numbers</u></font> --------------#
		<br>#-- <font color = red>And must be within <u>6</u> to <u>22</u> characters long</font> --#
		<br>#------------------------------------------------#
		<br>#----- <font color = yellow>Type <font color = green>back</font> to return to the main menu</font> -----#
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>##################################################
	"}
	const/Space_Error = {"
	<center>##################################################
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>#--------- <font color = red>Your name may not consist of</font> ---------#
		<br>#------------- <font color = red>more than two words</font> --------------#
		<br>#------------------------------------------------#
		<br>#--------------- <font color = yellow>Please try again</font> ---------------#
		<br>#------------------------------------------------#
		<br>#----- <font color = yellow>Type <font color = green>back</font> to return to the main menu</font> -----#
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>##################################################
	"}
	const/Length_Error = {"
	<center>##################################################
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>#--------- <font color = red>Your name may not be longer</font> ----------#
		<br>#------------- <font color = red>than 22 characters</font> ---------------#
		<br>#-------------- <font color = red>or shorter than 6</font> ---------------#
		<br>#------------------------------------------------#
		<br>#--------------- <font color = yellow>Please try again</font> ---------------#
		<br>#------------------------------------------------#
		<br>#----- <font color = yellow>Type <font color = green>back</font> to return to the main menu</font> -----#
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>##################################################
	"}
	const/Illegal_Error = {"
	<center>##################################################
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>#--------- <font color = red>Your name may not consist of</font> ---------#
		<br>#----------- <font color = red>any <u>illegal</u> characters</font> -------------#
		<br>#------------------------------------------------#
		<br>#--------------- <font color = yellow>Please try again</font> ---------------#
		<br>#------------------------------------------------#
		<br>#----- <font color = yellow>Type <font color = green>back</font> to return to the main menu</font> -----#
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>##################################################
	"}
	const/Name_Error = {"
	<center>##################################################
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>#----------- <font color = red>This name is currently</font> -------------#
		<br>#--------------- <font color = red>already in use</font> -----------------#
		<br>#------------------------------------------------#
		<br>#--------------- <font color = yellow>Please try again</font> ---------------#
		<br>#------------------------------------------------#
		<br>#----- <font color = yellow>Type <font color = green>back</font> to return to the main menu</font> -----#
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>##################################################
	"}
	const/Race_Message = {"
	<center>##################################################
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>#--- <font color = yellow>Now that you have chosen your name it is</font> ---#
		<br>#----- <font color = yellow>time to choose your race. To proceed</font>  ----#
		<br>#----- <font color = yellow>to view races, please type <font color = green>continue</font></font> ------#
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>##################################################
	"}
	Race_Selection
	const/Invalid_Format = {"
	<center>##################################################
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>#---------------- <font color = red><u>Invalid format</u></font> ----------------#
		<br>#------------- <font color = yellow>Try <font color = green>action</font> <font color = #9900CC>racename</font></font>  --------------#
		<br>#------------------------------------------------#
		<br>#------------------------------------------------#
		<br>##################################################
	"}