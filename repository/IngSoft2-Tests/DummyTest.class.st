Class {
	#name : #DummyTest,
	#superclass : #TestCase,
	#classInstVars : [
		'conCaras'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DummyTest >> testDummy [
	"insertar pepardo"
	self assert: Dummy new isDummy
]

{ #category : #tests }
DummyTest >> testUnDadoNuevoDe3CarasTiene3Caras [
	"insertar pepardo"
	| dadin |
	dadin := Dado conCaras: 3.
	self assert: (dadin caras) equals: 3
]
