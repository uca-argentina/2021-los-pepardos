Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'playerList',
		'diceList',
		'gameBoard',
		'winner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withPlayers: players withDices: dices withBoard: board [
	^self new initializeGameWithPlayers: players initializeGameWithDices: dices initializeGameWithBoard: board.
]

{ #category : #initialization }
Game >> initializeGameWithPlayers: players initializeGameWithDices: dices initializeGameWithBoard: board [
	playerList := players.
	diceList := dices.
	gameBoard := board.
]

{ #category : #'as yet unclassified' }
Game >> movePlayer: aPlayer byTheAmountOfPositions: anInteger [ 
	self shouldBeImplemented.
]

{ #category : #'accessing instances and variables' }
Game >> winner [
	^winner
]
