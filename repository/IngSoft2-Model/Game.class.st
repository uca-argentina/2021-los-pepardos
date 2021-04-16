Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'player',
		'dice',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withPlayer: aPlayer andDice: aDice andBoard: aBoard [ 
	^self new initializeWithAPlayer: aPlayer andWithDice: aDice andWithBoard: aBoard.
]

{ #category : #'instance creation' }
Game >> initializeWithAPlayer: aPlayer andWithDice: aDice andWithBoard: aBoard [ 
	player := aPlayer.
	dice := aDice.
	board := aBoard.
]

{ #category : #'as yet unclassified' }
Game >> update: aPlayer positionInBoardBy: numberRolledOnDice [
	aPlayer position += numberRolledOnDice.
]
