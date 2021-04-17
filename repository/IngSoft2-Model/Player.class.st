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
	position := 1.
]

{ #category : #'as yet unclassified' }
Player >> name [
	^ name
]

{ #category : #'as yet unclassified' }
Player >> position [
	^position.
]

{ #category : #'as yet unclassified' }
Player >> rollDice: aDiceList [ 
	|amountOfDices|
	amountOfDices := aDiceList size.
	amountOfDices == 1
		ifTrue: [^(aDiceList at:1) obtainRandomFromDice.]
		ifFalse: [^(aDiceList sum: [:dice | dice obtainRandomFromDice]) + (amountOfDices - 1)]. 

]
