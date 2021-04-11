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
	
	self assert: jugadorCarlos posicionTablero between: 0 and: 6
]

{ #category : #tests }
DummyTest >> testUnNuevoJugadorTienePosicion0 [
	| jugadorNuevo |
	jugadorNuevo := Jugador new.
	self assert: jugadorNuevo posicionTablero equals: 0
	
]
