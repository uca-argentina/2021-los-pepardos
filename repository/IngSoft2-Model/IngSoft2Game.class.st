"
I am an IngSoft2Game.

"
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
		'playerStatuses',
		'lastCardPlayed',
		'currentTurn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
IngSoft2Game class >> assertNameOfPlayerIsNotRepeated: players [
	
	|cantRep repetitions|
	
	repetitions := players collect: [:i | players collect: [:j| i = j]].
	cantRep := (repetitions at: 1) count: [:i | i].
	cantRep > 1
		ifTrue:[Error signal: 'The name of a player is already in use'].
]

{ #category : #'as yet unclassified' }
IngSoft2Game class >> assertTheGameHasAtLeastOneDie: dices [
	dices isEmpty
		ifTrue: [ Error signal: 'The game has to have at least one die' ]
]

{ #category : #'as yet unclassified' }
IngSoft2Game class >> assertValidLaps: laps [ 
	laps > 0
		ifFalse: [ Error signal: 'Game must have more than one lap' ]
]

{ #category : #'as yet unclassified' }
IngSoft2Game class >> assertValidNameOfPlayers: players [
	((players collect: [:player | player = '']) includes: true)
		ifTrue: [Error signal: 'A player cannot be initialized without a name'].
]

{ #category : #'as yet unclassified' }
IngSoft2Game class >> assertValidPlayers: players [
	players size < 1
		ifTrue: [ Error signal: 'Game must have at least one player' ]
]

{ #category : #'instance creation' }
IngSoft2Game class >> beingPlayedBy: players with: dices on: aBoard wherePlayersNeedToComplete: anAmountOfLaps [
	self assertValidLaps: anAmountOfLaps.
	self assertValidPlayers: players.
	self assertValidNameOfPlayers: players.
	self assertNameOfPlayerIsNotRepeated: players.
	self assertTheGameHasAtLeastOneDie: dices.
			^self new initializeWith: players andWith: dices andWith: aBoard wherePlayersNeedToComplete: anAmountOfLaps.
]

{ #category : #'playerStatus ' }
IngSoft2Game >> activeEffectsOf: aPlayerName [
    ^((playerStatuses detect: [:searchedStatus | (searchedStatus player name) == aPlayerName]) activeEffects) collect: [ :eachCard | eachCard type ]
]

{ #category : #'card effect' }
IngSoft2Game >> add: aCard toActiveEffectOf: aPlayerStatus [  
	aPlayerStatus activeEffectsAdd: aCard.
]

{ #category : #'card effect' }
IngSoft2Game >> addThe: aCard toHistoryOf: aPlayerStatus [ 
	aCard isPermanent 
		ifTrue: [lastCardPlayed := aCard].
	aPlayerStatus addToCardPlayedHistory: aCard.
]

{ #category : #'playerStatus ' }
IngSoft2Game >> amounfOfCardsOf: aPlayer [
	^ ((playerStatuses detect: [:searchedStatus | (searchedStatus player name) == aPlayer]) hand) cards size.
]

{ #category : #'card effect' }
IngSoft2Game >> applyBoostTo: aPlayerStatus afterUsing: aCard [ 
	aCard applyCardEffectTo: aPlayerStatus on: self.
]

{ #category : #asserting }
IngSoft2Game >> assert: playerStatus hasA: aCard [
	(((playerStatus hand) cards collect: [ :card | card type = aCard ]) includes: true)
		ifFalse: [ Error signal: 'Player doesnt own that card' ].

	
	
]

{ #category : #asserting }
IngSoft2Game >> assert: playerName hasTheActiveEffectOf: aCard [
	(((self playerStatusOf: playerName) activeEffects collect: [ :card | card type ]) includes: aCard)
		ifFalse: [ Error signal: 'Player has no such active effect' ].
]

{ #category : #asserting }
IngSoft2Game >> assertGameIsBeingPlayedBy: aPlayerName [
	((playerStatuses collect: [:aStatus | (aStatus player) name == aPlayerName]) includes: true)
		ifFalse: [ Error signal: 'Incorrect player' ].
			

]

{ #category : #asserting }
IngSoft2Game >> assertPermanentCardPlayedOnTurnOf: playerStatusOfCardUser [
	(playerStatuses at: currentTurn) = playerStatusOfCardUser 
	ifFalse: [ Error signal: 'Permanent cards can only be used during the players turn' ]
]

{ #category : #'card effect' }
IngSoft2Game >> boostEveryPlayerBy: aNumber [
	playerStatuses do: [ :each | each modifyActiveBoostBy: aNumber ].
	
]

{ #category : #'game status' }
IngSoft2Game >> checkAndUpdateWinner [

	|playerWinner|
	playerWinner := playerStatuses select: [:eachStatus | (eachStatus lap) >= lapsNeededToCompleteToWin].
	playerWinner isNotEmpty
		ifTrue: [winner := (playerWinner first player)].
]

{ #category : #'position modification' }
IngSoft2Game >> correctAllPlayersPositionBy: anNumber [
	playerStatuses := playerStatuses do: [ :eachStatus | eachStatus correctPositionBy: anNumber ].
]

{ #category : #'position modification' }
IngSoft2Game >> correctedPositionOf: aPos [
	aPos = 0
		ifTrue:[	^(board positions) ].
	aPos < 0
		ifTrue: [ ^(aPos + board positions +1) ].
	^aPos
]

{ #category : #'game status' }
IngSoft2Game >> ensureBoardPositionsCompliantWithBoard [
	playerStatuses := playerStatuses do: [ :x | x updatePositionTo: (self correctedPositionOf: x position) ].
]

{ #category : #'game status' }
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
	currentTurn := 1.

]

{ #category : #'playerStatus ' }
IngSoft2Game >> lapsCompletedBy: aPlayer [ 
	^(playerStatuses detect: [:searchedStatus | (searchedStatus player name) == aPlayer]) lap
]

{ #category : #'game status' }
IngSoft2Game >> lastCardPlayed [
	^ lastCardPlayed
]

{ #category : #'game status' }
IngSoft2Game >> lastCardPlayedBy: aPlayerName [

	| cardPlayerStatus |
	
	cardPlayerStatus := self playerStatusOf: aPlayerName. 
	^ (cardPlayerStatus cardHistory last).
]

{ #category : #'game status' }
IngSoft2Game >> leaderboard [
	^(leaderboard collect: [:eachPlayer | eachPlayer name])
	
]

{ #category : #'card effect' }
IngSoft2Game >> make: aPlayerName useCard: aCardType on: cardPlayerTargetName [

	| playerStatusOfCardUser playerStatusOfCardTarget cardRemoved |
		
	playerStatusOfCardUser := self playerStatusOf: aPlayerName.
	playerStatusOfCardTarget := self playerStatusOf: cardPlayerTargetName.
	
	self assert: playerStatusOfCardUser hasA: aCardType.

	(playerStatusOfCardUser hand cards detect: [:card | (card type) = aCardType]) isPermanent
		ifTrue: [self assertPermanentCardPlayedOnTurnOf: playerStatusOfCardUser].
		
	cardRemoved := playerStatusOfCardUser remove: aCardType.
	cardRemoved isPermanent
	ifTrue: [ self add: cardRemoved toActiveEffectOf: playerStatusOfCardTarget].

	self applyBoostTo: playerStatusOfCardTarget afterUsing: cardRemoved.
	self addThe: cardRemoved toHistoryOf: playerStatusOfCardUser.
]

{ #category : #'card effect' }
IngSoft2Game >> make: aPlayerName useCard: aCardType on: cardPlayerTargetName toRemove: removedCardType [
	
	| playerStatusOfCardUser playerStatusOfCardTarget  effectRemoved cardRemoved |

	self assert: cardPlayerTargetName hasTheActiveEffectOf: removedCardType.

	playerStatusOfCardUser := self playerStatusOf: aPlayerName.
	playerStatusOfCardTarget := self playerStatusOf: cardPlayerTargetName.
	
	(playerStatusOfCardUser hand cards detect: [:card | (card type) = aCardType]) isPermanent
		ifTrue: [self assertPermanentCardPlayedOnTurnOf: playerStatusOfCardUser].
	
	self assert: playerStatusOfCardUser hasA: aCardType.
		
	cardRemoved := playerStatusOfCardUser remove: aCardType.
	effectRemoved := playerStatusOfCardTarget removeActiveEffectOf: removedCardType.
	
	removedCardType = 'Acceleration'
		ifTrue: [ self boostEveryPlayerBy: -1 ]
		ifFalse: [ playerStatusOfCardTarget modifyActiveBoostBy: (effectRemoved boostApplied negated) ].
	
	self addThe: cardRemoved toHistoryOf: playerStatusOfCardUser.

	
]

{ #category : #'position modification' }
IngSoft2Game >> makeAllPlayersBeInPosition: anPosition [
	playerStatuses := playerStatuses collect: [ :eachPlayerStatus | eachPlayerStatus updatePositionTo: 1 ]
]

{ #category : #'position modification' }
IngSoft2Game >> newLapsAfter: onePlayerStatus rolledADiceOf: aDiceRollResult [
	^ board obtainNewLapCountKnowingPlayerHas: (onePlayerStatus lap) andRolled: (aDiceRollResult) andIsInPosition: (onePlayerStatus position)
]

{ #category : #'position modification' }
IngSoft2Game >> newPositionAfter: onePlayerStatus rolledADiceOf: aDiceRollResult [
	^ board currentPosition: (onePlayerStatus position)	whoRolled: aDiceRollResult
]

{ #category : #'card effect' }
IngSoft2Game >> play: aCard on: aPlayerStatus [ 

	aCard isPermanent
		ifTrue: [ self add: aCard toActiveEffectOf: aPlayerStatus].
				
	self applyBoostTo: aPlayerStatus afterUsing: aCard.

]

{ #category : #play }
IngSoft2Game >> playGame [
	self playRound.
	self winner ifNil: [ self playGame ]
]

{ #category : #play }
IngSoft2Game >> playIndividualTurnOfPlayer: playerStatus [

	| diceRollResult |

	diceRollResult := (playerStatus player rollDice: dices) + playerStatus activeBoost.
	board movePlayer: playerStatus by: diceRollResult on: self.
	
	self ensureBoardPositionsCompliantWithBoard.
	
	currentTurn >= playerStatuses size 
	ifTrue: [ currentTurn := 1 ]
	ifFalse: [ currentTurn + 1 ].


]

{ #category : #play }
IngSoft2Game >> playRound [
	
	self hasFinished
		ifTrue: [self raiseExceptionThatTheGameCannotLongerBePlayed].
		
	playerStatuses do: [:playerStatus | self playIndividualTurnOfPlayer: playerStatus].
	
	leaderboard := playerStatuses  asSortedCollection: [ :oneStatus :anotherStatus  | (self positionsTravelledBy: oneStatus) >= (self positionsTravelledBy: anotherStatus) ].
	leaderboard := leaderboard	collect: [ :aPlayerStatus | aPlayerStatus player ].

	self checkAndUpdateWinner
]

{ #category : #'playerStatus ' }
IngSoft2Game >> playerStatusOf: aPlayerName [
	self assertGameIsBeingPlayedBy: aPlayerName.
		^playerStatuses detect: [:aStatus | (aStatus player) name == aPlayerName]
]

{ #category : #'playerStatus ' }
IngSoft2Game >> positionOf: aPlayerName [ 
	^((playerStatuses detect: [:aStatus | (aStatus player) name == aPlayerName]) position)
]

{ #category : #'playerStatus ' }
IngSoft2Game >> positionsTravelledBy: oneStatus [
	^ (oneStatus position) + ((oneStatus lap) * (board positions))
]

{ #category : #asserting }
IngSoft2Game >> raiseExceptionThatTheGameCannotLongerBePlayed [
	Error signal: 'The game has already finished'.
]

{ #category : #'game status' }
IngSoft2Game >> winner [
	^winner.
]

{ #category : #'game status' }
IngSoft2Game >> winnerName [
	^self winner name 
]
