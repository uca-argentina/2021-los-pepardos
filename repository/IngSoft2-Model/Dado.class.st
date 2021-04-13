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

{ #category : #accessing }
Dado class >> caras [
	^ caras
]

{ #category : #'instance creation' }
Dado class >> conCaras: cantCaras [ 
	caras := cantCaras
]
