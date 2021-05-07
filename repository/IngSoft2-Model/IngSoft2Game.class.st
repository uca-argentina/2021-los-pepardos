Class {
	#name : #IngSoft2Game,
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
IngSoft2Game class >> beingPlayedBy: players with: dices on: aBoard [ 
	^self new initializeWithAPlayer: players andWithDice: dices andWithBoard: aBoard.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> checkAndUpdateWinner [

	|playerWinner|
	playerWinner := players select: [:eachPlayer | (eachPlayer at: 2) >= board positions].
	playerWinner isNotEmpty
		ifTrue: [leaderboard add: ((playerWinner at: 1) at: 1)].
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> hasFinished [
	leaderboard isEmpty
		ifTrue: [ ^false ]
		ifFalse: [ ^true ].
]

{ #category : #'instance creation' }
IngSoft2Game >> initializeWithAPlayer: aPlayerList andWithDice: aDice andWithBoard: aBoard [ 
	|position|
	position := 0.
	players := OrderedCollection new.
	
	players := aPlayerList collect: [:aCurrentPlayer |  players add: {aCurrentPlayer . position}].

	dices := aDice.
	board := aBoard.
	leaderboard := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> leaderboard [
	^ leaderboard
]

{ #category : #accessing }
IngSoft2Game >> playGame [
	self playTurn.
	leaderboard isEmpty 
	ifTrue:[self playGame].
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> playTurn [

	players := players collect: [ :onePlayer | {(onePlayer at: 1).(onePlayer at: 2) + ((onePlayer at: 1) rollDice: dices)} ].

	self checkAndUpdateWinner.

	

	
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> positionOf: aPlayer [ 
	^((players detect: [:searchedPlayer | (searchedPlayer at: 1) == aPlayer]) at: 2)
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> winner [
	^(leaderboard at: 1).
]
