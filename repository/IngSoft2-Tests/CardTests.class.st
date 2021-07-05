Class {
	#name : #CardTests,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

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
   gameBoard := Board with: {
		NonEffectPosition new.
		SpeedUpPosition new.
		NonEffectPosition new.
		MoonWalkPosition withN:1.
		CardDealerPosition new.
		NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.

	self assert: (game amounfOfCardsOf: elDiego) equals: 3.


]

{ #category : #tests }
CardTests >> test004ElDiegoUsesASpeedCardAndHasAnActiveSpeedEffect [

   | gameBoard game elDiego diceOne dices players lapsToWin speedCard|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.

	speedCard := SpeedCard new.

   gameBoard := Board with: {
		NonEffectPosition new.
		LoadedCardDealerPosition handing: speedCard.
		NonEffectPosition new.
		NonEffectPosition new.
		NonEffectPosition new.
		NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 3.
	
	game play: speedCard by: elDiego on: elDiego.

	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	self assert: (game activeEffectsOf: elDiego) equals: ({speedCard} asOrderedCollection) 





]

{ #category : #tests }
CardTests >> test005ElDiegoUsesSpeedCardAndItAffectsHisDestinationBy1 [

   | gameBoard game elDiego diceOne dices players lapsToWin speedCard|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
	speedCard := SpeedCard new.
   gameBoard := Board with: { 
		NonEffectPosition new.
		LoadedCardDealerPosition handing: speedCard.
		NonEffectPosition new.
		NonEffectPosition new.
		NonEffectPosition new.
		NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game play: speedCard by: elDiego on: elDiego.
	game playRound.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	self assert: (game positionOf: elDiego) equals: 4.




]

{ #category : #tests }
CardTests >> test006ElDiegoUsesSpeedCardOnElPeleAndItAffectsHisDestinationBy1 [

	| gameBoard game elDiego elPele diceOne dices players lapsToWin speedCard |
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
	diceOne := LoadedDice rolling: 1.
	speedCard := SpeedCard new.
	gameBoard := Board with: {
	NonEffectPosition new.
	LoadedCardDealerPosition handing: speedCard.
	NonEffectPosition new.
	NonEffectPosition new.
	NonEffectPosition new.
	NonEffectPosition new}.
	
	dices := {diceOne}.
	players := {elDiego.	elPele}.
	lapsToWin := 1.

	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	self assert: (game amounfOfCardsOf: elDiego) equals: 3.
	game play: speedCard by: elDiego on: elDiego.
	game playRound.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	self assert: (game positionOf: elDiego) equals: 4.
	self assert: (game positionOf: elPele) equals: 3.
]

{ #category : #tests }
CardTests >> test007ElDiegoUsesAnOverloadCardAndItAffectsHisDestinationByMinus2 [

   | gameBoard game elDiego diceOne dices players lapsToWin overloadCard|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
	overloadCard := OverloadCard new.
   gameBoard := Board with: { 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: overloadCard . 
	NonEffectPosition new . 
	NonEffectPosition new . 
	NonEffectPosition new . 
	NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game play: overloadCard by: elDiego on: elDiego.
	game playRound.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	self assert: (game positionOf: elDiego) equals: 1.




]

{ #category : #tests }
CardTests >> test008ElDiegoUsesAnOverloadCardAtElPeleAndItAffectsHisDestinationByMinus2 [

   | gameBoard game elDiego elPele diceOne dices players lapsToWin overloadCard|
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
   diceOne := LoadedDice rolling: 1.
	overloadCard := OverloadCard new.
   gameBoard := Board with: { 
	NonEffectPosition new.
	LoadedCardDealerPosition handing: overloadCard.
	NonEffectPosition new.
	NonEffectPosition new.
	NonEffectPosition new.
	NonEffectPosition new}.
	
	dices := { diceOne }.
	players := { elDiego . elPele }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game play: overloadCard by: elDiego on: elPele.
	game playRound.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	self assert: (game positionOf: elDiego) equals: 3.
	self assert: (game positionOf: elPele) equals: 1.





]

{ #category : #tests }
CardTests >> test009ElDiegoUsesAnOverloadCardAtElPeleTwiceAndTheFinalPositionOfElPeleIsOk [

   | gameBoard game elDiego elPele diceOne dices players lapsToWin overloadCard|
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
   diceOne := LoadedDice rolling: 1.
	overloadCard := OverloadCard new.
   gameBoard := Board with:{
	NonEffectPosition new.
	LoadedCardDealerPosition handing: overloadCard.
	LoadedCardDealerPosition handing: overloadCard.
	NonEffectPosition new.
	NonEffectPosition new.
	NonEffectPosition new}.
	
	dices := { diceOne }.
	players := { elDiego . elPele }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game play: overloadCard by: elDiego on: elPele.
	game playRound.
	game play: overloadCard by: elDiego on: elPele.
	game playRound.
	
	self assert: (game amounfOfCardsOf: elDiego) equals: 2.
	
	self assert: (game positionOf: elDiego) equals: 4.
	self assert: (game positionOf: elPele) equals: 5.
	
	self assert: (game lapsCompletedBy: elDiego) equals: 0.
	self assert: (game lapsCompletedBy: elPele) equals: -1.




]

{ #category : #tests }
CardTests >> test010ElDiegoUsesAnAccelerationCardAndIncreasesEveryonesPositonBy1 [

   | gameBoard game elDiego elPele elMessi diceOne dices players lapsToWin accelerationCard |

	elDiego := 'El Diego'.
   elPele := 'El Pele'.
   elMessi := 'El Messi'.
   diceOne := LoadedDice rolling: 1.
	accelerationCard := AccelerationCard new.
   gameBoard := Board with: { 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: accelerationCard . 
	NonEffectPosition new . 
	NonEffectPosition new . 
	NonEffectPosition new . 
	NonEffectPosition new }.

    dices := { diceOne }.
    players := { elDiego . elPele . elMessi }.
    lapsToWin := 1.

    game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.

    game playRound.
	 game play: accelerationCard by: elDiego on: elDiego.
    game playRound.

    self assert: (game positionOf: elDiego) equals: 4.
    self assert: (game positionOf: elPele) equals: 4.
    self assert: (game positionOf: elMessi) equals: 4.



]

{ #category : #tests }
CardTests >> test011ElDiegoUsesACancellationCardOnElPeleAndRemovesHisSpeedCard [

	| gameBoard game elDiego elPele diceOne dices players lapsToWin overloadCard cancellationCard cancellationTarget|
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
	diceOne := LoadedDice rolling: 1.
	overloadCard := OverloadCard new.
	cancellationCard := CancellationCard new.
	cancellationTarget := CardTarget targetting: overloadCard from: elPele.
	gameBoard := Board with:	{
	LoadedCardDealerPosition handing: cancellationCard.
	LoadedCardDealerPosition handing: overloadCard.
	NonEffectPosition new.
	NonEffectPosition new.
	NonEffectPosition new.
	NonEffectPosition new}.
	
	dices := {diceOne}.
	players := {elDiego.	elPele}.
	lapsToWin := 1.

	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	
	game play: overloadCard by: elDiego on: elPele.
	self assert: (game activeEffectsOf: elPele) equals: ({overloadCard} asOrderedCollection).
	
	game playRound.
	game playIndividualTurnOfPlayer: (game playerStatusOf: elDiego).
	game play: cancellationCard by: elPele on: cancellationTarget.
	
	self assert: (game positionOf: elDiego) equals: 4.
	self assert: (game positionOf: elPele) equals: 1.
	self assert: (game activeEffectsOf: elPele) isEmpty
]

{ #category : #tests }
CardTests >> test014ElDiegoUsesARedoCardAndPlaysASpeedAgain [

   | gameBoard game elDiego diceOne dices players lapsToWin speedCard redoCard |
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
	speedCard := SpeedCard new.
	redoCard := RedoCard new.
   gameBoard := Board with: { 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: speedCard . 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: redoCard . 
	NonEffectPosition new . 
	NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game play: speedCard by: elDiego on: elDiego.
	game playRound.
	game play: redoCard by: elDiego on: elDiego.
	
	self assert: (game activeEffectsOf: elDiego) equals: ({speedCard. speedCard} asOrderedCollection).
	
	game playRound.
	self assert: (game positionOf: elDiego) equals: 1.
]

{ #category : #tests }
CardTests >> test015ElDiegoUsesARedoCardAfterARedoCardWasPlayedAndHas3SpeedActiveEffects [

   | gameBoard game elDiego diceOne dices players lapsToWin speedCard redoCard |
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
	speedCard := SpeedCard new.
	redoCard := RedoCard new.
   gameBoard := Board with: { 
	LoadedCardDealerPosition handing: redoCard . 
	LoadedCardDealerPosition handing: speedCard . 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: redoCard. 
	NonEffectPosition new . 
	NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game play: speedCard by: elDiego on: elDiego.
	game playRound.
	game play: redoCard by: elDiego on: elDiego.
	game playRound.
	game play: redoCard by: elDiego on: elDiego.
	
	self assert: (game activeEffectsOf: elDiego) equals: ({speedCard. speedCard. speedCard} asOrderedCollection).
	
	game playRound.
	self assert: (game positionOf: elDiego) equals: 5.
]

{ #category : #tests }
CardTests >> test016ElDiegoUsesARedoCardAfterAAccelerationCardWasPlayedAfterAOverloardCardWasPlayedAndHisBoostIs0 [

   | gameBoard game elDiego diceOne dices players lapsToWin accelerationCard overloadCard redoCard |
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 3.
	accelerationCard := AccelerationCard new.
	overloadCard := OverloadCard new.
	redoCard := RedoCard new.
   gameBoard := Board with: { 
	NonEffectPosition new . 
	NonEffectPosition new . 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: overloadCard . 
	LoadedCardDealerPosition handing: accelerationCard . 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: redoCard }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game play: overloadCard by: elDiego on: elDiego.
	game playRound.
	game play: accelerationCard by: elDiego on: elDiego.
	game playRound.
	game play: redoCard by: elDiego on: elDiego.
	
	self assert: (game activeEffectsOf: elDiego) equals: ({overloadCard. accelerationCard. accelerationCard} asOrderedCollection).
	
	game playRound.
	self assert: (game positionOf: elDiego) equals: 3.
]

{ #category : #tests }
CardTests >> test017ElDiegoUsesARedoCardAndPlaysACancellationAgainTestingSpeed [

   | gameBoard game elDiego diceOne dices players lapsToWin speedCard cancellationCard redoCard cancellationTarget |
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
	speedCard := SpeedCard new.
	cancellationCard := CancellationCard new.
	redoCard := RedoCard new.
	cancellationTarget := CardTarget targetting: speedCard from: elDiego.
   gameBoard := Board with: { 
	LoadedCardDealerPosition handing: redoCard . 
	LoadedCardDealerPosition handing: speedCard . 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: speedCard . 
	NonEffectPosition new . 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: cancellationCard . 
	NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game play: speedCard by: elDiego on: elDiego.
	game playRound.
	game play: speedCard by: elDiego on: elDiego.
	game playRound.
	game play: cancellationCard by: elDiego on: cancellationTarget.
	game playRound.
	game play: redoCard by: elDiego on: cancellationTarget.
	
	self assert: (game activeEffectsOf: elDiego) isEmpty.
	
	game playRound.
	self assert: (game positionOf: elDiego) equals: 2.
]

{ #category : #tests }
CardTests >> test018ElDiegoUsesARepeatCardToUseASpeedUpAgain [

   | gameBoard game elDiego diceOne dices players lapsToWin repeatCard |
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
	repeatCard := RepeatCard new.
   gameBoard := Board with: { 
	NonEffectPosition new . 
	SpeedUpPosition new . 
	NonEffectPosition new . 
	NonEffectPosition new . 
	NonEffectPosition new .  
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: repeatCard }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game playRound.
	game play: repeatCard by: elDiego on: elDiego.
	
	game playRound.
	self assert: (game positionOf: elDiego) equals: 1.

]

{ #category : #tests }
CardTests >> test019APlayerCanOnlyPlayAPermanentCardDuringItsTurn [

   | gameBoard game elDiego elPele diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { LoadedCardDealerPosition handing: RedoCard new . LoadedCardDealerPosition handing: SpeedCard new . NonEffectPosition new . LoadedCardDealerPosition handing: RedoCard new . NonEffectPosition new . NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego . elPele }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	 self should: [ game make: elPele useCard: 'Speed' on: elPele ]
        raise: Error whoseDescriptionIncludes: 'Permanent cards can only be used during the players turn' description: 'Unable to use permanent card'.
	
	


]

{ #category : #tests }
CardTests >> test020ElDiegoUsesARepeatCardAndCopiesTheLastEffectApplied [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: SpeedCard new . LoadedCardDealerPosition handing: RepeatCard new . LoadedCardDealerPosition handing: RepeatCard new . LoadedCardDealerPosition handing: RepeatCard new . LoadedCardDealerPosition handing: RepeatCard new . LoadedCardDealerPosition handing: RepeatCard new . LoadedCardDealerPosition handing: RepeatCard new }.
	
	dices := { diceOne }.
	players := { elDiego .}.
	lapsToWin := 3.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game make: elDiego useCard: 'Speed' on: elDiego.
	game playRound.
	game make: elDiego useCard: 'Repeat' on: elDiego.
	game playRound.
	game make: elDiego useCard: 'Repeat' on: elDiego.
	
	self assert: (game activeEffectsOf: elDiego) equals: (OrderedCollection withAll: #('Speed' 'Speed' 'Speed')).
	
	game playRound.
	self assert: (game positionOf: elDiego) equals: 3.
]

{ #category : #tests }
CardTests >> test021OnlyEffectCardsAppearAsLastPlayedGameWise [

   | gameBoard game elDiego diceOne dices players lapsToWin|
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
   gameBoard := Board with: { NonEffectPosition new . LoadedCardDealerPosition handing: SpeedCard new . LoadedCardDealerPosition handing: RepeatCard new . LoadedCardDealerPosition handing: RepeatCard new . LoadedCardDealerPosition handing: SpeedCard new . LoadedCardDealerPosition handing: SpeedCard new . LoadedCardDealerPosition handing: AccelerationCard new . LoadedCardDealerPosition handing: RepeatCard new }.
	
	dices := { diceOne }.
	players := { elDiego .}.
	lapsToWin := 3.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game make: elDiego useCard: 'Speed' on: elDiego.
	self assert: (game lastCardPlayed type) equals: 'Speed'.
	
	game playRound.
	game make: elDiego useCard: 'Repeat' on: elDiego.
	self assert: (game lastCardPlayed type) equals: 'Speed'.
	
	game playRound.
	game make: elDiego useCard: 'Acceleration' on: elDiego.
	self assert: (game lastCardPlayed type) equals: 'Acceleration'.

	game playRound.
	game make: elDiego useCard: 'Repeat' on: elDiego.
	self assert: (game lastCardPlayed type) equals: 'Acceleration'.
	
	self assert: (game activeEffectsOf: elDiego) equals: (OrderedCollection withAll: #('Speed' 'Speed' 'Acceleration' 'Acceleration')).
	
	game playRound.
	self assert: (game positionOf: elDiego) equals: 8.
]

{ #category : #tests }
CardTests >> test022ElDiegoAndElPeleGetAnOverLoadCardAndTheyAreTheSame [

   | gameBoard game elDiego elPele diceOne dices players lapsToWin overloadCard|
	
	elDiego := 'El Diego'.
	elPele := 'El Pele'.
   diceOne := LoadedDice rolling: 1.
	overloadCard := OverloadCard new.
   gameBoard := Board with: { 
	NonEffectPosition new.
	LoadedCardDealerPosition handing: overloadCard.
	NonEffectPosition new.
	NonEffectPosition new.
	NonEffectPosition new.
	NonEffectPosition new}.
	
	dices := { diceOne }.
	players := { elDiego . elPele }.
	lapsToWin := 1.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	
	self assert: (game activeEffectsOf: elDiego) equals: (game activeEffectsOf: elPele).
]

{ #category : #tests }
CardTests >> test023ElDiegoUsesARedoCardAndPlaysACancellationAgainTestingAcceleration [

   | gameBoard game elDiego diceOne dices players lapsToWin accelerationCard cancellationCard redoCard cancellationTarget |
	
	elDiego := 'El Diego'.
   diceOne := LoadedDice rolling: 1.
	accelerationCard := AccelerationCard new.
	cancellationCard := CancellationCard new.
	redoCard := RedoCard new.
	cancellationTarget := CardTarget targetting: accelerationCard from: elDiego.
   gameBoard := Board with: { 
	LoadedCardDealerPosition handing: redoCard . 
	LoadedCardDealerPosition handing: accelerationCard . 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: accelerationCard . 
	NonEffectPosition new . 
	NonEffectPosition new . 
	LoadedCardDealerPosition handing: cancellationCard . 
	NonEffectPosition new }.
	
	dices := { diceOne }.
	players := { elDiego }.
	lapsToWin := 2.
	
	game := IngSoft2Game beingPlayedBy: players with: dices on: gameBoard wherePlayersNeedToComplete: lapsToWin.
	
	game playRound.
	game play: accelerationCard by: elDiego on: elDiego.
	game playRound.
	game play: accelerationCard by: elDiego on: elDiego.
	game playRound.
	game play: cancellationCard by: elDiego on: cancellationTarget.
	game playRound.
	game play: redoCard by: elDiego on: cancellationTarget.
	
	self assert: (game activeEffectsOf: elDiego) isEmpty.
	
	game playRound.
	self assert: (game positionOf: elDiego) equals: 2.
]
