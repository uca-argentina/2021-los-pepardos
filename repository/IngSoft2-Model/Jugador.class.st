Class {
	#name : #Jugador,
	#superclass : #Object,
	#instVars : [
		'posicionTablero'
	],
	#classInstVars : [
		'nombreJugador'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Jugador class >> conNombre: unNombre [
	nombreJugador := unNombre 
]

{ #category : #'as yet unclassified' }
Jugador class >> nombreJugador [
	^ nombreJugador
]

{ #category : #'as yet unclassified' }
Jugador >> initialize [
	posicionTablero := 0.
]

{ #category : #'as yet unclassified' }
Jugador >> posicionTablero [
	^posicionTablero.
]

{ #category : #'as yet unclassified' }
Jugador >> tirarDado: listaDados [
	| numeroRandom sumaCaras|
	sumaCaras := listaDados sum: [:caras | caras caras].
	numeroRandom := Random new.
	posicionTablero := posicionTablero + (numeroRandom seed % sumaCaras) + 1
]
