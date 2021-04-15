Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'sides'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Dice class >> withSides: numberOfSides [
	^self new initializeWithSides: numberOfSides.
]

{ #category : #'as yet unclassified' }
Dice >> initializeWithSides: aNumberOfSides [ 
	sides := aNumberOfSides.
]

{ #category : #'as yet unclassified' }
Dice >> obtainRandomFromDice [
	^Random new seed % sides + 1.
]
