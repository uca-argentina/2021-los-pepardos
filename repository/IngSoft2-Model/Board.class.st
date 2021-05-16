Class {
	#name : #Board,
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
Board class >> withPositions: aNumberOfPositions [
	^self new initializeWith: aNumberOfPositions
]

{ #category : #'as yet unclassified' }
Board >> boardPositionsStatus [
	^ boardPositionsStatus
]

{ #category : #'as yet unclassified' }
Board >> changeInMovementCausedByPosition: aPosition [
	^((boardPositionsStatus at: aPosition) at: 2) changeInPosition
]

{ #category : #'as yet unclassified' }
Board >> currentPosition: currPos whoRolled: diceNumber [

	|endPosNoEffects|
	endPosNoEffects := currPos + diceNumber.
	endPosNoEffects > positions 
	ifTrue: [ endPosNoEffects := endPosNoEffects - positions ].
	
	currPos + diceNumber + (self changeInMovementCausedByPosition: endPosNoEffects) > positions
	ifTrue: [ ^ ((currPos + diceNumber + (self changeInMovementCausedByPosition: endPosNoEffects)) % positions) ]
	ifFalse: [ ^currPos + diceNumber + (self changeInMovementCausedByPosition: endPosNoEffects) ].
	

]

{ #category : #'as yet unclassified' }
Board >> initializeWith: aNumberOfPositions [
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
Board >> numberOfMoonWalk [
	^ numberOfMoonWalk
]

{ #category : #'as yet unclassified' }
Board >> numberOfNonEffects [
	^numberOfNonEffects
]

{ #category : #'as yet unclassified' }
Board >> numberOfNuke [
	^ numberOfNuke
]

{ #category : #'as yet unclassified' }
Board >> numberOfSpeedUp [
	^ numberOfSpeedUp
]

{ #category : #'as yet unclassified' }
Board >> numberOfWormHole [
	^ numberOfWormHole
]

{ #category : #'as yet unclassified' }
Board >> obtainNewLapCountKnowingPlayerHas: aCurrentAmountOfLaps andRolled: numberRolled andIsInPosition: currentPlayerPosition [

	|endPosNoEffects|
	endPosNoEffects := currentPlayerPosition + numberRolled.
	endPosNoEffects > positions 
	ifTrue: [ endPosNoEffects := endPosNoEffects - positions ].
	
	currentPlayerPosition + numberRolled + (self changeInMovementCausedByPosition: endPosNoEffects) > positions
	ifTrue: [ ^ (aCurrentAmountOfLaps + (self totalLapsDoneKnowing: (currentPlayerPosition + numberRolled + (self changeInMovementCausedByPosition: endPosNoEffects)))) ]
	ifFalse: [ ^aCurrentAmountOfLaps ]
	
]

{ #category : #'as yet unclassified' }
Board >> populateBoardPositionStatusWithEffects [

	1 to: numberOfNonEffects do: [:i | boardPositionsStatus add: NonEffectPosition new ].
	1 to: numberOfMoonWalk do: [:i | boardPositionsStatus add: MoonWalkPosition new ].
	1 to: numberOfSpeedUp do: [:i | boardPositionsStatus add: SpeedUpPosition new ].
	1 to: numberOfWormHole do: [:i | boardPositionsStatus add: WormHolePosition new ].
	1 to: numberOfNuke do: [:i | boardPositionsStatus add: NukePosition new ].

	

	

]

{ #category : #'as yet unclassified' }
Board >> populateSpecificNumberOfBoardPositions [
	numberOfNonEffects := positions * 0.48.
	numberOfWormHole := positions * 0.2.
	numberOfSpeedUp := positions * 0.2.
	numberOfMoonWalk := positions * 0.1.
	numberOfNuke := positions * 0.02
]

{ #category : #'as yet unclassified' }
Board >> positions [
	^positions
]

{ #category : #'as yet unclassified' }
Board >> totalLapsDoneKnowing: currentPositionAfterDiceRoll [
	currentPositionAfterDiceRoll > positions
	ifTrue: [ ^(1 + (self totalLapsDoneKnowing: (currentPositionAfterDiceRoll - positions)))]
	ifFalse: [ ^0 ]
]
