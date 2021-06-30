"
I am a SpeedCard
"
Class {
	#name : #SpeedCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'boost application' }
SpeedCard >> applyCardEffectTo: aPlayerStatus on: anIngSoft2Game [ 
	aPlayerStatus modifyActiveBoostBy: (self boostApplied)
]

{ #category : #'boost application' }
SpeedCard >> boostApplied [
	^1
]

{ #category : #testing }
SpeedCard >> isPermanent [
	^true
]

{ #category : #accessing }
SpeedCard >> type [
	type := 'Speed'.
	^type.
]
