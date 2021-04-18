Class {
	#name : #LoadedDice,
	#superclass : #Object,
	#instVars : [
		'sides'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
LoadedDice class >> sides [
	self shouldBeImplemented.
]

{ #category : #'instance creation' }
LoadedDice class >> withSides: sides [
	^self new initializeWithLoadedSides: sides.
]

{ #category : #'as yet unclassified' }
LoadedDice >> initializeWithLoadedSides: aNumberOfLoadedSides [
	sides :=  aNumberOfLoadedSides.
]

{ #category : #'as yet unclassified' }
LoadedDice >> sides [
	^ sides
]
