TextMUD
=======

A text mud created with the BYOND Engine.

Upon branching from this source, adding races, classes, abilities, and even skills
are genuinely easy to do. To do so, just simply goto the _Main.dm file in either
the Classes Folder, Races Folder, Abilities Folder, or Stats Folder, and simply
follow that same format when creating a new addition.

For Example:
Classes
    Hunter
      	Class = "Hunter"
    		Description = "A warrior with keen survival tactics, and thrives on the ability to survive."
    		Starting_Abilities = list("Pounce","Burst")
    		Strengths = list("Speed","Strength")
    		Weaknesses = list("Defense","Charisma")
    		Available_Races = list("Human")
Race
    Human
      	Name = "Human"
    		Description = {"Humans, the most common of all races, are the most balanced and generally the most popular creatures to call this planet home. They are best known to resemble a more evolved and less hairy monkey, and happen to be predominantly white or black."}
    		Alliances = list("Wakda")
    		Classes = list("Hunter")
Skill
    Fury
      	Name = "Fury"
    		Description = "Unleashes a tremendous amount of anger, and rage, rendering the spellcaster nearly unstoppable."
    		Effects = list("+ 15" = "Attack","- 10" = "Defense")
Stats
    Charisma
      	Name = "Charisma"
    		Description = "The scale of one's own ability to socialize with others."