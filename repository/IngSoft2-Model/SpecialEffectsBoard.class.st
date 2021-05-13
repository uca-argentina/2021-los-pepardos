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

	^currPos + diceNumber + (self changeInMovementCausedByPosition: currPos + diceNumber)
]

{ #category : #'as yet unclassified' }
SpecialEffectsBoard >> initializeWith: aNumberOfPositions [

	positions := aNumberOfPositions.
		
   numberOfNonEffects := positions * 0.48.
   numberOfWormHole := positions * 0.2.
   numberOfSpeedUp := positions * 0.2.
   numberOfMoonWalk := positions * 0.1.
   numberOfNuke := positions * 0.02.

	
	

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
