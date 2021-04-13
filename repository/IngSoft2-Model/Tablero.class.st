Class {
	#name : #Tablero,
	#superclass : #Object,
	#instVars : [
		'posiciones'
	],
	#classInstVars : [
		'posiciones',
		'jugadores'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Tablero class >> agregarJugadores: listaJugadores [
	jugadores add: listaJugadores.
]

{ #category : #'instance creation' }
Tablero class >> conPosiciones: posicionesTablero [
	posiciones := posicionesTablero.
]

{ #category : #'as yet unclassified' }
Tablero class >> posiciones [
	^ posiciones
]
