Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> withName: aName [
	^self new initializeWithName: aName.
]

{ #category : #initialization }
Player >> initializeWithName: aName [
	name := aName.
]

{ #category : #'as yet unclassified' }
Player >> rollDice: aDiceList [
	^aDiceList sum: [:dice | dice obtainRandomFromDice ].
	
	
]
