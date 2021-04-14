Class {
	#name : #DummyTest,
	#superclass : #TestCase,
	#classInstVars : [
		'conCaras',
		'unTablero'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DummyTest >> testDummy [
	"insertar pepardo"
	self assert: Dummy new isDummy
]

{ #category : #tests }
DummyTest >> testJugadorElDiegoSeLlamaElDiego [
	|jugador1|
	
	jugador1 := Jugador conNombre: 'El Diego'.
	
	self assert: (jugador1 nombreJugador) equals: 'El Diego'
	
	
	
	
]

{ #category : #tests }
DummyTest >> testSeTiranDosDadosDistintos [
	| listaDados dado1 dado2 min max jugador1|
	dado1 := Dado conCaras: 6.
	dado2 := Dado conCaras: 4.
	jugador1 := Jugador new.
	listaDados := OrderedCollection new.
	listaDados add: dado1.
	listaDados add: dado2. 
	
	jugador1 tirarDado: listaDados.
	
	min := listaDados size.
	max := listaDados sum: [:caras | caras caras]. "implementar la suma como mensaje"
	
	
	self assert: (jugador1 posicionTablero between: min and: max)
	
]

{ #category : #tests }
DummyTest >> testSiJugador1GanaElJuegoJugador1EsElGanador [

	| jugador1 unDado unTablero listaDados unaPartida listaJugadores |
	
	unaPartida := Partida new.
	jugador1 := Jugador new.
	unTablero := Tablero conPosiciones: 2.
	unDado := Dado conCaras: 2.
	
	listaJugadores := { jugador1 }.
	listaDados := { unDado }.
	
	unaPartida agregarJugadores: listaJugadores.
	unaPartida agregarDados: listaDados.
	unaPartida agregarTablero: unTablero.
	
	jugador1 tirarDado: listaDados.
	
	self assert: (unaPartida ganador) equals: 'Ramita'
]

{ #category : #tests }
DummyTest >> testSiUnJugadorLlegaALaUltimaPosicionLaPartidaTermina [

	|unTablero unJugador unDado listaDados |
	
	unTablero := Tablero conPosiciones: 2.
	unJugador := Jugador new.
	unDado := Dado conCaras: 2.
	listaDados := OrderedCollection new.
	listaDados add: unDado.
	
	unJugador tirarDado: listaDados. "Tirada 1"
	unJugador tirarDado: listaDados. "Tirada 2"
		
	self assert: unJugador posicionTablero >= unTablero posiciones 
]

{ #category : #tests }
DummyTest >> testUnDadoNuevoDe3CarasTiene3Caras [
	"insertar pepardo"
	| dadin |
	dadin := Dado conCaras: 3.
	self assert: (dadin caras) equals: 3
]

{ #category : #tests }
DummyTest >> testUnJugadorTiraUnDadoYAvanzaUnaPosicion [
	
	| dado6Caras jugadorCarlos listaDados |
	dado6Caras := Dado conCaras: 6.
	jugadorCarlos := Jugador conNombre: 'Ramita'.
	listaDados := OrderedCollection new.
	listaDados add: dado6Caras.
	
	jugadorCarlos tirarDado: listaDados.
	
	self assert: (jugadorCarlos posicionTablero between: 1 and: 6)
]

{ #category : #tests }
DummyTest >> testUnNuevoJugadorTienePosicion0 [
	| jugadorNuevo |
	jugadorNuevo := Jugador new.
	self assert: jugadorNuevo posicionTablero equals: 0
	
]

{ #category : #tests }
DummyTest >> testUnTableroNuevoCon50PosicionesTiene50Posiciones [
	"insertar pepardo"
	| unTablero |
	unTablero := Tablero conPosiciones: 50.
	self assert: (unTablero posiciones) equals: 50.
]

{ #category : #tests }
DummyTest >> testUnaPartidaTieneUnaListaDeJugadores [
	
	| listaJugadores jugador1 jugador2 unaPartida |
	unaPartida := Partida new.
	jugador1 := Jugador conNombre: 'dsadsa'.
	jugador2 := Jugador new.
	
	listaJugadores := { jugador1 . jugador2 }.
	unaPartida agregarJugadores: listaJugadores.
	
	self assert: (unaPartida jugadores) equals: listaJugadores.
	
]
