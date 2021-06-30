"
I am a MoonWalkPosition.
I know how to apply my effect and that I have a specific n.
"
Class {
	#name : #MoonWalkPosition,
	#superclass : #Object,
	#instVars : [
		'n'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
MoonWalkPosition class >> assertValidN: anN [
	anN > 0
	ifFalse: [ Error signal: 'N in Moonwalk must be > 0' ].
]

{ #category : #'as yet unclassified' }
MoonWalkPosition class >> withN: anN [
	self assertValidN: anN.
		^self new initializeWithN: anN.
]

{ #category : #'board effect' }
MoonWalkPosition >> applyTo: aPlayerStatus withARollOf: anInteger on: aBoard beingPlayedOn: anIngSoft2Game [ 
	aBoard applyMoonwalkEffectTo: aPlayerStatus afterLandingOn: self beingPlayedOn: anIngSoft2Game. 
]

{ #category : #initialization }
MoonWalkPosition >> initializeWithN: anN [
	n := anN.
]

{ #category : #accessing }
MoonWalkPosition >> n [
	^ n
]
