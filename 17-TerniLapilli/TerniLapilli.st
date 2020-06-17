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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:37:49'!
testAA

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveOFrom: 1@2 to: 0@1.] raise: Error withMessageText: TerniLapilli movingToTakenPositionErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:37:54'!
testAB

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveOFrom: 1@2 to: 0@1.] raise: Error withMessageText: TerniLapilli movingToTakenPositionErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:38:32'!
testAC

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveOFrom: 1@2 to: 1@3.] raise: Error withMessageText: TerniLapilli outOfBoardErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:46:48'!
testAD

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	self should: [game moveXFrom: 1@1 to: 2@0.] raise: Error withMessageText: TerniLapilli movingTooFarErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 19:02:51'!
testAE

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveOFrom: 1@2 to: 2@0.] raise: Error withMessageText: TerniLapilli movingTooFarErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:27:52'!
testAF

	| game |
	
	game := TerniLapilli new.
	
	self deny: (game isXAt: 1@2).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:28:38'!
testAG

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@2.
	
	self assert: (game isXAt: 1@2).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:30:56'!
testAH

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@2.
	game putOAt: 2@2.
	game putXAt: 0@0.
	
	self assert: ((game isXAt: 1@2) and: [game isXAt: 0@0]).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:31:46'!
testAI

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@2.
	
	self deny: (game isOAt: 2@2).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:35:46'!
testAJ

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@2.
	game putOAt: 2@2.
	game putXAt: 0@0.
	game putOAt: 2@1.
	
	self assert: (game isOAt: 2@2).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:47:23'!
testAK

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@2.
	game putOAt: 2@0.
	game putXAt: 0@0.
	game putOAt: 2@1.
	
	self assert: ((game isOAt: 2@0) and: [game isOAt: 2@1]).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:39:46'!
testAL

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 2@1.
	game putOAt: 2@2.
	
	game moveXFrom: 1@2 to: 1@1 .
	
	self assert: ((game isXAt: 1@2) not and: [game isXAt: 1@1]).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:51:10'!
testAM

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 2@1.
	game putOAt: 2@2.
	
	game moveXFrom: 1@2 to: 1@1 .
	game moveOFrom: 1@0 to: 2@0.
	game moveXFrom: 1@1 to: 1@2.
	
	self assert: ((game isXAt: 1@1) not and: [game isXAt: 1@2]).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:47:41'!
testAN

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 2@1.
	game putOAt: 2@2.
	
	game moveXFrom: 1@2 to: 1@1 .
	game moveOFrom: 2@2 to: 1@2 .
	
	self assert: ((game isOAt: 2@2) not and: [game isOAt: 1@2]).! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:50:34'!
testAO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 2@1.
	game putOAt: 2@2.
	
	game moveXFrom: 1@2 to: 1@1.
	game moveOFrom: 1@0 to: 2@0.
	game moveXFrom: 1@1 to: 1@2.
	game moveOFrom: 2@0 to: 1@0.
	
	self assert: ((game isOAt: 2@0) not and: [game isOAt: 1@0]).! !

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

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 17:11:09'!
testO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	
	self should: [game putOAt: 1@-1] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 17:12:16'!
testP

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	
	self should: [game putOAt: 3@1] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 17:12:24'!
testQ

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	
	self should: [game putOAt: 2@3] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 17:19:12'!
testR

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	self should: [game putXAt: 0@2] raise: Error description: TerniLapilli notEnoughTokensErrorDescription.! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 17:32:52'!
testS

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	
	self should: [game moveOFrom: 2@2 to: 1@2.] raise: Error withMessageText: TerniLapilli notInTokenMovementPhaseErrorDescription.
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 17:41:11'!
testT

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	self should: [game moveXFrom: 2@2 to: 0@2.] raise: Error withMessageText: TerniLapilli movingTokenFailErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 17:56:51'!
testU

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 1@2.
	
	self should: [game moveXFrom: 1@2 to: 1@0.] raise: Error withMessageText: TerniLapilli isNotTurnOfXErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:54:25'!
testV

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveXFrom: 2@1 to: 1@1.] raise: Error withMessageText: TerniLapilli isNotTurnOfXErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:18:10'!
testW

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	self should: [game moveXFrom: 1@1 to: 1@2.] raise: Error withMessageText: TerniLapilli movingToTakenPositionErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:18:26'!
testX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	self should: [game moveXFrom: 1@1 to: 2@1.] raise: Error withMessageText: TerniLapilli movingToTakenPositionErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:27:21'!
testY

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	self should: [game moveXFrom: 1@1 to: -1@1.] raise: Error withMessageText: TerniLapilli outOfBoardErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:35:12'!
testZ

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveOFrom: 1@1 to: 2@1.] raise: Error withMessageText: TerniLapilli movingTokenFailErrorDescription.
	
	
	
	
! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'turn positionsTakenByX positionsTakenByO'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/17/2020 16:44:45'!
moveOFrom: positionToken to: aPositionDestination

	self isPlayingO ifFalse: [self error: self class isNotTurnOfOErrorDescription].

	(positionsTakenByO size = 3) ifFalse: [self error: self class notInTokenMovementPhaseErrorDescription.].
 
	(positionsTakenByO includes: positionToken)  ifFalse: [self error: self class movingTokenFailErrorDescription.].
	
	self validatePositionDestination: aPositionDestination.
	
	(aPositionDestination dist: positionToken) = 1 ifFalse: [self error: self class movingTooFarErrorDescription].
	
	positionsTakenByO remove: positionToken.
	positionsTakenByO add: aPositionDestination.
	
	self turnOfX. 
	! !

!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/17/2020 16:42:29'!
moveXFrom: positionToken to: aPositionDestination

	self isPlayingX ifFalse: [self error: self class isNotTurnOfXErrorDescription].
 
	(positionsTakenByX size = 3) ifFalse: [self error: self class notInTokenMovementPhaseErrorDescription].
	
	(positionsTakenByX includes: positionToken) ifFalse: [self error: self class movingTokenFailErrorDescription].
	
	self validatePositionDestination: aPositionDestination.
	
	(aPositionDestination dist: positionToken) = 1 ifFalse: [self error: self class movingTooFarErrorDescription].
	
	positionsTakenByX  remove: positionToken.
	positionsTakenByX add: aPositionDestination.
	
	self turnOfO.! !

!TerniLapilli methodsFor: 'token management' stamp: 'DL 6/15/2020 17:10:06'!
putOAt: aPosition

 	self isPlayingO ifFalse: [self signalIsNotTurnOfO].
	
	self validatePositionIsInBounds: aPosition.	

	self validPositionTaken: aPosition.
	
	positionsTakenByO add: aPosition.
	
	self turnOfX.! !

!TerniLapilli methodsFor: 'token management' stamp: 'DL 6/16/2020 17:23:07'!
putXAt: aPosition

	self isPlayingX ifFalse: [self signalIsNotTurnOfX].
	
	(positionsTakenByX size >= 3) ifTrue: [self error: self class notEnoughTokensErrorDescription].
	
	self validatePositionIsInBounds: aPosition.	
	
	self validPositionTaken: aPosition.
	
	positionsTakenByX add: aPosition.
	
	self turnOfO.
	! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:32:44'!
initialize

	turn := #X.
	positionsTakenByX := OrderedCollection new.
	positionsTakenByO := OrderedCollection new.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:47:09'!
isOAt: aPosition 
	^positionsTakenByO includes: aPosition.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:15:08'!
isPlayingO

	^turn = #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:19:56'!
isPlayingX

	^turn = #X.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'MF 6/17/2020 16:29:26'!
isXAt: aPosition 
	^positionsTakenByX includes: aPosition.! !

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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:31:14'!
validatePositionDestination: aPositionDestination
	
	self validatePositionIsInBounds: aPositionDestination.
	
	(positionsTakenByX includes: aPositionDestination) ifTrue: [self error: self class movingToTakenPositionErrorDescription].
	
	(positionsTakenByO includes: aPositionDestination) ifTrue: [self error: self class movingToTakenPositionErrorDescription].! !

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

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:12:43'!
movingToTakenPositionErrorDescription

	^'Cant move to taken position.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 17:43:04'!
movingTokenFailErrorDescription

	^'Your token is not in that position.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 18:47:57'!
movingTooFarErrorDescription

 	^'Only movements to distance 1.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 17:21:02'!
notEnoughTokensErrorDescription
	
	^'You have alredy used all tokens'.! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/16/2020 17:30:51'!
notInTokenMovementPhaseErrorDescription

 	^'Not in phase of movement.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:52:37'!
outOfBoardErrorDescription

	^'Cannot play in a position out of board.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:51:15'!
positionIsTakenErrorDescription

	^'The position is taken.'! !
