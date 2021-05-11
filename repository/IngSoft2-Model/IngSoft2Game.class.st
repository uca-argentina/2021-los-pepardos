Class {
	#name : #IngSoft2Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'dices',
		'board',
		'winner',
		'lapsNeededToCompleteToWin',
		'playerStatus',
		'leaderboard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
IngSoft2Game class >> beingPlayedBy: players with: dices on: aBoard [ 
	^self new initializeWith: players andWith: dices andWith: aBoard.
]

{ #category : #'instance creation' }
IngSoft2Game class >> beingPlayedBy: players with: dices on: aBoard wherePlayersNeedToComplete: anAmountOfLaps [
	^self new initializeWith: players andWith: dices andWith: aBoard wherePlayersNeedToComplete: anAmountOfLaps.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> checkAndUpdateWinner [

	|playerWinner|
	playerWinner := playerStatus select: [:eachPlayer | (eachPlayer at: 3) >= lapsNeededToCompleteToWin].
	playerWinner isNotEmpty
		ifTrue: [winner := (leaderboard at: 1)].
]

{ #category : #accessing }
IngSoft2Game >> hasFinished [
	winner ifNil: [ ^ false ] ifNotNil: [ ^ true ]
]

{ #category : #'instance creation' }
IngSoft2Game >> initializeWith: playingPlayers andWith: gameDices andWith: aBoard wherePlayersNeedToComplete: anAmountOfLaps [
	
	players := playingPlayers.
	dices := gameDices.
	board := aBoard.	
	lapsNeededToCompleteToWin := anAmountOfLaps.
	playerStatus := OrderedCollection new.
	playerStatus := players collect: [:aCurrentPlayer |  playerStatus add: {aCurrentPlayer . 1 . 0}].

]

{ #category : #'as yet unclassified' }
IngSoft2Game >> lapsCompletedBy: aPlayer [ 
	^((playerStatus detect: [:searchedPlayer | (searchedPlayer at: 1) == aPlayer]) at: 3)
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> lapsNeededToCompleteToWin [
	^lapsNeededToCompleteToWin.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> leaderboard [
	^leaderboard.
	
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> newLapsAfterRollingDiceOf: onePlayer [
	^ board
		obtainNewLapCountKnowingPlayerHas: (onePlayer at: 3)
		andRolled: ((onePlayer at: 1) rollDice: dices)
		andIsInPosition: (onePlayer at: 2)
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> newPositionAfterRollingDiceOf: onePlayer [
	^ board
		currentPosition: (onePlayer at: 2)
		whoRolled: ((onePlayer at: 1) rollDice: dices)
]

{ #category : #accessing }
IngSoft2Game >> playGame [
	self playTurn.
	self winner ifNil: [ self playGame ]
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> playTurn [
	playerStatus := playerStatus
		collect: [ :onePlayer | 
			{(onePlayer at: 1).
			(self newPositionAfterRollingDiceOf: onePlayer).
			(self newLapsAfterRollingDiceOf: onePlayer)} ].
	leaderboard := playerStatus.
	leaderboard
		sort: [ :onePlayer :anotherPlayer | 
			(self positionsTravelledBy: onePlayer)
				> (self positionsTravelledBy: anotherPlayer) ].
	leaderboard := leaderboard
		collect: [ :aPlayerStatus | aPlayerStatus at: 1 ].
	self checkAndUpdateWinner
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> positionOf: aPlayer [ 
	^((playerStatus detect: [:searchedPlayer | (searchedPlayer at: 1) == aPlayer]) at: 2)
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> positionsTravelledBy: onePlayer [
	^ (onePlayer at: 2) + ((onePlayer at: 3) * (board positions))
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> winner [
	^winner.
]
