Class {
	#name : #MoonWalkPosition,
	#superclass : #Object,
	#instVars : [
		'n'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MoonWalkPosition class >> withN: anN [
	^self new initializeWithN: anN.
]

{ #category : #'as yet unclassified' }
MoonWalkPosition >> initializeWithN: anN [
	n := anN.
]

{ #category : #'as yet unclassified' }
MoonWalkPosition >> n [
	^ n
]
