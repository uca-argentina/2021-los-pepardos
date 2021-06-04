Class {
	#name : #IngSoft2Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'dices',
		'board',
		'winner',
		'lapsNeededToCompleteToWin',
		'leaderboard',
		'playerStatuses'
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
	playerWinner := playerStatuses select: [:eachStatus | (eachStatus lap) >= lapsNeededToCompleteToWin].
	playerWinner isNotEmpty
		ifTrue: [winner := (playerWinner first player)].
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> correctedPositionOf: aPos [
	aPos = 0
		ifTrue:[	^(board positions) ].
	aPos < 0
		ifTrue: [ ^(aPos + board positions + 1) ].
	^aPos
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> ensureBoardPositionsCompliantWithBoard [
	playerStatuses := playerStatuses do: [ :x | x updatePositionTo: (self correctedPositionOf: x position) ].
]

{ #category : #accessing }
IngSoft2Game >> hasFinished [
	winner ifNil: [ ^ false ] ifNotNil: [ ^ true ]
]

{ #category : #'instance creation' }
IngSoft2Game >> initializeWith: playingPlayers andWith: gameDices andWith: aBoard wherePlayersNeedToComplete: anAmountOfLaps [
	
	players := playingPlayers collect: [:playerName| Player withName: playerName].
	dices := gameDices.
	board := aBoard.	
	lapsNeededToCompleteToWin := anAmountOfLaps.
	playerStatuses := players collect: [:player|  PlayerStatus of: player with: 1 at: 0 ].

]

{ #category : #'as yet unclassified' }
IngSoft2Game >> lapsCompletedBy: aPlayer [ 
	^((playerStatuses detect: [:searchedPlayer | (searchedPlayer at: 1) == aPlayer]) at: 3)
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
	^ board obtainNewLapCountKnowingPlayerHas: (onePlayerStatus lap) andRolled: (aDiceRollResult) andIsInPosition: (onePlayerStatus position)
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> newPositionAfter: onePlayerStatus rolledADiceOf: aDiceRollResult [
	^ board currentPosition: (onePlayerStatus position)	whoRolled: aDiceRollResult
]

{ #category : #accessing }
IngSoft2Game >> playGame [
	self playTurn.
	self winner ifNil: [ self playGame ]
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> playIndividualTurnOfPlayer: playerNumber [
	| diceRollResult newBoardPos newBoardPosNumber currentPlayerStatus |
	
	currentPlayerStatus := playerStatuses at: playerNumber.
	diceRollResult := currentPlayerStatus player rollDice: dices.
	newBoardPosNumber := diceRollResult + currentPlayerStatus position.
	
	newBoardPosNumber > board positions
		ifTrue: [ newBoardPosNumber := newBoardPosNumber - board positions ].
		
	newBoardPos := (board boardPositionsStatus at: newBoardPosNumber) second.
	
	(newBoardPos isKindOf: SpeedUpPosition)	| (newBoardPos isKindOf: NonEffectPosition) 	| (newBoardPos isKindOf: WormHolePosition)
		ifTrue: [ 
			currentPlayerStatus updatePositionTo: (self newPositionAfter: currentPlayerStatus rolledADiceOf: diceRollResult) andLapsTo: (self newLapsAfter: currentPlayerStatus	rolledADiceOf: diceRollResult) ].

	(newBoardPos isKindOf: MoonWalkPosition)
		ifTrue: [ playerStatuses := playerStatuses do: [ :eachStatus | eachStatus correctPositionBy: (newBoardPos n) ].
			currentPlayerStatus updatePositionTo: newBoardPosNumber ].
		
	(newBoardPos isKindOf: NukePosition)
		ifTrue: [ playerStatuses := playerStatuses collect: 	[ :eachPlayerStatus | eachPlayerStatus updatePositionTo: 1 ] ].
	
	self ensureBoardPositionsCompliantWithBoard.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> playTurn [
	
	1 to: (playerStatuses size) do: [ :i | self playIndividualTurnOfPlayer: i ].
		
	leaderboard := playerStatuses  asSortedCollection: [ :oneStatus :anotherStatus  | (self positionsTravelledBy: oneStatus) >= (self positionsTravelledBy: anotherStatus) ].
	leaderboard := leaderboard	collect: [ :aPlayerStatus | aPlayerStatus player ].

	self checkAndUpdateWinner
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> positionOf: aPlayerName [ 
	^((playerStatuses detect: [:aStatus | (aStatus player) name == aPlayerName]) position)
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> positionsTravelledBy: oneStatus [
	^ (oneStatus position) + ((oneStatus lap) * (board positions))
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> winner [
	^winner.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> winnerName [
	^self winner name 
]
