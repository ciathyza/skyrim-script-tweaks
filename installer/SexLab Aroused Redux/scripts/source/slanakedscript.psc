Scriptname slaNakedScript extends Quest  

ReferenceAlias Property SLANaked1 auto
ReferenceAlias Property SLANaked2 auto
ReferenceAlias Property SLANaked3 auto
ReferenceAlias Property SLANaked4 auto
ReferenceAlias Property SLANaked5 auto
ReferenceAlias Property SLANaked6 auto
ReferenceAlias Property SLANaked7 auto
ReferenceAlias Property SLANaked8 auto

Actor [] Property nakedActors Auto hidden

int function getNakedActors()
	
	start()
	Utility.wait(0.3)
	int actorCount = 0
	if(!nakedActors)
		;debug.trace("Getting new nakedActors")
		nakedActors = new Actor[8]
	endif
	
	;debug.trace("Find nakedActors has first ref = " + SLANaked1.getReference())
	Actor a1 = SLANaked1.getActorRef()
	if(a1)
		nakedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 1 has a value")
	endif
	a1 = SLANaked2.getActorRef()
	if(a1)
		nakedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 2 has a value")
	endif
	a1 = SLANaked3.getActorRef()
	if(a1)
		nakedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 3 has a value")
	endif
	a1 = SLANaked4.getActorRef()
	if(a1)
		nakedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 4 has a value")
	endif
	a1 = SLANaked5.getActorRef()
	if(a1)
		nakedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 5 has a value")
	endif
	a1 = SLANaked6.getActorRef()
	if(a1)
		nakedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLANaked7.getActorRef()
	if(a1)
		nakedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLANaked8.getActorRef()
	if(a1)
		nakedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif

	
	stop()
	
	debug.trace("Found " + actorCount + " nakedActors")
	return actorCount;
endFunction

