"
I am an Overloard Card.
I know how to apply my own effect and the boost resulting when I am played.
"
Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'type'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'boost application' }
OverloadCard >> applyCardEffectTo: aPlayerStatus on: aGame playedBy: cardUser [
	aGame assertPermanentCardPlayedOnTurnOf: cardUser.
	aPlayerStatus modifyActiveBoostBy: (self boostApplied).
	aPlayerStatus activeEffectsAdd: self.
	aGame updateLastCardPlayedToBe: self.
]

{ #category : #'boost application' }
OverloadCard >> boostApplied [
	^-2
]

{ #category : #removing }
OverloadCard >> removeBoostProvidedFrom: aPlayerStatus on: anIngSoft2Game [ 
	aPlayerStatus modifyActiveBoostBy: (self boostApplied * -1)
]
