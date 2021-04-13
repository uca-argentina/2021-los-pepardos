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
DummyTest >> testSeTiranDosDadosDistintos [
	| listaDados dado1 dado2 min max jugador1|
	dado1 := Dado conCaras: 6.
	dado2 := Dado conCaras: 6.
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
	jugadorCarlos := Jugador new.
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
DummyTest >> testUnTableroTieneUnaListaDeJugadores [
	
	| unTablero listaJugadores |
	unTablero := Tablero conPosiciones: 20.
	
	listaJugadores := { Jugador new . Jugador new }.
	unTablero agregarJugadores: listaJugadores.
	
	self assert: (unTablero jugadores) equals: listaJugadores.
	
]
