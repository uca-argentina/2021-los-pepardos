Class {
	#name : #ObjectCreation,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ObjectCreation >> test001DiceCannotHaveLessThan3Sides [
	self
		should: [ Dice withSides: 2 ]
		raise: Error
		whoseDescriptionIncludes: 'Sides must be at least 3'
		description: 'Dice must have at least 3 sides'
]

{ #category : #tests }
ObjectCreation >> test002GameMustHaveMoreThan0Players [
	self
		should: [ IngSoft2Game
				beingPlayedBy: {}
				with: (Dice withSides: 3)
				on:
					(Board
						with:
							{NonEffectPosition new.
							WormHolePosition new})
				wherePlayersNeedToComplete: 1 ]
		raise: Error
		whoseDescriptionIncludes: 'Game must have at least one player'
		description: 'Players must be >= than 1'
]

{ #category : #tests }
ObjectCreation >> test003GameMustHaveMoreThan1LapToComplete [
	self
		should: [ IngSoft2Game
				beingPlayedBy: {'El Diego'}
				with: (Dice withSides: 3)
				on:
					(Board
						with:
							{NonEffectPosition new.
							WormHolePosition new})
				wherePlayersNeedToComplete: -2 ]
		raise: Error
		whoseDescriptionIncludes: 'Game must have more than one lap'
		description: 'Laps must be >= than 1'
]

{ #category : #tests }
ObjectCreation >> test004BoardMustHaveMoreThanTwoPositions [
	self
		should: [ Board with: {NonEffectPosition new} ]
		raise: Error
		whoseDescriptionIncludes: 'Board has less than 2 positions'
		description: 'Board must have more than one position'
]

{ #category : #tests }
ObjectCreation >> test005MoonWalkNMustBeGreaterThan0 [
	self
		should: [ MoonWalkPosition withN: 0 ]
		raise: Error
		whoseDescriptionIncludes: 'N in Moonwalk must be > 0'
		description: 'MoonWalkPosition N value must be at least 1'
]

{ #category : #tests }
ObjectCreation >> test006AHandBeCreatedWithMoreOrEqualsThan1Card [
	self
		should: [ Hand withRandomCards: 0 ]
		raise: Error
		whoseDescriptionIncludes: 'Amount of cards must be > 0'
		description: 'A Hand must be initialized with more than 0 cards'
]

{ #category : #tests }
ObjectCreation >> test007APlayerCannotPlayTheGameAfterItHasFinished [
	| gameBoard game elDiego diceOne dices players lapsToWin |
	elDiego := 'El Diego'.
	diceOne := LoadedDice rolling: 1.
	gameBoard := Board
		with:
			{NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new}.
	dices := {diceOne}.
	players := {elDiego}.
	lapsToWin := 1.
	game := IngSoft2Game
		beingPlayedBy: players
		with: dices
		on: gameBoard
		wherePlayersNeedToComplete: lapsToWin.
	game playGame.
	self
		should: [ game playRound ]
		raise: Error
		whoseDescriptionIncludes: 'The game has already finished'
		description: 'Sent playTurn after the game finished'
]

{ #category : #tests }
ObjectCreation >> test008ANonExistantPlayerCannotBeMadeToPlayACard [
	| gameBoard game elDiego diceOne dices players lapsToWin |
	elDiego := 'El Diego'.
	diceOne := LoadedDice rolling: 1.
	gameBoard := Board
		with:
			{NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new}.
	dices := {diceOne}.
	players := {elDiego}.
	lapsToWin := 1.
	game := IngSoft2Game
		beingPlayedBy: players
		with: dices
		on: gameBoard
		wherePlayersNeedToComplete: lapsToWin.
	game playRound.
	self
		should: [ game play: 'Sunny' by: elDiego on: elDiego ]
		raise: Error
		whoseDescriptionIncludes: 'Player doesnt own that card'
		description: 'Player doesnt own this card'
]

{ #category : #tests }
ObjectCreation >> test009APlayerCannotPlayACardThatDoesntOwn [
	| gameBoard game elDiego diceOne dices players lapsToWin speedCard accelerationCard |
	elDiego := 'El Diego'.
	diceOne := LoadedDice rolling: 1.
	speedCard := SpeedCard new.
	accelerationCard := AccelerationCard new.
	gameBoard := Board
		with:
			{NonEffectPosition new.
			LoadedCardDealerPosition handing: speedCard.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new}.
	dices := {diceOne}.
	players := {elDiego}.
	lapsToWin := 1.
	game := IngSoft2Game
		beingPlayedBy: players
		with: dices
		on: gameBoard
		wherePlayersNeedToComplete: lapsToWin.
	game playRound.
	self
		should: [ game play: accelerationCard by: elDiego on: elDiego ]
		raise: Error
		whoseDescriptionIncludes: 'Player doesnt own that card'
		description: 'Player doesnt have such card'
]

{ #category : #tests }
ObjectCreation >> test010TheGameCannotBePlayedBySomeoneWithoutName [
	| gameBoard elDiego diceOne dices players lapsToWin |
	elDiego := ''.
	diceOne := LoadedDice rolling: 1.
	gameBoard := Board
		with:
			{NonEffectPosition new.
			(LoadedCardDealerPosition handing: CancellationCard new).
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new}.
	dices := {diceOne}.
	players := {elDiego}.
	lapsToWin := 1.
	self
		should: [ IngSoft2Game
				beingPlayedBy: players
				with: dices
				on: gameBoard
				wherePlayersNeedToComplete: lapsToWin ]
		raise: Error
		whoseDescriptionIncludes: 'A player cannot be initialized without a name'
		description: 'Incorrect name of player'
]

{ #category : #tests }
ObjectCreation >> test011TheGameCannotBePlayedByPlayersWithTheSameName [
	| gameBoard elDiego impostor diceOne dices players lapsToWin |
	elDiego := 'El Diego'.
	impostor := 'El Diego'.
	diceOne := LoadedDice rolling: 1.
	gameBoard := Board
		with:
			{NonEffectPosition new.
			(LoadedCardDealerPosition handing: CancellationCard new).
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new}.
	dices := {diceOne}.
	players := {elDiego.
	impostor}.
	lapsToWin := 1.
	self
		should: [ IngSoft2Game
				beingPlayedBy: players
				with: dices
				on: gameBoard
				wherePlayersNeedToComplete: lapsToWin ]
		raise: Error
		whoseDescriptionIncludes: 'The name of a player is already in use'
		description: 'The name of a player is already in use'
]

{ #category : #tests }
ObjectCreation >> test012TheGameHasToHaveAtLeastOneDie [
	| gameBoard elDiego dices players lapsToWin |
	elDiego := 'El Diego'.
	gameBoard := Board
		with:
			{NonEffectPosition new.
			(LoadedCardDealerPosition handing: CancellationCard new).
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new}.
	dices := {}.
	players := {elDiego}.
	lapsToWin := 1.
	self
		should: [ IngSoft2Game
				beingPlayedBy: players
				with: dices
				on: gameBoard
				wherePlayersNeedToComplete: lapsToWin ]
		raise: Error
		whoseDescriptionIncludes: 'The game has to have at least one die'
		description: 'The game couldnt find any die'
]

{ #category : #tests }
ObjectCreation >> test013APlayerCannotPlayWhenItIsNotHisTurn [
	| gameBoard elDiego dices players lapsToWin elPele diceOne game |
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
	diceOne := LoadedDice rolling: 1.
	gameBoard := Board
		with:
			{NonEffectPosition new.
			(LoadedCardDealerPosition handing: CancellationCard new).
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new.
			NonEffectPosition new}.
	dices := {diceOne}.
	players := {elDiego . elPele}.
	lapsToWin := 1.
	game := IngSoft2Game
				beingPlayedBy: players
				with: dices
				on: gameBoard
				wherePlayersNeedToComplete: lapsToWin.
	self
		should: [game playIndividualTurnOfPlayer: (game playerStatusOf: elPele)]
		raise: Error
		whoseDescriptionIncludes: 'Is not this player´s turn'
		description: 'A player cannot play if it is not his turn'
]
