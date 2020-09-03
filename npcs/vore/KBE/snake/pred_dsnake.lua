require "/scripts/vore/npcvoremodified.lua"
--########################################
--  Based off of the Argo pred in the SSVM
--########################################

struggleFlag = false
exhausetedTimer = 2
animFlag = false
animTimer = 0
isEaten = false
inStomach = false

stages = 7
stageInterval = 15
effect = "npcdigestvore"
buff = "digestionImmunity"
currentLines = "mouth"
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
playerLines["pleaSucc"] = {	"Mmmmmmmmm~ let's start again shall we",
							"Ok, I'll let you out, but don't think you'll be staying out.",
							"~mmmmm Thanks for the belly rub, I guess I can drag this out a little longer.",
							"I think that message deserves a reward.",
							"I suppose dragging this out isn't such a bad thing. <3"
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
	legsbelly7 = {
		name = "snakebellylegs7"
	}
	legsbelly8 = {
		name = "snakebellylegs8"
	}
end

function feedHook()
	victim[#victim + 1] = temptarget
	request[#victim] = true
	isPlayer[#victim] = true
	storage.belly = "1"
	cloth(head, legs, chest)
	animFlag = true
	sayLine(playerLines["swallow"])
	isEaten = true
end

function requestHook(input)
	storage.belly = "1"
	cloth(head, legs, chest)
	animFlag = true
	sayLine(playerLines["swallow"])
	isEaten = true
end

function loseHook()

	npc.say("Is this even called")
	storage.belly = ""
	cloth(head, legs, chest)
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
		elseif stopWatch[#victim] > stageInterval*6 and stopWatch[#victim] <= stageInterval*7 then
			escapeRoll(6, args)
		elseif stopWatch[#victim] > stageInterval*5 and stopWatch[#victim] <= stageInterval*6 then
			escapeRoll(5, args)
		elseif stopWatch[#victim] > stageInterval*4 and stopWatch[#victim] <= stageInterval*5 then
			escapeRoll(4, args)
		elseif stopWatch[#victim] > stageInterval*3 and stopWatch[#victim] <= stageInterval*4 then 
			escapeRoll(3, args)
		elseif stopWatch[#victim] > stageInterval*2 and stopWatch[#victim] <= stageInterval*3 then
			escapeRoll(2, args)
		elseif stopWatch[#victim] > stageInterval and stopWatch[#victim] <= stageInterval*2 then 
			escapeRoll(1, args)
		else
			escapeRoll(0, args)
		end
end

function convince()
	if (math.random(200) >= math.random(500)) then
		storage.belly = ""
		release()
		cloth(head, legs, chest)
		sayLine(playerLines["convinceS"])
	else
		sayLine(playerLines["convinceF"])
	end
	
end

function plea(args)
	if (math.random(100) >= math.random(800)) then
		sayLine(playerLines["pleaSucc"])
		stopWatch[#victim] = stopWatch[#victim] -(stageInterval/2 + math.random(stageInterval * stages))
		if (stopWatch[#victim] < 0) then	
		storage.belly = ""
		reqRelease(args)
		cloth(head, legs, chest)
		end
		
	else
		sayLine(playerLines["pleaFail"])
	end
	
end

function escapeRoll(stage, args)
			if (math.random(200) >= math.random(225 + (25 *stage))) then
				if stage == 0 then
				storage.belly = ""
				reqRelease(args)
				cloth(head, legs, chest)
				sayLine(playerLines["mouthSucc"])
				else
				stopWatch[#victim] = stopWatch[#victim] - stageInterval
				sayLine(playerLines["bellySucc"])
				end
			else
				if stage == 0 then
				sayLine(playerLines["mouthFail"])
				else
				sayLine(playerLines["bellyFail"])
				end
			end
end

function cloth(pHead, pLegs, pChest)
		npc.setItemSlot( "head", pHead)
		npc.setItemSlot( "chest", pChest)
		npc.setItemSlot( "legs", pLegs)
end


function digestingCheck()

	if (isEaten and not inStomach) then
		world.sendEntityMessage( victim[#victim], "applyStatusEffect", buff, stageInterval, entity.id() )
		inStomach = true
	end
	
end

function digestBellyChange()
	if #victim ~= null then
		health = world.entityHealth(victim[#victim])[1] / world.entityHealth(victim[#victim])[2]
		if health < .02 then
			release()
			cloth(head, legs, chest)
		elseif health < .10 then
			cloth(head, legs, chest)
		elseif health < .35 then
			cloth(head, legsbelly8, chest)
		elseif health < .60 then
			cloth(head, legsbelly7, chest)
		else
			cloth(head, legsbelly6, chest)
		end
	end
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
			if stopWatch[#victim] > stageInterval*7.5 then
				if containsPlayer() then
					stopWatch[#victim] = stageInterval*7.4
				else
					release()
					cloth(head, legs, chest)
				end
			end
			if stopWatch[#victim] > stageInterval*7 then
				digestBellyChange()
				storage.belly = "8"
				currentLines = "trapped"
				inStomach = true
			elseif stopWatch[#victim] > stageInterval*6 then
				cloth(head, legsbelly6, chest)
				storage.belly = "7"
				currentLines = "belly6"
				inStomach = true
			elseif stopWatch[#victim] > stageInterval*5 then  
				cloth(head, legsbelly5, chest)
				storage.belly = "6"
				currentLines = "belly5"
				inStomach = false
			elseif stopWatch[#victim] > stageInterval*4 then
				cloth(head, legsbelly4, chest)
				storage.belly = "5"
				currentLines = "belly4"
				inStomach = false
			elseif stopWatch[#victim] > stageInterval*3 then 
				cloth(head, legsbelly3, chest)
				storage.belly = "4"
				currentLines = "belly3"
				inStomach = false
			elseif stopWatch[#victim] > stageInterval*2 then 
				cloth(head, legsbelly2, chest)
				storage.belly = "3"
				inStomach = false
				currentLines = "belly2"
			elseif stopWatch[#victim] > stageInterval then
				cloth(head, legsbelly1, chest)
				storage.belly = "2"
				inStomach = false
				currentLines = "belly1"
			elseif stopWatch[#victim] <= stageInterval then
				cloth(headbelly2, legs, chest)
				storage.belly = "1"
				inStomach = false
				currentLines = "mouth"
			end
		end
	end
	
	digestingCheck()
	
	if containsPlayer() and math.random(700) < 10 then
			sayLine( playerLines[currentLines] )
		
	end
end