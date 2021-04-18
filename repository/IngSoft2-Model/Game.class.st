Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'player',
		'dice',
		'board',
		'winner'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withPlayer: aPlayer andDice: aDice andBoard: aBoard [ 
	^self new initializeWithAPlayer: aPlayer andWithDice: aDice andWithBoard: aBoard.
]

{ #category : #'as yet unclassified' }
Game >> checkAndUpdateWinner [

	winner add: ( ((player select: [:each | (each  at: 2)>= board positions]) at: 1) at:1)
]

{ #category : #'as yet unclassified' }
Game >> getPositionOfPlayer: playerNumber [
	^(player at:playerNumber ) at:2
]

{ #category : #'instance creation' }
Game >> initializeWithAPlayer: aPlayerList andWithDice: aDice andWithBoard: aBoard [ 
	|position|
	position := 0.
	player := OrderedCollection new.
	
	player := aPlayerList collect: [:aCurrentPlayer |  player add: {aCurrentPlayer . position}].

	dice := aDice.
	board := aBoard.
	winner := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Game >> isFinished [
	winner size >= 1
		ifTrue: [ ^true ]
		ifFalse: [ ^false ]
]

{ #category : #'as yet unclassified' }
Game >> update: aPlayer whoIsPlayer: playerNumber positionInBoardBy: numberRolledOnDice [
	|playerPos|
	playerPos := (player at: playerNumber) at: 2.
   (player at: playerNumber) at: 2 put: (numberRolledOnDice  + playerPos).
	
	(player select: [:each | (each  at: 2)>= board positions]) isEmpty 
		ifFalse: [ self checkAndUpdateWinner ] 
	
	

]

{ #category : #'as yet unclassified' }
Game >> winner [
	^winner. 
]
