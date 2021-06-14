Class {
	#name : #CardTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardTests >> test001ANewBoardHasTheCorrectNumberOfEffects [

   | gameBoard |
	
	gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . MoonWalkPosition withN: 1 . CardDealerPosition new . NonEffectPosition new . WormHolePosition new . NukePosition new }.
	
	self assert: (gameBoard numberOf: 'NonEffect') equals: 3.
	self assert: (gameBoard numberOf: 'CardDealer') equals: 1.
	self assert: (gameBoard numberOf: 'WormHole') equals: 1.
	self assert: (gameBoard numberOf: 'SpeedUp') equals: 1.
	self assert: (gameBoard numberOf: 'MoonWalk') equals: 1.
	self assert: (gameBoard numberOf: 'Nuke') equals: 1.


]

{ #category : #tests }
CardTests >> test002ElDiegoBeginsPlayingWith2Cards [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := Dice withSides: 6.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . MoonWalkPosition withN: 1 . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NukePosition new . WormHolePosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

	self assert: (game amounfOfCardsOf: elDiego) equals: 2. "replace amountOfCardsOf to cards -> size"


]

{ #category : #tests }
CardTests >> test003ElDiegoLandsInACardDealerPositionAndNowHas3Cards [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 4.
   gameBoard := Board with: { NonEffectPosition new . SpeedUpPosition new . NonEffectPosition new . MoonWalkPosition withN: 1 . CardDealerPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.

	self assert: (game amounfOfCardsOf: elDiego) equals: 3.


]

{ #category : #tests }
CardTests >> test004ElDiegoUsesASpeedCardAndHasAnActiveSpeedEffect [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: SpeedCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 3.
	
	game make: elDiego useCard: 'Speed' on: elDiego.

	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	self assert: (game activeEffectsOf: elDiego) equals: (OrderedCollection withAll: #('Speed')).




]

{ #category : #tests }
CardTests >> test005ElDiegoUsesSpeedCardAndItAffectsHisDestinationBy1 [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: SpeedCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	game make: elDiego useCard: 'Speed' on: elDiego.
	game playTurn.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	self assert: (game positionOf: elDiego) equals: 4.




]

{ #category : #tests }
CardTests >> test006ElDiegoUsesSpeedCardOnElPeleAndItAffectsHisDestinationBy1 [

   | gameBoard game elDiego elPele diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: SpeedCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego . elPele }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	game make: elDiego useCard: 'Speed' on: elPele.
	game playTurn.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	self assert: (game positionOf: elDiego) equals: 3.
	self assert: (game positionOf: elPele) equals: 4.




]

{ #category : #tests }
CardTests >> test007ElDiegoUsesAnOverloadCardAndItAffectsHisDestinationByMinus2 [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: OverloadCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	game make: elDiego useCard: 'Overload' on: elDiego.
	game playTurn.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	self assert: (game positionOf: elDiego) equals: 1.




]

{ #category : #tests }
CardTests >> test008ElDiegoUsesAnOverloadCardAtElPeleAndItAffectsHisDestinationByMinus2 [

   | gameBoard game elDiego elPele diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: OverloadCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego . elPele }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	game make: elDiego useCard: 'Overload' on: elPele.
	game playTurn.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	self assert: (game positionOf: elDiego) equals: 3.
	self assert: (game positionOf: elPele) equals: 1.




]

{ #category : #tests }
CardTests >> test009ElDiegoUsesAnOverloadCardAtElPeleTwiceAndTheFinalPositionOfElPeleIsOk [

   | gameBoard game elDiego elPele diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: OverloadCard new . LoadedCardDealerPosition handing: OverloadCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego . elPele }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	game make: elDiego useCard: 'Overload' on: elPele.
	game playTurn.
	game make: elDiego useCard: 'Overload' on: elPele.
	game playTurn.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	
	self assert: (game positionOf: elDiego) equals: 4.
	self assert: (game positionOf: elPele) equals: 5.
	
	self assert: (game lapsCompletedBy: elDiego) equals: 0.
	self assert: (game lapsCompletedBy: elPele) equals: -1.




]

{ #category : #tests }
CardTests >> test010ElDiegoUsesAnAccelerationCardAndIncreasesEveryonesPositonBy1 [
    "QUE GRANDE EL DIEGO, es su test, el del 10"
   | gameBoard game elDiego elPele elMessi diceOne dices players lapsToWin|

    elDiego := 'El Diego'.
    elPele := 'El Pele'.
    elMessi := 'El Messi'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: AccelerationCard new . LoadedCardDealerPosition handing: OverloadCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.

    dices := { diceOne }.
    players := { elDiego . elPele . elMessi }.
    lapsToWin := 1.

    game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

    game playTurn.
    game make: elDiego useCard: 'Acceleration' on: elDiego.
    game playTurn.

    self assert: (game positionOf: elDiego) equals: 4.
    self assert: (game positionOf: elPele) equals: 4.
    self assert: (game positionOf: elMessi) equals: 4.



]

{ #category : #tests }
CardTests >> test011ElDiegoUsesACancellationCardOnElPeleAndRemovesHisSpeedCard [

   | gameBoard game elDiego elPele diceOne dices players lapsToWin|

    elDiego := 'El Diego'.
    elPele := 'El Pele'.

   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { LoadedCardDealerPosition handing: CancellationCard new . LoadedCardDealerPosition handing: OverloadCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.

    dices := { diceOne }.
    players := { elDiego . elPele }.
    lapsToWin := 1.

    game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

    game playTurn.
    game make: elDiego useCard: 'Overload' on: elPele.

	 self assert: (game activeEffectsOf: elPele) equals: (OrderedCollection withAll: #('Overload')).

    game playTurn.
	 game make: elPele useCard: 'Cancellation' on: elPele toRemove: 'Overload'.

    self assert: (game positionOf: elDiego) equals: 3.
    self assert: (game positionOf: elPele) equals: 1.
	 self assert: (game activeEffectsOf: elPele) isEmpty.




]

{ #category : #tests }
CardTests >> test012ElDiegoUsesASpeedCardTheCardHistoriesAreUpdated [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: SpeedCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	game make: elDiego useCard: 'Speed' on: elDiego.

	self assert: (game lastCardPlayed type) equals: 'Speed'.
	self assert: ((game lastCardPlayedBy: elDiego) type) equals: 'Speed'.




]

{ #category : #tests }
CardTests >> test013ElDiegoUsesTwoSpeedCardsAndHistoriesAreCorrectlyUpdated [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: SpeedCard new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	game make: elDiego useCard: 'Speed' on: elDiego.

	self assert: (game lastCardPlayed type) equals: 'Speed'.
	self assert: ((game lastCardPlayedBy: elDiego) type) equals: 'Speed'.




]

{ #category : #tests }
CardTests >> test014ElDiegoUsesARedoCardAndPlaysASpeedAgain [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: SpeedCard new . NonEffectPosition new . LoadedCardDealerPosition handing: RedoCard new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playTurn.
	game make: elDiego useCard: 'Speed' on: elDiego.
	game playTurn.
	game make: elDiego useCard: 'Redo' on: elDiego.
	
	self assert: ((game lastCardPlayedBy: elDiego) type) equals: 'Redo'.
	self assert: (game activeEffectsOf: elDiego) equals: (OrderedCollection withAll: #('Speed' 'Speed')).
	
	game playTurn.
	self assert: (game positionOf: elDiego) equals: 1.
]
