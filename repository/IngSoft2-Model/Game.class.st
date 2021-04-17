Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'player',
		'dice',
		'board',
		'winner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withPlayer: aPlayer andDice: aDice andBoard: aBoard [ 
	^self new initializeWithAPlayer: aPlayer andWithDice: aDice andWithBoard: aBoard.
]

{ #category : #'as yet unclassified' }
Game >> checkWinner [

	
	player position >= board positions
		ifTrue: [winner := player name ]
		ifFalse: [winner := 'No gano nadie ']
	
	
]

{ #category : #'instance creation' }
Game >> initializeWithAPlayer: aPlayer andWithDice: aDice andWithBoard: aBoard [ 
	player := aPlayer.
	dice := aDice.
	board := aBoard.
]

{ #category : #'as yet unclassified' }
Game >> update: aPlayer positionInBoardBy: numberRolledOnDice [
	|positionPerPlayer|
	positionPerPlayer := aPlayer position + numberRolledOnDice.
	
]

{ #category : #'as yet unclassified' }
Game >> winner [
	^winner. 
]
