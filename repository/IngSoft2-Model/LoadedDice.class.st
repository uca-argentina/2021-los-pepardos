Class {
	#name : #LoadedDice,
	#superclass : #Object,
	#instVars : [
		'resultReturned'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
LoadedDice class >> rolling: aNumber [ 
	^self new initializeWithFixedRollOf: aNumber
]

{ #category : #'as yet unclassified' }
LoadedDice >> initializeWithFixedRollOf: aNumber [
	resultReturned := aNumber.
]

{ #category : #'as yet unclassified' }
LoadedDice >> roll [
	^resultReturned 
]
