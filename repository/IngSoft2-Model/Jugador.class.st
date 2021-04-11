Class {
	#name : #Jugador,
	#superclass : #Object,
	#instVars : [
		'posicionTablero'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Jugador >> initialize [
	posicionTablero := 0.
]

{ #category : #'as yet unclassified' }
Jugador >> posicionTablero [
	^posicionTablero.
]

{ #category : #'as yet unclassified' }
Jugador >> tirarDado: unDado [
	| numeroRandom |
	numeroRandom := Random new 
	self posicionTablero += numeroRandom	
]
