"
I am a Dice.
I know how to roll and return the result.
I know I have an amount of sides.
"
Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'sides'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Dice class >> assertValidSides: numberOfSides [
	numberOfSides >= 3
		ifFalse: [ Error signal: 'Sides must be at least 3' ]
]

{ #category : #'instance creation' }
Dice class >> withSides: numberOfSides [
	self assertValidSides: numberOfSides.
	^ self new initializeWithSides: numberOfSides
]

{ #category : #'instance creation' }
Dice >> initializeWithSides: numberOfSides [
	sides := numberOfSides.
]

{ #category : #'dice roll' }
Dice >> roll [
	^Random new seed % sides + 1.
]
