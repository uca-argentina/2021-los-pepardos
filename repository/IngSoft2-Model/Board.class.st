"
I am a Board.

"
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

{ #category : #'board effect' }
Board >> applyBasicEffectTo: aPlayerStatus withARollOf: diceRollResult [ 

	| newPosition newLap |

	newPosition := (self newPositionAfter: aPlayerStatus rolledADiceOf: diceRollResult).
	newLap := (self newLapsAfter: aPlayerStatus rolledADiceOf: diceRollResult).

	aPlayerStatus updatePositionTo: newPosition andLapsTo: newLap.
]

{ #category : #'board effect' }
Board >> applyMoonwalkEffectTo: aPlayerStatus afterLandingOn: aMoonWalkPosition beingPlayedOn: game [ 

	| newBoardPosNumber |
	newBoardPosNumber := aPlayerStatus position.
	game correctAllPlayersPositionBy: (aMoonWalkPosition n).
	aPlayerStatus updatePositionTo: newBoardPosNumber.
]

{ #category : #'board effect' }
Board >> applyNukeEffectOn: game [ 
	game makeAllPlayersBeInPosition: 1.
]

{ #category : #accessing }
Board >> boardPositionsStatuses [
	^ boardPositionsStatuses
]

{ #category : #'position management' }
Board >> changeInMovementCausedByPosition: aPosition [
	^((boardPositionsStatuses at: aPosition) positionEffect) changeInPosition
]

{ #category : #'position management' }
Board >> compliantBoardPosOf: aPos [
	aPos = 0
		ifTrue:[	^positions ].
	aPos < 0
		ifTrue: [ ^(aPos + positions +1) ].
	^aPos
]

{ #category : #'position modification' }
Board >> correctedPositionOf: aPos [
	aPos = 0
		ifTrue:[	^positions ].
	aPos < 0
		ifTrue: [ ^(aPos + positions +1) ].
	^aPos
]

{ #category : #'position management' }
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

{ #category : #initialization }
Board >> initializeWithEffects: effects [ 
	|x|
	x:=0.
	boardPositionsStatuses := effects.
	positions := boardPositionsStatuses size.
	boardPositionsStatuses := boardPositionsStatuses collect: [ :boardPositionStatus | BoardPositionStatus withNumber: (x:=x+1) andEffect: boardPositionStatus ].
	
]

{ #category : #'position modification' }
Board >> movePlayer: aPlayerStatus by: aDiceRoll on: anIngSoft2Game [ 
	
	| newBoardPosNumber effect |
	newBoardPosNumber := aDiceRoll + aPlayerStatus position.
	
	newBoardPosNumber <= 0
	ifTrue: [ aPlayerStatus correctLapBy: -1 ].
	
	newBoardPosNumber :=
		newBoardPosNumber > positions
			ifTrue: [ newBoardPosNumber - positions ]
			ifFalse: [ self correctedPositionOf: newBoardPosNumber ].

	effect := (boardPositionsStatuses at: newBoardPosNumber) positionEffect.
	effect applyTo: aPlayerStatus withARollOf: aDiceRoll on: self beingPlayedOn: anIngSoft2Game.
]

{ #category : #'instance creation' }
Board >> newLapsAfter: aPlayerStatus rolledADiceOf: aDiceRoll [ 
	
	|endPosNoEffects currentPlayerPosition aCurrentAmountOfLaps|
	currentPlayerPosition := aPlayerStatus position.
	endPosNoEffects := self compliantBoardPosOf: (currentPlayerPosition + aDiceRoll).
	aCurrentAmountOfLaps := aPlayerStatus lap.
	
	endPosNoEffects > positions 
	ifTrue: [ endPosNoEffects := endPosNoEffects - positions ].
	
	currentPlayerPosition + aDiceRoll + (self changeInMovementCausedByPosition: endPosNoEffects) > positions
	ifTrue: [ ^ (aCurrentAmountOfLaps + (self totalLapsDoneKnowing: (currentPlayerPosition + aDiceRoll + (self changeInMovementCausedByPosition: endPosNoEffects)))) ]
	ifFalse: [ ^aCurrentAmountOfLaps ].


]

{ #category : #'instance creation' }
Board >> newPositionAfter: aPlayerStatus rolledADiceOf: aDiceRoll [ 

	| endPosNoEffects currPos |
	currPos := (aPlayerStatus position).

	endPosNoEffects := self compliantBoardPosOf: (currPos + aDiceRoll).	
	endPosNoEffects > positions 
	ifTrue: [ endPosNoEffects := endPosNoEffects - positions ].
	
	currPos + aDiceRoll + (self changeInMovementCausedByPosition: endPosNoEffects) > positions
	ifTrue: [ ^ ((currPos + aDiceRoll + (self changeInMovementCausedByPosition: endPosNoEffects)) % positions) ]
	ifFalse: [ ^currPos + aDiceRoll + (self changeInMovementCausedByPosition: endPosNoEffects) ].

]

{ #category : #'lap management' }
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

{ #category : #accessing }
Board >> positions [
	^positions
]

{ #category : #accessing }
Board >> totalLapsDoneKnowing: currentPositionAfterDiceRoll [
	currentPositionAfterDiceRoll > positions
	ifTrue: [ ^(1 + (self totalLapsDoneKnowing: (currentPositionAfterDiceRoll - positions)))]
	ifFalse: [ ^0 ]
]
