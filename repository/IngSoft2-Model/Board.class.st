Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'positions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> withPositions: aNumberOfPositions [
	^self new initializeWithPositions: aNumberOfPositions.
]

{ #category : #'as yet unclassified' }
Board >> currentPosition: actualPlaceOnBoard whoRolled: aDiceRollResult [

	actualPlaceOnBoard + aDiceRollResult > positions
	ifTrue: [ ^ (actualPlaceOnBoard + aDiceRollResult)%positions ]
	ifFalse: [ ^actualPlaceOnBoard + aDiceRollResult ].
]

{ #category : #'instance creation' }
Board >> initializeWithPositions: aNumberOfPositions [
	positions := aNumberOfPositions.
]

{ #category : #'as yet unclassified' }
Board >> obtainNewLapCountKnowingPlayerHas: aCurrentAmountOfLaps andRolled: numberRolled andIsInPosition: currentPlayerPosition [
	numberRolled + currentPlayerPosition > positions
	ifTrue: [ ^aCurrentAmountOfLaps + 1 ]
	ifFalse: [ ^aCurrentAmountOfLaps ]
]

{ #category : #'as yet unclassified' }
Board >> positions [
	^ positions
]
