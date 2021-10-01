!classDefinition: #CarolinaLaCuranderaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeSkyrim class
	instanceVariableNames: 'interaccionesConPersonajes frasesDesconocido frasesPrometedor'!

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'TK 9/29/2021 11:27:12'!
interactuarCon: unPersonajeJugadorAInteractuar
	| fraseAResponder |
	self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
	fraseAResponder  := self responderSegunCantidadDeInteracciones: unPersonajeJugadorAInteractuar.
	self revisarCalificacionDe: unPersonajeJugadorAInteractuar.
	^ fraseAResponder ! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'TK 9/29/2021 10:48:39'!
olvidar
	interaccionesConPersonajes := Dictionary new! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MW 10/1/2021 12:03:36'!
hacerPrometedorA: unPersonajeAHacerPrometedor
	PuebloRiverwood  hacerPrometedorA: unPersonajeAHacerPrometedor. 
	self reiniciarInteraccionesCon: unPersonajeAHacerPrometedor .
	TreborElGuardiaDeSkyrim reiniciarInteraccionesCon: unPersonajeAHacerPrometedor .! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'TK 9/29/2021 11:27:34'!
recordarInteraccionCon: unPersonajeARecordarInteraccion
	| cantidadInteraccionesConJugador |
	cantidadInteraccionesConJugador := interaccionesConPersonajes at: unPersonajeARecordarInteraccion ifAbsent: [ 0 ].
	interaccionesConPersonajes at: unPersonajeARecordarInteraccion put:  (cantidadInteraccionesConJugador  + 1).! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'TK 9/29/2021 11:00:36'!
reiniciarInteraccionesCon: unPersonajeAReiniciarInteracciones
	interaccionesConPersonajes at: unPersonajeAReiniciarInteracciones put: 0! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MW 10/1/2021 11:50:29'!
responderSegunCantidadDeInteracciones: unPersonajeAResponder
	| cantidadInteraccionesConJugador |
	cantidadInteraccionesConJugador := interaccionesConPersonajes at: unPersonajeAResponder ifAbsent: [ 0 ].
	(PuebloRiverwood esPrometedor: unPersonajeAResponder) ifTrue: [
		^frasesPrometedor at: (cantidadInteraccionesConJugador min: frasesPrometedor size)
	] ifFalse: [
		^frasesDesconocido at: (cantidadInteraccionesConJugador min: frasesDesconocido size)
	].! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'calificaciones - privado' stamp: 'MW 10/1/2021 12:06:18'!
revisarCalificacionDe: unPersonaje
	(PuebloRiverwood esPrometedor: unPersonaje) ifFalse: [
		self revisarCambioDeCalificacionDe: unPersonaje
	].! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'calificaciones - privado' stamp: 'MW 10/1/2021 12:06:41'!
revisarCambioDeCalificacionDe: unPersonaje
	| cantidadInteraccionesConPersonaje |
	cantidadInteraccionesConPersonaje := interaccionesConPersonajes at: unPersonaje ifAbsent: [ 0 ].
	(cantidadInteraccionesConPersonaje = frasesDesconocido size) ifTrue: [
		self hacerPrometedorA: unPersonaje.
	]! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'MW 10/1/2021 12:25:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	interaccionesConPersonajes := ((Dictionary new) add: (#Hamilton->1); yourself).
	frasesDesconocido := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesPrometedor := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'TK 9/29/2021 11:23:36'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TK 9/29/2021 11:03:59'!
carolinaLaCurandera
	^ CarolinaLaCuranderaDeSkyrim! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TK 9/29/2021 11:04:30'!
hamilton
	^ #Hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'TK 9/29/2021 11:04:16'!
tirion
	^ #Tirion! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MW 10/1/2021 11:50:29'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^ PuebloRiverwood esPrometedor: unPersonaje! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'TK 9/29/2021 11:05:21'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCuranderaDeSkyrim olvidar! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MW 10/1/2021 11:50:29'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloRiverwood olvidarCalificaciones! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'MW 10/1/2021 11:50:29'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloRiverwood hacerPrometedorA: #Hamilton! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/27/2021 20:52:29'!
hamilton
	^ #Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/27/2021 21:08:21'!
tirion
	^ #Tirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MW 10/1/2021 11:50:29'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloRiverwood olvidarCalificaciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'MW 10/1/2021 11:50:29'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloRiverwood hacerPrometedorA: #Hamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PuebloRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PuebloRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuebloRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
PuebloRiverwood class
	instanceVariableNames: 'calificacionesPersonajes'!

!PuebloRiverwood class methodsFor: 'calificaciones' stamp: 'TK 9/29/2021 10:34:53'!
esPrometedor: unPersonaje
	^(calificacionesPersonajes at: unPersonaje ifAbsent: [ false ]).! !

!PuebloRiverwood class methodsFor: 'calificaciones' stamp: 'TK 9/29/2021 10:34:53'!
hacerPrometedorA: unPersonaje
	calificacionesPersonajes at: unPersonaje put: true! !

!PuebloRiverwood class methodsFor: 'calificaciones' stamp: 'TK 9/29/2021 10:34:53'!
olvidarCalificaciones
	calificacionesPersonajes  := Dictionary new.! !


!PuebloRiverwood class methodsFor: 'as yet unclassified' stamp: 'MW 10/1/2021 12:25:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	calificacionesPersonajes := ((Dictionary new)).! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesDesconocido frasesPrometedor interaccionesConPersonajes'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'MW 10/1/2021 11:50:47'!
interactuarCon: unPersonajeJugadorAInteractuar
	self recordarInteraccionCon: unPersonajeJugadorAInteractuar.
	^ self responderSegunCantidadDeInteracciones: unPersonajeJugadorAInteractuar! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'TK 9/29/2021 10:48:45'!
olvidar
	interaccionesConPersonajes := Dictionary new! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'TK 9/29/2021 11:02:14'!
reiniciarInteraccionesCon: unPersonajeAReiniciarInteracciones
	interaccionesConPersonajes at: unPersonajeAReiniciarInteracciones put: 0! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MW 10/1/2021 11:50:47'!
recordarInteraccionCon: unPersonajeARecordarInteraccion
	| cantidadInteraccionesConJugador |
	cantidadInteraccionesConJugador := interaccionesConPersonajes at: unPersonajeARecordarInteraccion ifAbsent: [ 0 ].
	interaccionesConPersonajes at: unPersonajeARecordarInteraccion put:  (cantidadInteraccionesConJugador  + 1)
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'MW 10/1/2021 11:50:29'!
responderSegunCantidadDeInteracciones: unPersonajeAResponder
	| cantidadInteraccionesConJugador |
	cantidadInteraccionesConJugador := interaccionesConPersonajes at: unPersonajeAResponder ifAbsent: [ 0 ].
	(PuebloRiverwood esPrometedor: unPersonajeAResponder) ifTrue: [
		^frasesPrometedor at: (cantidadInteraccionesConJugador min: frasesPrometedor size)
	] ifFalse: [
		^frasesDesconocido at: (cantidadInteraccionesConJugador min: frasesDesconocido size)
	].
	! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'MW 10/1/2021 12:25:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesDesconocido := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesPrometedor := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	interaccionesConPersonajes := ((Dictionary new) add: (#Hamilton->1); yourself).! !

CarolinaLaCuranderaDeSkyrim initializeAfterFileIn!
PuebloRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!