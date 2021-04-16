Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> withName: aName [
	^self new initializeWithName: aName.
]

{ #category : #'instance creation' }
Player >> initializeWithName: aName [
	name := aName.
	position := 0.
]

{ #category : #'as yet unclassified' }
Player >> position [
	^position.
]

{ #category : #'as yet unclassified' }
Player >> rollDice: aDice [ 
	^aDice obtainRandomFromDice.
]
