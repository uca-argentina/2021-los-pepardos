Class {
	#name : #Partida,
	#superclass : #Object,
	#instVars : [
		'jugadores',
		'dados',
		'tablero',
		'ganador'
	],
	#classInstVars : [
		'jugadores'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Partida >> agregarDados: listaDados [
	dados := listaDados 
]

{ #category : #'as yet unclassified' }
Partida >> agregarJugadores: listaJugadores [
	jugadores := listaJugadores.
]

{ #category : #'as yet unclassified' }
Partida >> agregarTablero: unTablero [
	tablero := unTablero
]

{ #category : #'instance creation' }
Partida >> elGanadorEs [
	(jugadores max: [:jugador | jugador posicionTablero]) >= (tablero posiciones)
		ifTrue: [ganador := (jugadores max: [:jugador | jugador posicionTablero])]
		
		
	
]

{ #category : #'as yet unclassified' }
Partida >> ganador [
	^ ganador
]

{ #category : #'as yet unclassified' }
Partida >> jugadores [
	^ jugadores
]
