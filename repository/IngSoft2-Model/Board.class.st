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
Board class >> assertValidAmountOfPositions: effects [.
	effects size >= 2
		ifFalse: [ Error signal: 'Board has less than 2 positions' ]
]

{ #category : #'as yet unclassified' }
Board class >> with: effects [
	self assertValidAmountOfPositions: effects.
		^self new initializeWithEffects: effects.
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
Board >> compliantBoardPosOf: aPos [
	aPos = 0
		ifTrue:[	^positions ].
	aPos < 0
		ifTrue: [ ^(aPos + positions +1) ].
	^aPos
]

{ #category : #'as yet unclassified' }
Board >> currentPosition: currPos whoRolled: diceNumber [

	|endPosNoEffects|
	endPosNoEffects := currPos + diceNumber.
	endPosNoEffects := self compliantBoardPosOf: endPosNoEffects.
	endPosNoEffects > positions 
	ifTrue: [ endPosNoEffects := endPosNoEffects - positions ].
	
	currPos + diceNumber + (self changeInMovementCausedByPosition: endPosNoEffects) > positions
	ifTrue: [ ^ ((currPos + diceNumber + (self changeInMovementCausedByPosition: endPosNoEffects)) % positions) ]
	ifFalse: [ ^currPos + diceNumber + (self changeInMovementCausedByPosition: endPosNoEffects) ].
	

]

{ #category : #'as yet unclassified' }
Board >> initializeWithEffects: effects [ 
	|x|
	x:=0.
	boardPositionsStatuses := effects.
	positions := boardPositionsStatuses size.
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
	endPosNoEffects := self compliantBoardPosOf: endPosNoEffects.
	endPosNoEffects > positions 
	ifTrue: [ endPosNoEffects := endPosNoEffects - positions ].
	
	currentPlayerPosition + numberRolled + (self changeInMovementCausedByPosition: endPosNoEffects) > positions
	ifTrue: [ ^ (aCurrentAmountOfLaps + (self totalLapsDoneKnowing: (currentPlayerPosition + numberRolled + (self changeInMovementCausedByPosition: endPosNoEffects)))) ]
	ifFalse: [ ^aCurrentAmountOfLaps ]
	
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
