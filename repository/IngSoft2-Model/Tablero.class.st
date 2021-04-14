Class {
	#name : #Tablero,
	#superclass : #Object,
	#instVars : [
		'posiciones'
	],
	#classInstVars : [
		'posiciones'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Tablero class >> conPosiciones: posicionesTablero [
	posiciones := posicionesTablero.
]

{ #category : #'as yet unclassified' }
Tablero class >> posiciones [
	^ posiciones
]
