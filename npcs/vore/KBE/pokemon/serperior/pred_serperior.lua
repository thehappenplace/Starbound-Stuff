require "/scripts/vore/npcvore.lua"  -- Custom file used by any of my characters
--########################################
--  Based off of the Argo pred in the SSVM
--########################################
--world.entitySpecies(victim)  checks victim species

animFlag = false
animTimer = 0

-- Set this to determine how long each stage will last.  The lower the value, the faster you progress between the stages.
-- Default is 20.  Give the stage enough time or you might have problems actually escaping. Too low and it may break.  Either way, not good.
stageInterval = 20

-- Define playerLines needed or else won't work
playerLines = {}

-- Actually defining individual lines to be said by the NPC as playerLines["string"/number]= {lines} (ex playerLines["example"] = { "hi" }
-- These are then called by the function sayLine( playerLines["string"/number]) at any point you feel like (ex feed, request, escape, #ofvictims, etc)
-- I suggest using names to help you know where lines will be used. Numbers are easy when dealing with multiprey
-- When doing multiple lines make sure that each line is followed by a comma(,) except for the last one in the or they will not work

--Belly Lines (Idle)----------------------------
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
------------------------------------------------
function initHook()

	--Holds a string value representing belly number
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

	headblush = {
		name = "serperiorheadblush"
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
end

function feedHook()
-- Called when NPC decides to eat you
	victim[#victim + 1] = temptarget
	request[#victim] = true
	isPlayer[#victim] = true
	storage.belly = "1"
	cloth()
	animFlag = true
	sayLine(playerLines["swallow"])
end

function requestHook(input)
-- Called when you volunteer to get eaten
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
			if request[#victim] and args.sourceId == victim[#victim] then --check to make sure request came from victim. I think this is a reduntant check will need to test
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

--	How This Function will behave is by allowing a more interactive release by allowing the player to struggle for freedom
--  from stages 1-8 with stage 9 being a looping stage keeping the player trapped inside the predator.
--  
--  ON ATTEMPT PLayer and pred both roll random number  (as of right now best way to achieve struggle).
--  player roll vs pred roll escape is successful (when player > then pred)  *Pred is stronger as player gets deeper bigger number gap (ex. below).
-- (math.random(200) >= math.random(350)) then next stage ((math.random(200) >= math.random(375))  making it harder to escape.
--	Successful attempt results in getting moved to prievous stage closer to freedom.
--  As of right now you can simply spam the interact button till released(but where's the fun in that).
-- 	
--  STAGES - Calculated based on the stageInterval value stages increase or decrease based on it's value.
--  Based on how many were defined in the Update() function an if statement must be made for each stage section.
--	Only the starting stage can be escaped from (When first swallowed) but if they get trapped there will be a way of escaping.
--	checks the timer stopWatch to determine what stage victim is in.
--  stages are stopWatch[#victim] > (stageinterval*number) and stopWatch[#victim] < (stageinterval*number + 1) to get the entire stage duration.
--  Actual stages will be defined/created in update() function.

--  TRAPPED - once Stopwatch passes a certain point player will be unable to escape and be belly locked inside the predator.
--  In order to be released the player must be lucky(RNGesus be with you) or another player must convince(better odds) the predator to release prey.
--  If you feel this is unfair you may copy contents of Belly 3 stage into trapped stage or modify the plea() function.


		
		if stopWatch[#victim] > stageInterval*6 then --Belly 6 stageInterval 120 - 140
			plea(args)
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
			if (math.random(200) >= math.random(225)) then  --Belly (chance for escape) stageInterval < 20
				storage.belly = ""
				reqRelease(args)
				cloth()
				sayLine(playerLines["bellySucc"])
			else
				sayLine(playerLines["bellyFail"])
			end
		end
end

function convince(args)
-- Other player has higher chance of success then the person that is trapped.
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
-- Player(victim) pleading to be released by pred (Success = instant release) has low probability of success.
	if (math.random(100) >= math.random(800)) then
		storage.belly = ""
		reqRelease(args)
		cloth()
		sayLine(playerLines["pleaSucc"])
	else
		sayLine(playerLines["pleaFail"])
	end
	
end

function cloth() -- Just to get rid of a lot of repeat actions
		npc.setItemSlot( "head", head)
		npc.setItemSlot( "chest", chest)
		npc.setItemSlot( "legs", legs)
end

function updateHook(dt)
	
	--First part is the animation. Once all animations are played will set animflag to false so second section can be done 
	if animFlag then -- check true if true do.  If untrue jump to else
		if #victim == 1 then --Handles stage progression
			if stopWatch[#victim] > stageInterval*6 then --140 final stage
				npc.setItemSlot( "head", headblush)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly6 )
				storage.belly = "7"
			elseif stopWatch[#victim] > stageInterval*5then
				npc.setItemSlot( "head", headblush)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly6 )
				storage.belly = "6"
			elseif stopWatch[#victim] > stageInterval*4 then
				npc.setItemSlot( "head", headblush)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly5 )
				storage.belly = "5"
			elseif stopWatch[#victim] > stageInterval*3 then
				npc.setItemSlot( "head", headblush)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly4 )
				storage.belly = "4"
			elseif stopWatch[#victim] > stageInterval*2 then
				npc.setItemSlot( "head", headblush)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly3 )
				storage.belly = "3"
			elseif stopWatch[#victim] > stageInterval then
				npc.setItemSlot( "head", headblush)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly2 )
				storage.belly = "2"
			elseif stopWatch[#victim] <= stageInterval then
				npc.setItemSlot( "head", headblush)
				npc.setItemSlot( "chest", chest)
				npc.setItemSlot( "legs", legsbelly1 )
				storage.belly = "1"
			end
			if stopWatch[#victim] > stageInterval*6.5 then -- looping the timer so it doesn't get outrageous
				if containsPlayer() then -- Check if victim is Player to free infinitely trapped NPC
					stopWatch[#victim] = stageInterval*6.4
				else
					release()
					cloth()
				end
			end
		end
	end
	
-- Say lines based on stageInterval and whether the victim is a player	
	if containsPlayer() and math.random(700) < 10 then
		if stopWatch[#victim] > stageInterval*6 then
			sayLine( playerLines["trapped"] )
		elseif stopWatch[#victim] > stageInterval*5 then
			sayLine( playerLines["belly6"] )
		elseif stopWatch[#victim] > stageInterval*4 then
			sayLine( playerLines["belly5"] )
		elseif stopWatch[#victim] > stageInterval*3 then
			sayLine( playerLines["belly4"] )
		elseif stopWatch[#victim] > stageInterval*2 then
			sayLine( playerLines["belly3"] )
		elseif stopWatch[#victim] > stageInterval then
			sayLine( playerLines["belly2"] )
		elseif stopWatch[#victim] <= stageInterval then
			sayLine( playerLines["belly1"] )
		end
	end
end