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
IngSoft2Game class >> beingPlayedBy: players with: dices on: aBoard wherePlayersNeedToComplete: anAmountOfLaps [
	^self new initializeWith: players andWith: dices andWith: aBoard wherePlayersNeedToComplete: anAmountOfLaps.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> activeEffectsOf: aPlayerName [
    ^((playerStatuses detect: [:searchedStatus | (searchedStatus player name) == aPlayerName]) activeEffects) collect: [ :eachCard | eachCard type ]
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> add: aCard toActiveEffectOf: aPlayerStatus [  
	aPlayerStatus activeEffectsAdd: aCard.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> amounfOfCardsOf: aPlayer [
	^ ((playerStatuses detect: [:searchedStatus | (searchedStatus player name) == aPlayer]) hand) cards size.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> applyBasicEffectTo: aPlayerStatus withARollOf: diceRollResult [ 

		aPlayerStatus updateBasicPositionTo: (self newPositionAfter: aPlayerStatus rolledADiceOf: diceRollResult) andLapsTo: (self newLapsAfter: aPlayerStatus rolledADiceOf: diceRollResult).
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> applyBoostTo: aPlayerStatus afterUsing: aCard [ 
	aCard applyCardEffectTo: aPlayerStatus.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> applyMoonwalkEffectTo: aPlayerStatus afterLandingOn: aMoonWalkPosition [
	
	| newBoardPosNumber |
	newBoardPosNumber := aPlayerStatus position.
	playerStatuses := playerStatuses do: [ :eachStatus | eachStatus correctPositionBy: (aMoonWalkPosition n) ].
	aPlayerStatus updatePositionTo: newBoardPosNumber.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> applyNukeEffectTo: aPlayerStatus [

	playerStatuses := playerStatuses collect: [ :eachPlayerStatus | eachPlayerStatus updatePositionTo: 1 ]
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
		ifTrue: [ ^(aPos + board positions) ].
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
	^(playerStatuses detect: [:searchedStatus | (searchedStatus player name) == aPlayer]) lap
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> leaderboard [
	^(leaderboard collect: [:eachPlayer | eachPlayer name])
	
]

{ #category : #accessing }
IngSoft2Game >> make: aPlayerName useCard: aCardType on: cardPlayerTargetName [

	| playerStatusOfCardUser playerStatusOfCardTarget cardRemoved |
	playerStatusOfCardUser := self playerStatusOf: aPlayerName.
	playerStatusOfCardTarget := self playerStatusOf: cardPlayerTargetName.
	
	(self thePlayer: playerStatusOfCardUser has: aCardType)
		ifFalse: [ ^ self ].
	cardRemoved := playerStatusOfCardUser removeCardOf: aCardType.
	self add: cardRemoved toActiveEffectOf: playerStatusOfCardTarget.
	self applyBoostTo: playerStatusOfCardTarget afterUsing: cardRemoved.
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
IngSoft2Game >> playIndividualTurnOfPlayer: playerStatus [

	| diceRollResult  newBoardPos newBoardPosNumber |
	
	diceRollResult := (playerStatus player rollDice: dices) + (playerStatus activeBoost).
	newBoardPosNumber := diceRollResult + playerStatus position.

	newBoardPosNumber > board positions
		ifTrue: [ newBoardPosNumber := newBoardPosNumber - board positions ].

	newBoardPos := ((board boardPositionsStatuses at: newBoardPosNumber) positionEffect).	
	newBoardPos applyEffectTo: playerStatus afterLandingOn: newBoardPos withARollOf: diceRollResult onGame: self. 

	self ensureBoardPositionsCompliantWithBoard.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> playTurn [
	
	playerStatuses do: [:playerStatus | self playIndividualTurnOfPlayer: playerStatus].
		
	leaderboard := playerStatuses  asSortedCollection: [ :oneStatus :anotherStatus  | (self positionsTravelledBy: oneStatus) >= (self positionsTravelledBy: anotherStatus) ].
	leaderboard := leaderboard	collect: [ :aPlayerStatus | aPlayerStatus player ].

	self checkAndUpdateWinner
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> playerStatusOf: aPlayerName [
		^playerStatuses detect: [:aStatus | (aStatus player) name == aPlayerName]
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
IngSoft2Game >> thePlayer: aPlayerStatus has: aString [ 
	((aPlayerStatus hand) cards collect: [ :card | card type = aString ]) isEmpty
	ifTrue: [ ^false ].
	^true.
	
	
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> winner [
	^winner.
]

{ #category : #'as yet unclassified' }
IngSoft2Game >> winnerName [
	^self winner name 
]
