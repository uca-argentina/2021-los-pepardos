Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'dices',
		'board',
		'leaderboard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withPlayer: aPlayer andDice: aDice andBoard: aBoard [ 
	^self new initializeWithAPlayer: aPlayer andWithDice: aDice andWithBoard: aBoard.
]

{ #category : #'as yet unclassified' }
Game >> checkAndUpdateWinner [

	|playerWinner|
	playerWinner = (players select: [:each | (each  at: 2) >= board positions]).
	
	playerWinner isEmpty
	ifTrue: [leaderboard add: (playerWinner at: 1) ].
]

{ #category : #'as yet unclassified' }
Game >> getPositionOfPlayer: playerNumber [
	^(players at:playerNumber ) at:2
]

{ #category : #'instance creation' }
Game >> initializeWithAPlayer: aPlayerList andWithDice: aDice andWithBoard: aBoard [ 
	|position|
	position := 0.
	players := OrderedCollection new.
	
	players := aPlayerList collect: [:aCurrentPlayer |  players add: {aCurrentPlayer . position}].

	dices := aDice.
	board := aBoard.
	leaderboard := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Game >> isFinished [
	leaderboard size >= 1
		ifTrue: [ ^true ]
		ifFalse: [ ^false ]
]

{ #category : #accessing }
Game >> playGame [
	self playTurn.
	^ self.
]

{ #category : #'as yet unclassified' }
Game >> playTurn [

	players := players collect: [ :onePlayer | {(onePlayer at: 1).(onePlayer at: 2) + ((onePlayer at: 1) rollDice: dices)} ].

	self checkAndUpdateWinner.

	

	
]

{ #category : #'as yet unclassified' }
Game >> player [
	^ players
]

{ #category : #'as yet unclassified' }
Game >> update: aPlayer whoIsPlayer: playerNumber positionInBoardBy: numberRolledOnDice [
	|playerPos|
	playerPos := (players at: playerNumber) at: 2.
   (players at: playerNumber) at: 2 put: (numberRolledOnDice  + playerPos).
	
	(players select: [:each | (each  at: 2)>= board positions]) isEmpty 
		ifFalse: [ self checkAndUpdateWinner ] 
	
	

]

{ #category : #'as yet unclassified' }
Game >> winner [
	^leaderboard at: 1. 
]
