Class {
	#name : #LoadedBoard,
	#superclass : #Object,
	#instVars : [
		'boardPositionsStatus',
		'positions',
		'numberOfMoonWalk',
		'numberOfNonEffects',
		'numberOfNuke',
		'numberOfSpeedUp',
		'numberOfWormHole'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
LoadedBoard class >> withPositions: aNumberOfPositions [
	^self new initializeWith: aNumberOfPositions
]

{ #category : #accessing }
LoadedBoard >> boardPositionsStatus [
	^ boardPositionsStatus
]

{ #category : #accessing }
LoadedBoard >> changeInMovementCausedByPosition: aPosition [
	^((boardPositionsStatus at: aPosition) at: 2) changeInPosition
]

{ #category : #accessing }
LoadedBoard >> currentPosition: currPos whoRolled: diceNumber [

	|endPosNoEffects|
	endPosNoEffects := currPos + diceNumber.
	endPosNoEffects > positions 
	ifTrue: [ endPosNoEffects := endPosNoEffects - positions ].
	
	currPos + diceNumber + (self changeInMovementCausedByPosition: endPosNoEffects) > positions
	ifTrue: [ ^ ((currPos + diceNumber + (self changeInMovementCausedByPosition: endPosNoEffects)) % positions) ]
	ifFalse: [ ^currPos + diceNumber + (self changeInMovementCausedByPosition: endPosNoEffects) ].
	

]

{ #category : #accessing }
LoadedBoard >> initializeWith: aNumberOfPositions [
	|x|
	positions := aNumberOfPositions.
	boardPositionsStatus := OrderedCollection new.
	self populateSpecificNumberOfBoardPositions.
	self populateBoardPositionStatusWithEffects.
	x:=0.
	boardPositionsStatus := boardPositionsStatus collect: [ :boardPosition | { x:=x+1 . boardPosition }].
	




]

{ #category : #accessing }
LoadedBoard >> numberOfMoonWalk [
	^ numberOfMoonWalk
]

{ #category : #accessing }
LoadedBoard >> numberOfNonEffects [
	^numberOfNonEffects
]

{ #category : #accessing }
LoadedBoard >> numberOfNuke [
	^ numberOfNuke
]

{ #category : #accessing }
LoadedBoard >> numberOfSpeedUp [
	^ numberOfSpeedUp
]

{ #category : #accessing }
LoadedBoard >> numberOfWormHole [
	^ numberOfWormHole
]

{ #category : #accessing }
LoadedBoard >> obtainNewLapCountKnowingPlayerHas: aCurrentAmountOfLaps andRolled: numberRolled andIsInPosition: currentPlayerPosition [

	|endPosNoEffects|
	endPosNoEffects := currentPlayerPosition + numberRolled.
	endPosNoEffects > positions 
	ifTrue: [ endPosNoEffects := endPosNoEffects - positions ].
	
	currentPlayerPosition + numberRolled + (self changeInMovementCausedByPosition: endPosNoEffects) > positions
	ifTrue: [ ^ (aCurrentAmountOfLaps + (self totalLapsDoneKnowing: (currentPlayerPosition + numberRolled + (self changeInMovementCausedByPosition: endPosNoEffects)))) ]
	ifFalse: [ ^aCurrentAmountOfLaps ]
	
]

{ #category : #accessing }
LoadedBoard >> populateBoardPositionStatusWithEffects [

	1 to: numberOfNonEffects do: [:i | boardPositionsStatus add: NonEffectPosition new ]. "48%"
	1 to: numberOfSpeedUp do: [:i | boardPositionsStatus add: SpeedUpPosition new ]. "20%"
	1 to: numberOfWormHole do: [:i | boardPositionsStatus add: WormHolePosition new ]. "20%"
	1 to: numberOfMoonWalk do: [:i | boardPositionsStatus add: (MoonWalkPosition withN: (Random new seed % positions + 1)) ]. "10%"
	1 to: numberOfNuke do: [:i | boardPositionsStatus add: NukePosition new ]. "2%"
	
]

{ #category : #accessing }
LoadedBoard >> populateSpecificNumberOfBoardPositions [
	numberOfNonEffects := positions * 0.48.
	numberOfWormHole := positions * 0.2.
	numberOfSpeedUp := positions * 0.2.
	numberOfMoonWalk := positions * 0.1.
	numberOfNuke := positions * 0.02
	
]

{ #category : #accessing }
LoadedBoard >> positions [
	^positions
	
]

{ #category : #accessing }
LoadedBoard >> totalLapsDoneKnowing: currentPositionAfterDiceRoll [
	currentPositionAfterDiceRoll > positions
	ifTrue: [ ^(1 + (self totalLapsDoneKnowing: (currentPositionAfterDiceRoll - positions)))]
	ifFalse: [ ^0 ]
]
