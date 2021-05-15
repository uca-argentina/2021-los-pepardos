Class {
	#name : #SpecialEffectsBoard,
	#superclass : #Object,
	#instVars : [
		'positions',
		'numberOfNonEffects',
		'numberOfWormHole',
		'numberOfSpeedUp',
		'numberOfMoonWalk',
		'numberOfNuke',
		'boardPositionsStatus'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
SpecialEffectsBoard class >> withPositions: aNumberOfPositions [
	^self new initializeWith: aNumberOfPositions
]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> changeInMovementCausedByPosition: aPosition [
	^((boardPositionsStatus at: aPosition) at: 2) changeInPosition
]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> currentPosition: currPos whoRolled: diceNumber [

	currPos + diceNumber + (self changeInMovementCausedByPosition: currPos + diceNumber) > positions
	ifTrue: [ ^ ((currPos + diceNumber + (self changeInMovementCausedByPosition: currPos + diceNumber)) % positions) ]
	ifFalse: [ ^currPos + diceNumber + (self changeInMovementCausedByPosition: currPos + diceNumber) ].
	
]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> initializeWith: aNumberOfPositions [
	|x|
	positions := aNumberOfPositions.
	boardPositionsStatus := OrderedCollection new.
	self populateSpecificNumberOfBoardPositions.
	self populateBoardPositionStatusWithEffects.
	boardPositionsStatus := boardPositionsStatus shuffle.
	x:=0.
	boardPositionsStatus := boardPositionsStatus collect: [ :boardPosition | { x:=x+1 . boardPosition }].


]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> numberOfMoonWalk [
	^ numberOfMoonWalk
]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> numberOfNonEffects [
	^numberOfNonEffects
]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> numberOfNuke [
	^ numberOfNuke
]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> numberOfSpeedUp [
	^ numberOfSpeedUp
]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> numberOfWormHole [
	^ numberOfWormHole
]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> obtainNewLapCountKnowingPlayerHas: aCurrentAmountOfLaps andRolled: numberRolled andIsInPosition: currentPlayerPosition [
	(numberRolled + currentPlayerPosition) > positions
	ifTrue: [ ^ (aCurrentAmountOfLaps + (self totalLapsDoneKnowing: (currentPlayerPosition + numberRolled))) ]
	ifFalse: [ ^aCurrentAmountOfLaps ]
	
]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> populateBoardPositionStatusWithEffects [

	1 to: numberOfNonEffects do: [:i | boardPositionsStatus add: NonEffectPosition new ].
	1 to: numberOfMoonWalk do: [:i | boardPositionsStatus add: MoonWalkPosition new ].
	1 to: numberOfSpeedUp do: [:i | boardPositionsStatus add: SpeedUpPosition new ].
	1 to: numberOfWormHole do: [:i | boardPositionsStatus add: WormHolePosition new ].
	1 to: numberOfNuke do: [:i | boardPositionsStatus add: NukePosition new ].

	

	

]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> populateSpecificNumberOfBoardPositions [
	numberOfNonEffects := positions * 0.48.
	numberOfWormHole := positions * 0.2.
	numberOfSpeedUp := positions * 0.2.
	numberOfMoonWalk := positions * 0.1.
	numberOfNuke := positions * 0.02
]
