Skills
	var
		Name
		Description
		list/Effects = list()
		list/Opposing_Effects = list()
	Fury
		Name = "Fury"
		Description = "Unleashes a tremendous amount of anger, and rage, rendering the spellcaster nearly unstoppable."
		Effects = list("+ 15" = "Attack","- 10" = "Defense")
	Tackle
		Name = "Tackle"
		Description = "Lunges the spellcasters body into his/her opponent."
		Opposing_Effects = list("- 4" = "Speed","- 3" = "Defense")