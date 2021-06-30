"
I am an Acceleration Card.

My responsibilities are:
- Apply a boost of 1.
- I can make the game boost every player dice roll by 1.

"
Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'boost application' }
AccelerationCard >> applyCardEffectTo: aPlayerStatus on: aGame [ 
	aGame boostEveryPlayerBy: (self boostApplied)
]

{ #category : #'boost application' }
AccelerationCard >> boostApplied [
	^1
]

{ #category : #testing }
AccelerationCard >> isPermanent [
	^true
]

{ #category : #accessing }
AccelerationCard >> type [
	type := 'Acceleration'.
	^type.
]
