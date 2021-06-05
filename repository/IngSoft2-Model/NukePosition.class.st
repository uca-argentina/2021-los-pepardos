Class {
	#name : #NukePosition,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
NukePosition >> applyEffectTo: aPlayerStatus afterLandingOn: aNukePosition withARollOf: anInteger onGame: anIngSoft2Game [ 

	anIngSoft2Game applyNukeEffectTo: aPlayerStatus. 
]
