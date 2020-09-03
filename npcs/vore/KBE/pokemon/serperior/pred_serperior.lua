require "/scripts/vore/npcvore.lua"
--########################################
--  Based off of the Argo pred in the SSVM
--########################################

struggleFlag = false
exhausetedTimer = 2
animFlag = false
animTimer = 0

stages = 6
stageInterval = 15
currentLines = "mouth"
playerLines = {}


playerLines["belly1"] = {	"~Mmmm, you feel amazing sliding down my throat.",
							"Hopefully you save some energy, my belly could use a nice rub.",
							"You aren't worthy to remain outside of me.",
							"That's it let the muscles carry you deeper. ^red;~mmmmmm",
							"Don't worry you'll be heading somewhere special. hehe",
							"You think you could be the master of me.  Pitiful.",
							"Maybe I should have coiled you up first. Let you know who is in charge",
							"Now you shall learn your place, <entityname>",
							"Guess I 'll show how superior I truly am, by making you mine.",
							"*Rubs bulge with tail*",
							"All mine <entityname>."
}
playerLines["belly2"] = {	"~Mmmm, can't wait to feel you squirming in my stomach.",
							"Such a pitiful bulge you make.",
							"That's it let the muscles carry you deeper. ^red;~mmmmmm",
							"Thrash all you want an inferior whelp such as you will never escape.",
							"No way out now, just accept your place.",
							"You'll be better serving as my meal.",
							"It only gets harder from here, if you struggle.",
							"I'll show you who's master around here."
}
playerLines["belly3"] = {	"You aren't worthy of speaking to me <enitityname>",
							"Your incessant struggle only drags this out.",
							"You tasted amazing <entityname>!",
							"Snake bulge is a better look for you. ^red;~mmmmmm",
							"<entityname>, I am your master now. You belong to me.",
							"Enjoy your trip <entityname>, hate to say it's one way!",
							"Now you'll now what it's like trapped inside a poke ball.",
							"Giving up <entityname>?  Finally accepting your place.",
							"*Caresses bulge with tail* mmmmmmmm."
}
playerLines["belly4"] = {	"Must feel nice caressed on all sides.",
							"Don't worry your almost home now <entityname>.",
							"*rests on their belly bulge*",
							"I can feel you getting weaker",
							"Just relax and ask your master's wishes.",
							"~Mmmmm, don't be afraid to rub around, ~ooooo just like that.",
							"You still awake?",
							"Nothing like some bonding time with your new master."
}

playerLines["belly5"] = {	"Now I can really feel you wiggling",
							"You should really give up, you won't escape me",
							"Almost on the home stretch <enitityname>.",
							"~Mmmmmm just just relax, you know you want to.",
							"*hugs their belly* You look adorable.",
							"I can tell your enjoying this.",
							"Someone as weak as you had no chance at escape",
							"The deeper you go the more you please me~"
}

playerLines["belly6"] = {	"It's hard convincing people they're nothing but my food",
							"Just accept that you are my meal <entityname>. You'll never escape.",
							"Don't be afraid to really thrash about, my scales could use a good stretch.",
							"I hope your comfy cause that's going to be your new home <entityname>, forever.",
							"Soon I'll be your master, forever."
}

playerLines["trapped"] = {	"<entityname> your mine, forever. *lays tail over your bulge*",
							"<entityname>, your never leaving. ~hehe",
							"I love belly rubs, especially from the inside",
							"<entityname>, now your nothing but a squirming bulge.",
							"You finally understand that I am superior. ^red;<3",
							"As your master I can say, you are doing exactly what's needed; Serving me.",
							"I see no reason for me to ever let you out of your 'poke ball'. hehe.",
							"~Mmmmmmmmm, just enjoying your squirming.",
							"Relax, it's not like your going anywhere, hehe.",
							"Maybe you wanted this all along <entityname>, to be mine.",
							"Nothing better than squirming prey.",
							"Now your where you belong, as a part of me.",
							"~Hehe you look adorable surrounded by snake scales.",
							"Your better as a part of me.",
							"Admit it, your enjoying this."
}
------------------------------------------------

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

------------------------------------------------

--Struggle Lines (Success)----------------------
playerLines["bellySucc"] = {	"I told you to know your place as my belly filler.",
							"You won't like displeasing your new master.",
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
------------------------------------------------

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

function initHook()

	if storage.belly == nil then
		storage.belly = ""
	end
	
	head = {
		name = "serperiorhead"
	}
	
	chest = {
		name = "serperiorchest"
	}
	
	legs = {
		name = "serperiorlegs"
	}
	--Leg belly
	
	legsbelly1 = {
		name = "serperiorbellylegs1"
	}
	legsbelly2 = {
		name = "serperiorbellylegs2"
	}
	legsbelly3 = {
		name = "serperiorbellylegs3"
	}
	legsbelly4 = {
		name = "serperiorbellylegs4"
	}
	legsbelly5 = {
		name = "serperiorbellylegs5"
	}
	legsbelly6 = {
		name = "serperiorbellylegs6"
	}
	legsbelly7 = {
		name = "serperiorbellylegs7"
	}
	legsbelly8 = {
		name = "serperiorbellylegs8"
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
end

function requestHook(input)
	storage.belly = "1"
	cloth(head, legs, chest)
	animFlag = true
	sayLine(playerLines["swallow"])
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
		
		if stopWatch[#victim] > stageInterval*6 then
			plea(args)
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
			if (math.random(200) >= math.random(225 + (25 *stage))) then  --Head Belly (chance for escape) stageInterval < 20
				stopWatch[#victim] = stopWatch[#victim] - stageInterval
				sayLine(playerLines["bellySucc"])
			else
				sayLine(playerLines["bellyFail"])
			end
end

function cloth(pHead, pLegs, pChest)
		npc.setItemSlot( "head", pHead)
		npc.setItemSlot( "chest", pChest)
		npc.setItemSlot( "legs", pLegs)
end

function updateHook(dt)
		
	if animFlag then 
		if #victim == 1 then
			if stopWatch[#victim] > stageInterval*6.5 then
				if containsPlayer() then
					stopWatch[#victim] = stageInterval*6.4
				else
					release()
					cloth(head, legs, chest)
				end
			end
			if stopWatch[#victim] > stageInterval*6 then
				cloth(head, legsbelly6, chest)
				storage.belly = "7"
				currentLines = "trapped"
			elseif stopWatch[#victim] > stageInterval*5 then
				cloth(head, legsbelly6, chest)
				storage.belly = "6"
				currentLines = "belly6"
			elseif stopWatch[#victim] > stageInterval*4 then
				cloth(head, legsbelly5, chest)
				storage.belly = "5"
				currentLines = "belly5"
			elseif stopWatch[#victim] > stageInterval*3 then
				cloth(head, legsbelly4, chest)
				storage.belly = "4"
				currentLines = "belly4"
			elseif stopWatch[#victim] > stageInterval*2 then
				cloth(head, legsbelly3, chest)
				storage.belly = "3"
				currentLines = "belly3"
			elseif stopWatch[#victim] > stageInterval then
				cloth(head, legsbelly2, chest)
				storage.belly = "2"
				currentLines = "belly2"
			elseif stopWatch[#victim] <= stageInterval then
				cloth(head, legsbelly1, chest)
				storage.belly = "1"
				currentLines = "belly1"
			end
		end
	end
	if containsPlayer() and math.random(700) < 10 then
			sayLine( playerLines[currentLines] )
		
	end
end
