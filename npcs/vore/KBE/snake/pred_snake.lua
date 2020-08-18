require "/scripts/vore/npcvore.lua"
--########################################
--  Based off of the Argo pred in the SSVM
--########################################

struggleFlag = false
exhausetedTimer = 2
animFlag = false
animTimer = 0


stageInterval = 20


playerLines = {}


--Belly Lines (Idle)----------------------------
playerLines["mouth"] = {	"~Mmmmmmmmmm",
							"^blue;*suckles your body*",
							"*The tongue loops around your neck giving a squeeze, letting you know who's in charge*",
							"*you feel the throat muscles trying to pull you down*",
							"^blue;*schluuuuurp*",
							"Hiss...."
							
}
playerLines["belly1"] = {	"~Mmmm, you feel amazing sliding down my throat.",
							"Hopefully you save some energy, my belly could use a nice rub.",
							"You look so nice as a bulge, anyone ever tell you that",
							"That's it let the muscles carry you deeper. ^red;~mmmmmm",
							"Don't worry you'll be heading somewhere special. hehe",
							"Your going to love this.",
							"Maybe I should have coiled you up first.",
							"Enjoy your trip <entityname>, it's a long way down.",
							"It only gets harder from here.",
							"*Rubs bulge with tail*",
							"All mine <entityname>."
}
playerLines["belly2"] = {	"~Mmmm, can't wait to feel you squirming in my stomach.",
							"You look so nice as a bulge.",
							"That's it let the muscles carry you deeper. ^red;~mmmmmm",
							"Hurry up and get to my stomach, your wasting valuable belly rub energy.",
							"I know, first time is so..... ~enjoyable",
							"Better inside, than outside. *hiccup*",
							"Your trips just getting started!",
							"It only gets harder from here, if you struggle."
}
playerLines["belly3"] = {	"Can't wait for belly rubs! ^red;<3",
							"You tasted amazing <entityname>!",
							"Snake bulge is a better look for you. ^red;~mmmmmm",
							"Your going to love my belly <entityname>. I just Know it ^red<3",
							"Enjoy your trip <entityname>, hate to say it's one way!",
							"It only gets more comfortable the deeper you go.",
							"Giving up <entityname>?  Unless you want to go deeper.",
							"*Caresses bulge with tail* Relax.",
							"Being with me won't be all bad trust me!"
}
playerLines["belly4"] = {	"Must feel nice caressed on all sides.",
							"Don't worry your almost there now <entityname>.",
							"*rests on their belly bulge*",
							"I can feel you getting tired, just relax",
							"Just relax and enjoy yourself, I certainly am.",
							"~Mmmmm, don't be afraid to rub around, ~ooooo just like that.",
							"You still awake?",
							"Nothing like live prey ~hehe."
}

playerLines["belly5"] = {	"Now I can really feel you wiggling",
							"You should really give up, it's more fun that way",
							"Almost there now won'r be long till your mine <enitityname>.",
							"~Mmmmmm just just relax, you know you want to.",
							"*hugs their belly* You look adorable.",
							"I can tell your enjoying this."
}

playerLines["belly6"] = {	"Please don't fight it, it's hard convincing people they're not food",
							"Just accept that you are my meal <entityname>.",
							"Don't be afraid to really thrash about, my scales could use a good stretch.",
							"I hope your comfy cause that's going to be your new home <entityname>, forever.",
							"Last chance to accept your place as a belly bulge."
}

playerLines["trapped"] = {	" <entityname> your mine, forever. *lays tail over your bulge*",
							"Like your new home <entityname>, cause your never leaving. ~hehe",
							"I love belly rubs, especially from the inside",
							"You are much better as a squirming bulge <entityname>.",
							"Enjoying yourself?  I know I am. ^red;<3",
							"What's better than being me?  Nothing!",
							"Ohhhhhh~ still a little bit of energy left I see.",
							"~Mmmmmmmmm, just enjoying your squirming.",
							"Relax, it's not like your going anywhere, hehe.",
							"Maybe you wanted this all along <entityname>, to be mine.",
							"Nothing better than squirming prey.",
							"Now your where you belong, as a part of me.",
							"~Hehe you look adorable surrounded by snake scales.",
							"Your better as a part of me.",
							"Admit it, your enjoying this."
}


--Struggle Lines (fail)-------------------------
playerLines["bellyFail"] = {	"There's no point, your going to be mine.",
							"Your squirms aren't helping with your escape.",
							"You look so cute as a squirming bulge. <3",
							"You look so nice as a squirming bulge, luckily you'll be that way forever. <3",
							"~mmmmm Thanks for the belly rub, but you can't get out that easy.",
							"Struggling is pointless.",
							"I can see you trying, but it's not helping.",
							"You tasted to good to let out this easy.",
							"Listen, it's nothing personal but I can't let you go.",
							"That's it just flail around pointlessly, ~mmmmmmm.",
							"Flailing around just makes it easier to enjoy you.",
							"No, you need to be going deeper.  It's more fun that way.",
							"That attempt was pretty pathetic.",
							"Oh, your just to cute as a bulge to let out."
}
playerLines["mouthFail"] = {	"^blue;*suckle* ^white;~mmmphf",
							"*The tongue explores your form intimately distracting you from escape*",
							"^blue;*slurps* ^red;*moan*",
							"~Mmmmm",
							"*teases you with fake swallows letting you know where you'll be heading*",
							"*your shoved back in by the serpent's tail* ^red;hiss.."
}


--Struggle Lines (Success)----------------------
playerLines["bellySucc"] = {	"Hey! I said the trip was one way, <entityname>.",
							"Why are you so determined to not enjoy this.",
							"I suppose I can drag this out a little longer, but I'm still not letting you out.",
							"Your going the wrong way, but I suppose that's only temporary.",
							"Come on and just relax."
}
playerLines["mouthSucc"] = {	"But you tasted so good!",
							"Oh well, another time perhaps?",
							"You only delay the inevitable.",
							"~mmmmm enjoy your freedom little morsel.",
							"Hey, that's not nice",
							"Struggling is pointless, just relax and give in"
}


--Action Lines ---------------------------------
playerLines["pleaFail"] = {	"There's no point, your mine now.",
							"Why should I, you belong to me now <entityname>.",
							"You look so nice as a squirming bulge, luckily you'll be that way forever. <3",
							"~mmmmm Thanks for the belly rub, but I'm still not letting you out.",
							"No one escapes my coils, accept your place.",
							"Struggling is pointless, just relax."
}
playerLines["pleaSucc"] = {	"Fine, but only so we can do this all over again.",
							"Ok, I'll let you out, but don't think you'll be staying out.",
							"~mmmmm Thanks for the belly rub, I guess letting you out temporarily won't hurt.",
							"Seemed pointless digesting such a nice belly massager.",
							"*gives you a lick* Come back soon. <3"
}

playerLines["convinceSucc"] = { 	"You win, I'll release them.",
									"I suppose I can let them out this one time.",
									"Fine I'll let them out.  Just quit pestering me.",
									"Now that there free.  You want to jump in?"
}

playerLines["convinceFail"] = { 	"I think I'll keep, <entityname> a little longer.",
									"Let me enjoy my meal in peace",
									"Leave me alone unless you want to join them"
}
playerLines["swallow"] = {	"Delicious"
}
playerLines["exhausted"] = {	"you try to catch your breath"
}

function initHook()

	if storage.belly == nil then
		storage.belly = ""
	end
	
	head = {
		name = "snakehead"
	}
	
	chest = {
		name = "snakechest"
	}
	
	legs = {
		name = "snakelegs"
	}

	headbelly1 = {
		name = "snakeheadbelly1"
	}
	headbelly2 = {
		name = "snakeheadbelly2"
	}
	
	--Leg belly
	
	legsbelly1 = {
		name = "snakebellylegs1"
	}
	legsbelly2 = {
		name = "snakebellylegs2"
	}
	legsbelly3 = {
		name = "snakebellylegs3"
	}
	legsbelly4 = {
		name = "snakebellylegs4"
	}
	legsbelly5 = {
		name = "snakebellylegs5"
	}
	legsbelly6 = {
		name = "snakebellylegs6"
	}
end

function feedHook()
	victim[#victim + 1] = temptarget
	request[#victim] = true
	isPlayer[#victim] = true
	storage.belly = "1"
	cloth()
	animFlag = true
	sayLine(playerLines["swallow"])
end

function requestHook(input)
	storage.belly = "1"
	cloth()
	animFlag = true
	sayLine(playerLines["swallow"])
end

function loseHook()

	npc.say("Is this even called")
	storage.belly = ""
	cloth()
	isPlayer = false
	
end

function interact(args)
	
	if reqTimer < 0.7 then
		if #victim > 0 then
			if request[#victim] and args.sourceId == victim[#victim] then --check to make sure request came from victim
				escapeAttempt(args)
			else
				convince()
			end
		else
			victim[#victim + 1] = args.sourceId
			request[#victim] = true
			isPlayer[#victim] = true
			world.sendEntityMessage( victim[#victim], "applyStatusEffect", effect, duration, entity.id() )
			storage.belly = "1"
			dress()
			requestHook(input)
		end
		do return end
	else
		reqTimer = 0
	end
	
	interactHook()
	oldInteract(args)
end

function escapeAttempt(args)
		if stopWatch[#victim] > stageInterval*7 then  --Trapped must plea with pred to be freed (won't let you go easy)
			plea(args)
		elseif stopWatch[#victim] > stageInterval*6 and stopWatch[#victim] <= stageInterval*7 then --Belly 6 stageInterval 120 - 140
			if (math.random(200) >= math.random(375)) then
				stopWatch[#victim] = stopWatch[#victim] - stageInterval
				sayLine(playerLines["bellySucc"])
			else
				sayLine(playerLines["bellyFail"])
			end
		elseif stopWatch[#victim] > stageInterval*5 and stopWatch[#victim] <= stageInterval*6 then --Belly 5 stageInterval 100 - 120
			if (math.random(200) >= math.random(350)) then
				stopWatch[#victim] = stopWatch[#victim] - stageInterval
				sayLine(playerLines["bellySucc"])
			else
				sayLine(playerLines["bellyFail"])
			end
		elseif stopWatch[#victim] > stageInterval*4 and stopWatch[#victim] <= stageInterval*5 then --Belly 4 stageInterval 80 - 100
			if (math.random(200) >= math.random(325)) then
				stopWatch[#victim] = stopWatch[#victim] - stageInterval
				sayLine(playerLines["bellySucc"])
			else
				sayLine(playerLines["bellyFail"])
			end
		elseif stopWatch[#victim] > stageInterval*3 and stopWatch[#victim] <= stageInterval*4 then --Belly 3 stageInterval 60 - 80
			if (math.random(200) >= math.random(300)) then
				stopWatch[#victim] = stopWatch[#victim] - stageInterval
				sayLine(playerLines["bellySucc"])
			else
				sayLine(playerLines["bellyFail"])
			end
		elseif stopWatch[#victim] > stageInterval*2 and stopWatch[#victim] <= stageInterval*3 then --Belly 2 stageInterval 40 - 60
			if (math.random(200) >= math.random(275)) then
				stopWatch[#victim] = stopWatch[#victim] - stageInterval
				sayLine(playerLines["bellySucc"])
			else
				sayLine(playerLines["bellyFail"])
			end
		elseif stopWatch[#victim] > stageInterval and stopWatch[#victim] <= stageInterval*2 then --Belly 1 stageInterval 20 -40
			if (math.random(200) >= math.random(250)) then
				stopWatch[#victim] = stopWatch[#victim] - stageInterval
				sayLine(playerLines["bellySucc"])
			else
				sayLine(playerLines["bellyFail"])
			end
		else
			if (math.random(200) >= math.random(225)) then  --Head Belly (chance for escape) stageInterval < 20
				storage.belly = ""
				reqRelease(args)
				cloth()
				sayLine(playerLines["mouthSucc"])
			else
				sayLine(playerLines["mouthFail"])
			end
		end
end

function convince(args)
	if (math.random(200) >= math.random(500)) then
		storage.belly = ""
		release()
		cloth()
		sayLine(playerLines["convinceS"])
	else
		sayLine(playerLines["convinceF"])
	end
	
end

function plea(args)
	if (math.random(100) >= math.random(800)) then
		storage.belly = ""
		reqRelease(args)
		cloth()
		sayLine(playerLines["pleaSucc"])
	else
		sayLine(playerLines["pleaFail"])
	end
	
end

function cloth()
		npc.setItemSlot( "head", head)
		npc.setItemSlot( "chest", chest)
		npc.setItemSlot( "legs", legs)
end

function updateHook(dt)
		
	if animFlag then 
		if animTimer < 0.7 then
			npc.setItemSlot( "head", headbelly1 )
		elseif animTimer < 1.7 then
			npc.setItemSlot( "head", headbelly2 )
		else
			animFlag = false
			animTimer = 0
		end
		animTimer = animTimer + dt
	else
		if #victim == 1 then
			if stopWatch[#victim] > stageInterval*7 then --160 final stage
				npc.setItemSlot( "head", head)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly6 )
				storage.belly = "8"
			elseif stopWatch[#victim] > stageInterval*6 then -- 140
				npc.setItemSlot( "head", head)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly6 )
				storage.belly = "7"
			elseif stopWatch[#victim] > stageInterval*5 then -- 120 
				npc.setItemSlot( "head", head)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly5 )
				storage.belly = "6"
			elseif stopWatch[#victim] > stageInterval*4 then --100
				npc.setItemSlot( "head", head)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly4 )
				storage.belly = "5"
			elseif stopWatch[#victim] > stageInterval*3 then --80
				npc.setItemSlot( "head", head)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly3 )
				storage.belly = "4"
			elseif stopWatch[#victim] > stageInterval*2 then --60
				npc.setItemSlot( "head", head)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly2 )
				storage.belly = "3"
			elseif stopWatch[#victim] > stageInterval then --40  Belly 1
				npc.setItemSlot( "head", head)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly1 )
				storage.belly = "2"
			elseif stopWatch[#victim] <= stageInterval then -- 20 first stage
				npc.setItemSlot( "head", headbelly2)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legs)
				storage.belly = "1"
				end
			if stopWatch[#victim] > stageInterval*7.5 then
				if containsPlayer() then
					stopWatch[#victim] = stageInterval*7.4
				else
					release()
					cloth()
				end
			end
		end
	end
	

	if containsPlayer() and math.random(700) < 10 then
		if stopWatch[#victim] > stageInterval*7 then
			sayLine( playerLines["trapped"] )
		elseif stopWatch[#victim] > stageInterval*6 then
			sayLine( playerLines["belly6"] )
		elseif stopWatch[#victim] > stageInterval*5 then
			sayLine( playerLines["belly5"] )
		elseif stopWatch[#victim] > stageInterval*4 then
			sayLine( playerLines["belly4"] )
		elseif stopWatch[#victim] > stageInterval*3 then
			sayLine( playerLines["belly3"] )
		elseif stopWatch[#victim] > stageInterval*2 then
			sayLine( playerLines["belly2"] )
		elseif stopWatch[#victim] > stageInterval then
			sayLine( playerLines["belly1"] )
		elseif stopWatch[#victim] <= stageInterval then
			sayLine( playerLines["mouth"] )
		end
	end
end