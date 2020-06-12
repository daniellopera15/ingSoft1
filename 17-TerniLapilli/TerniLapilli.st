!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:00:47'!
testA

	| game |
	game := TerniLapilli new.
	
	self assert: game isPlayingX.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 19:58:07'!
testAPARADESPUES

	"game := XXXXX new
	
	game putXAt: 1@2
	
	self assert: game isXAt: 1@2"! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:48:06'!
testB

	| game |
	
	game := TerniLapilli new.
	
	self should: [game putOAt: 1@1] raise: Error withMessageText: TerniLapilli isNotTurnOfOErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:11:16'!
testC

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	
	self assert: game isPlayingO.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:16:39'!
testD

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	game putOAt: 0@1.
	
	self assert: game isPlayingX.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:48:22'!
testE

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	
	self should: [game putXAt: 0@1] raise: Error withMessageText: TerniLapilli isNotTurnOfXErrorDescription! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:50:30'!
testF

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	
	self should: [game putOAt: 0@0] raise: Error description: TerniLapilli positionIsTakenErrorDescription.! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'turn positionsTakenByX'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 21:27:57'!
initialize

	turn := #X.
	positionsTakenByX := OrderedCollection new.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:15:08'!
isPlayingO

	^turn = #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:19:56'!
isPlayingX

	^turn = #X.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 21:27:57'!
putOAt: aPosition

	turn = #O ifFalse: [self error: self class isNotTurnOfOErrorDescription].
	
	(positionsTakenByX includes: aPosition) ifTrue: [self error: self class positionIsTakenErrorDescription].
	
	self turnOfX.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 21:27:57'!
putXAt: aPosition

	turn = #X ifFalse: [self error: self class isNotTurnOfXErrorDescription].
	
	positionsTakenByX add: aPosition.
	
	self turnOfO.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:08:22'!
turnOfO

	turn := #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:17:35'!
turnOfX

	turn := #X.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:48:06'!
isNotTurnOfOErrorDescription

	^'Is turn of X.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:48:21'!
isNotTurnOfXErrorDescription

	^'Is turn of O'.! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:51:15'!
positionIsTakenErrorDescription

	^'The position is taken.'! !
