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
		'currentTurn',
		'lastEffectApplied'
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
    ^(playerStatuses detect: [:searchedStatus | (searchedStatus player name) == aPlayerName]) activeEffects
]

{ #category : #'playerStatus ' }
IngSoft2Game >> amounfOfCardsOf: aPlayer [
	^ ((playerStatuses detect: [:searchedStatus | (searchedStatus player name) == aPlayer]) hand) cards size.
]

{ #category : #'effect application' }
IngSoft2Game >> applyCancellationEffectOn: aCardTarget [ 

	| playerStatusOfTarget |

	playerStatusOfTarget := self playerStatusOf: (aCardTarget playerName).
		
	self removeActiveEffectOf: (aCardTarget card) from: playerStatusOfTarget.
	(aCardTarget card) removeBoostProvidedFrom: playerStatusOfTarget on: self. 
]

{ #category : #'effect application' }
IngSoft2Game >> applyRedoCardEffectOn: aPlayerStatus playedBy: cardUser [
	lastCardPlayed applyCardEffectTo: aPlayerStatus on: self playedBy: cardUser
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

{ #category : #accessing }
IngSoft2Game >> board [
	^ board
]

{ #category : #'effect application' }
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

{ #category : #'playerStatus ' }
IngSoft2Game >> existsPlayerWithName: aPlayerName [ 
	((playerStatuses collect: [:aStatus | (aStatus player) name == aPlayerName]) includes: true)
	ifTrue: [ ^true ]
	ifFalse: [ ^false ].
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

{ #category : #accessing }
IngSoft2Game >> lastEffectApplied [
	^ lastEffectApplied
]

{ #category : #'game status' }
IngSoft2Game >> leaderboard [
	^(leaderboard collect: [:eachPlayer | eachPlayer name])
	
]

{ #category : #'position modification' }
IngSoft2Game >> makeAllPlayersBeInPosition: anPosition [
	playerStatuses := playerStatuses collect: [ :eachPlayerStatus | eachPlayerStatus updatePositionTo: 1 ]
]

{ #category : #accessing }
IngSoft2Game >> play: aCard by: aPlayer on: aTarget [

	| playerStatusOfCardUser target |
	playerStatusOfCardUser := self playerStatusOf: aPlayer.

	playerStatusOfCardUser assertHas: aCard.
	
	target := (self existsPlayerWithName: aTarget)
		ifTrue: [ self playerStatusOf: aTarget ]
		ifFalse: [ aTarget ].

	playerStatusOfCardUser remove: aCard.
	aCard applyCardEffectTo: target on: self playedBy: (self playerStatusOf: aPlayer).

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

	currentTurn := currentTurn >= playerStatuses size
		ifTrue: [ 1 ]
		ifFalse: [ currentTurn + 1 ]
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
		^(playerStatuses detect: [:aStatus | (aStatus player) name == aPlayerName]
			ifNone:[false])
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

{ #category : #removing }
IngSoft2Game >> removeActiveEffectOf: aCard from: aPlayerStatus [ 
	aPlayerStatus activeEffects remove: aCard.

]

{ #category : #'effect application' }
IngSoft2Game >> updateLastCardPlayedToBe: aCard [ 
	lastCardPlayed := aCard
]

{ #category : #'effect application' }
IngSoft2Game >> updateLastEffectAppliedToBe: aBoardEffect [
	lastEffectApplied := aBoardEffect.
]

{ #category : #'game status' }
IngSoft2Game >> winner [
	^winner.
]

{ #category : #'game status' }
IngSoft2Game >> winnerName [
	^self winner name 
]
