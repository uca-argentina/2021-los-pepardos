Class {
	#name : #Dado,
	#superclass : #Object,
	#instVars : [
		'caras'
	],
	#classInstVars : [
		'caras'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Dado class >> caras [
	^ caras
]

{ #category : #'instance creation' }
Dado class >> conCaras: cantCaras [ 
	caras := cantCaras
]

{ #category : #accessing }
Dado >> caras [
	^ caras
]
