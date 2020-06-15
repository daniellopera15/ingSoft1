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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:29:09'!
testG

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	game putOAt: 0@1.
	
	self should: [game putXAt: 0@1] raise: Error description: TerniLapilli positionIsTakenErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:33:55'!
testH

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	game putOAt: 0@1.
	
	self should: [game putXAt: 0@0] raise: Error description: TerniLapilli positionIsTakenErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:35:40'!
testI

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	game putOAt: 0@1.
	game putXAt: 0@2.
	
	self should: [game putOAt: 0@1] raise: Error description: TerniLapilli positionIsTakenErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:59:41'!
testJ

	| game |
	
	game := TerniLapilli new.
	
	self should: [game putXAt: -1@0] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 17:00:01'!
testK

	| game |
	
	game := TerniLapilli new.
	
	self should: [game putXAt: 0@-1] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 17:01:54'!
testL

	| game |
	
	game := TerniLapilli new.
	
	self should: [game putXAt: 3@2] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 17:02:38'!
testM

	| game |
	
	game := TerniLapilli new.
	
	self should: [game putXAt: 2@3] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 17:09:37'!
testN

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	
	self should: [game putOAt: -1@2] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'turn positionsTakenByX positionsTakenByO'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:32:44'!
initialize

	turn := #X.
	positionsTakenByX := OrderedCollection new.
	positionsTakenByO := OrderedCollection new.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:15:08'!
isPlayingO

	^turn = #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:19:56'!
isPlayingX

	^turn = #X.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 17:10:06'!
putOAt: aPosition

 	self isPlayingO ifFalse: [self signalIsNotTurnOfO].
	
	self validatePositionIsInBounds: aPosition.	

	self validPositionTaken: aPosition.
	
	positionsTakenByO add: aPosition.
	
	self turnOfX.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 17:08:41'!
putXAt: aPosition

	self isPlayingX ifFalse: [self signalIsNotTurnOfX].
	
	self validatePositionIsInBounds: aPosition.	
	
	self validPositionTaken: aPosition.
	
	positionsTakenByX add: aPosition.
	
	self turnOfO.
	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:45:24'!
signalIsNotTurnOfO

	^ self error: self class isNotTurnOfOErrorDescription! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:46:03'!
signalIsNotTurnOfX

	^ self error: self class isNotTurnOfXErrorDescription! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 17:04:09'!
signalOutOfBoard

	^ self error: self class outOfBoardErrorDescription! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:41:16'!
signalPositionIsTaken
	
	self error: self class positionIsTakenErrorDescription.	! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:08:22'!
turnOfO

	turn := #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:17:35'!
turnOfX

	turn := #X.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:41:40'!
validPositionTaken: aPosition
	
	(positionsTakenByO includes: aPosition) ifTrue: [self signalPositionIsTaken].	
	(positionsTakenByX includes: aPosition) ifTrue: [self signalPositionIsTaken].! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 17:08:21'!
validatePositionIsInBounds: aPosition
	
	(aPosition x between: 0 and: 2) ifFalse: [self signalOutOfBoard].
	(aPosition y between: 0 and: 2) ifFalse: [self signalOutOfBoard].	
	! !

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

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:52:37'!
outOfBoardErrorDescription

	^'Cannot play in a position out of board.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:51:15'!
positionIsTakenErrorDescription

	^'The position is taken.'! !
