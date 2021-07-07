"
LoadedDice used on the tests to obtain a particular dice result.
"
Class {
	#name : #LoadedDice,
	#superclass : #Object,
	#instVars : [
		'resultReturned'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'as yet unclassified' }
LoadedDice class >> rolling: aNumber [ 
	^self new initializeWithFixedRollOf: aNumber
]

{ #category : #initialization }
LoadedDice >> initializeWithFixedRollOf: aNumber [
	resultReturned := aNumber.
]

{ #category : #'dice roll' }
LoadedDice >> roll [
	^resultReturned 
]
