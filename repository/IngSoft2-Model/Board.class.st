Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'positions',
		'boardPositionsStatuses'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Board class >> withLoadedPositions [
	^self new initializeWithLoadedFixedBoard.
]

{ #category : #'as yet unclassified' }
Board class >> withPositions: aNumberOfPositions [
	^self new initializeWith: aNumberOfPositions
]

{ #category : #'as yet unclassified' }
Board >> boardPositionsStatuses [
	^ boardPositionsStatuses
]

{ #category : #'as yet unclassified' }
Board >> changeInMovementCausedByPosition: aPosition [
	^((boardPositionsStatuses at: aPosition) positionEffect) changeInPosition
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
	| x |
	x:=0.
	positions := aNumberOfPositions.
	boardPositionsStatuses := OrderedCollection new.
	self populateBoardPositionStatusWithEffects.
	boardPositionsStatuses := boardPositionsStatuses shuffle.
	boardPositionsStatuses := boardPositionsStatuses collect: [ :boardPositionStatus | BoardPositionStatus withNumber: (x:=x+1) andEffect: boardPositionStatus ].
	"boardPositionsStatuses := boardPositionsStatuses collect: [ :boardPosition | { x:=x+1 . boardPosition }]."


]

{ #category : #'as yet unclassified' }
Board >> initializeWithLoadedFixedBoard [
	|x|
	x:=0.
	positions := 100.
	boardPositionsStatuses := OrderedCollection new.
	self populateBoardPositionStatusWithEffects.
	boardPositionsStatuses := boardPositionsStatuses collect: [ :boardPositionStatus | BoardPositionStatus withNumber: (x:=x+1) andEffect: boardPositionStatus ].
	
]

{ #category : #'as yet unclassified' }
Board >> numberOf: aString [ 
	
	^boardPositionsStatuses sum: [:boardPosStatus | (boardPosStatus positionEffect) amountOf: aString].
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

	1 to: (positions * 0.38) do: [:i | boardPositionsStatuses add: NonEffectPosition new ].
	1 to: (positions * 0.2) do: [:i | boardPositionsStatuses add: SpeedUpPosition new ].
	1 to: (positions * 0.2) do: [:i | boardPositionsStatuses add: WormHolePosition new ].
	1 to: (positions * 0.1) do: [:i | boardPositionsStatuses add: (MoonWalkPosition withN: i) ].
	1 to: (positions * 0.02) do: [:i | boardPositionsStatuses add: NukePosition new ].
	1 to: (positions * 0.1) do: [:i | boardPositionsStatuses add: CardDealerPosition new ].
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
