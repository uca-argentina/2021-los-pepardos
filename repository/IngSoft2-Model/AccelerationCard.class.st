Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
AccelerationCard >> applyCardEffectTo: aPlayerStatus on: aGame [ 
	aGame boostEveryPlayerBy: (self boostApplied)
]

{ #category : #'as yet unclassified' }
AccelerationCard >> boostApplied [
	^1
]

{ #category : #'as yet unclassified' }
AccelerationCard >> isPermanent [
	^true
]

{ #category : #'as yet unclassified' }
AccelerationCard >> type [
	type := 'Acceleration'.
	^type.
]
