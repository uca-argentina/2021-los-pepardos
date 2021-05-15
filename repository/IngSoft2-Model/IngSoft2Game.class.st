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
IngSoft2Game >> newLapsAfter: onePlayerStatus rolledADiceOf: aDiceRollResult [
	^ board obtainNewLapCountKnowingPlayerHas: (onePlayerStatus at: 3) andRolled: (aDiceRollResult) andIsInPosition: (onePlayerStatus at: 2)
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> newPositionAfter: onePlayerStatus rolledADiceOf: aDiceRollResult [
	^ board currentPosition: (onePlayerStatus at: 2)	whoRolled: aDiceRollResult
]

{ #category : #accessing }
IngSoft2Game >> playGame [
	self playTurn.
	self winner ifNil: [ self playGame ]
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> playIndividualTurnOfPlayer: playerNumber [
	
	"playerStatus := playerStatus collect: [ :onePlayer | {(onePlayer at: 1).(self newPositionAfterRollingDiceOf: onePlayer).(self newLapsAfterRollingDiceOf: onePlayer)} ]."
	| diceRollResult |
	diceRollResult := ((playerStatus at: playerNumber)at:1) rollDice: dices.
	
	playerStatus at: playerNumber put: { ((playerStatus at: playerNumber) at: 1).(self newPositionAfter: (playerStatus at: playerNumber) rolledADiceOf: diceRollResult).(self newLapsAfter: (playerStatus at: playerNumber) rolledADiceOf: diceRollResult)}.
"	((playerStatus at: playerNumber)at:2) = (self newPositionAfter: (playerStatus at: playerNumber) rolledADiceOf: diceRollResult).
	((playerStatus at: playerNumber)at:3) = (self newLapsAfter: (playerStatus at: playerNumber) rolledADiceOf: diceRollResult)."
	
	
	
	


]

{ #category : #'as yet unclassified' }
IngSoft2Game >> playTurn [
	
	1 to: (playerStatus size) do: [ :i | self playIndividualTurnOfPlayer: i ].
	"playerStatus := playerStatus collect: [ :onePlayer | {(onePlayer at: 1).(self newPositionAfterRollingDiceOf: onePlayer).(self newLapsAfterRollingDiceOf: onePlayer)} ]."
	
	leaderboard := playerStatus.
	
	leaderboard	sort: [ :onePlayer :anotherPlayer | (self positionsTravelledBy: onePlayer) > (self positionsTravelledBy: anotherPlayer) ].
	leaderboard := leaderboard	collect: [ :aPlayerStatus | aPlayerStatus at: 1 ].

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
