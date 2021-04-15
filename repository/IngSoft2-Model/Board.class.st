Class {
	#name : #Board,
	#superclass : #Object,
	#classInstVars : [
		'boardPositions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Board class >> withBoardPositions: aNumberOfBoardPositions [ 
	boardPositions := aNumberOfBoardPositions.
]

{ #category : #'instance creation' }
Board class >> withPositions: aNumberOfBoardPositions [
 ^self initialize withBoardPositions: aNumberOfBoardPositions.
]
