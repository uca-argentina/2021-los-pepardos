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
SpeedCard >> applyCardEffectTo: aPlayerStatus on: aGame playedBy: cardUser [
	aGame assertPermanentCardPlayedOnTurnOf: cardUser.
	aPlayerStatus modifyActiveBoostBy: (self boostApplied).
	aPlayerStatus activeEffectsAdd: self.
	aGame updateLastCardPlayedToBe: self.
]

{ #category : #'boost application' }
SpeedCard >> boostApplied [
	^1
]

{ #category : #removing }
SpeedCard >> removeBoostProvidedFrom: aPlayerStatus on: aGame [ 
	aPlayerStatus modifyActiveBoostBy: (self boostApplied * -1).

]
