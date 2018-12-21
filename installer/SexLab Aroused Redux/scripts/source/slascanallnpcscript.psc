Scriptname slaScanAllNPCScript extends Quest  

ReferenceAlias Property SLActor01 auto
ReferenceAlias Property SLActor02 auto
ReferenceAlias Property SLActor03 auto
ReferenceAlias Property SLActor04 auto
ReferenceAlias Property SLActor05 auto
ReferenceAlias Property SLActor06 auto
ReferenceAlias Property SLActor07 auto
ReferenceAlias Property SLActor08 auto
ReferenceAlias Property SLActor09 auto
ReferenceAlias Property SLActor10 auto
ReferenceAlias Property SLActor11 auto
ReferenceAlias Property SLActor12 auto
ReferenceAlias Property SLActor13 auto
ReferenceAlias Property SLActor14 auto
ReferenceAlias Property SLActor15 auto
ReferenceAlias Property SLActor16 auto
ReferenceAlias Property SLActor17 auto
ReferenceAlias Property SLActor18 auto
ReferenceAlias Property SLActor19 auto
ReferenceAlias Property SLActor20 auto
ReferenceAlias Property SLActor21 auto
ReferenceAlias Property SLActor22 auto
ReferenceAlias Property SLActor23 auto
ReferenceAlias Property SLActor24 auto
ReferenceAlias Property SLActor25 auto

Actor [] Property arousedActors Auto hidden

function debugTraceActors()

	debug.trace("Actor 1 " + SLActor01.getReference());
	debug.trace("Actor 2 " + SLActor02.getReference());
	debug.trace("Actor 3 " + SLActor03.getReference());
	debug.trace("Actor 4 " + SLActor04.getReference());
	debug.trace("Actor 5 " + SLActor05.getReference());
	debug.trace("Actor 6 " + SLActor06.getReference());
	debug.trace("Actor 7 " + SLActor07.getReference());
	debug.trace("Actor 8 " + SLActor08.getReference());
	debug.trace("Actor 9 " + SLActor09.getReference());
	debug.trace("Actor 10 " + SLActor10.getReference());
	debug.trace("Actor 11 " + SLActor11.getReference());
	debug.trace("Actor 12 " + SLActor12.getReference());
	debug.trace("Actor 13 " + SLActor13.getReference());
	debug.trace("Actor 14 " + SLActor14.getReference());
	debug.trace("Actor 15 " + SLActor15.getReference());
	debug.trace("Actor 16 " + SLActor16.getReference());
	debug.trace("Actor 17 " + SLActor17.getReference());
	debug.trace("Actor 18 " + SLActor18.getReference());
	debug.trace("Actor 19 " + SLActor19.getReference());
	debug.trace("Actor 20 " + SLActor20.getReference());
	debug.trace("Actor 21 " + SLActor21.getReference());
	debug.trace("Actor 22 " + SLActor22.getReference());
	debug.trace("Actor 23 " + SLActor23.getReference());
	debug.trace("Actor 24 " + SLActor24.getReference());
	debug.trace("Actor 25 " + SLActor25.getReference());
	
endFunction

int function getArousedActors()
	
	;debug.trace("GetArousedActors before start")
	;debugTraceActors()
	start()
	;debug.trace("GetArousedActors After start")
	;debugTraceActors()
	Utility.wait(0.3)
	int actorCount = 0
	arousedActors = new Actor[25]
	
	;debug.trace("Find arousedActors has first ref = " + SLActor01.getReference())
	Actor a1 = SLActor01.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 1 has a value")
	endif
	a1 = SLActor02.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 2 has a value")
	endif
	a1 = SLActor03.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 3 has a value")
	endif
	a1 = SLActor04.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 4 has a value")
	endif
	a1 = SLActor05.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 5 has a value")
	endif
	a1 = SLActor06.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor07.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor08.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif

	a1 = SLActor09.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor10.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor11.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor12.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor13.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor14.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor15.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor16.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor17.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor18.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor19.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor20.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor21.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor22.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor23.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif

	a1 = SLActor24.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	a1 = SLActor25.getActorRef()
	if(a1)
		arousedActors[actorCount] = a1
		actorCount = actorCount + 1
		;debug.trace("Actor 6 has a value")
	endif
	
	
	stop()
	debug.trace("Found " + actorCount + " arousedActors")
	
	reset()
	;debug.trace("GetArousedActors after reset")
	;debugTraceActors()
	
	return actorCount;
endFunction



