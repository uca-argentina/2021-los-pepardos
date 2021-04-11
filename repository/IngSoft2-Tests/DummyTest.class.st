Class {
	#name : #DummyTest,
	#superclass : #TestCase,
	#classInstVars : [
		'conCaras'
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
	
	jugador1 tirarDado: dado1.
	jugador1 tirarDado: dado2.
	
	min := listaDados size.
	max := dado1 caras + dado2 caras.
	
	
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
	
	| dado6Caras jugadorCarlos |
	dado6Caras := Dado conCaras: 6.
	jugadorCarlos := Jugador new.
	
	jugadorCarlos tirarDado: dado6Caras.
	
	self assert: (jugadorCarlos posicionTablero between: 1 and: 6)
]

{ #category : #tests }
DummyTest >> testUnNuevoJugadorTienePosicion0 [
	| jugadorNuevo |
	jugadorNuevo := Jugador new.
	self assert: jugadorNuevo posicionTablero equals: 0
	
]
