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

{ #category : #'as yet unclassified' }
Dice >> roll [
	^Random new seed % sides + 1.
]
