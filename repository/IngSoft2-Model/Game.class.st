Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'player',
		'dice',
		'board',
		'winner',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withPlayer: aPlayer andDice: aDice andBoard: aBoard [ 
	^self new initializeWithAPlayer: aPlayer andWithDice: aDice andWithBoard: aBoard.
]

{ #category : #'as yet unclassified' }
Game >> checkWinner [

	winner := ((player select: [:each | (each  at: 2)> board positions]) at: 1) at:1
]

{ #category : #'instance creation' }
Game >> initializeWithAPlayer: aPlayerList andWithDice: aDice andWithBoard: aBoard [ 
	position := 0.
	player := OrderedCollection new.
	
	player := aPlayerList collect: [:aCurrentPlayer |  player add: {aCurrentPlayer . position}].

	dice := aDice.
	board := aBoard.
]

{ #category : #'as yet unclassified' }
Game >> update: aPlayer whoIsPlayer: playerNumber positionInBoardBy: numberRolledOnDice [

    (player at: playerNumber) at: 2 put: (numberRolledOnDice  + aPlayer position).
]

{ #category : #'as yet unclassified' }
Game >> winner [
	^winner. 
]
