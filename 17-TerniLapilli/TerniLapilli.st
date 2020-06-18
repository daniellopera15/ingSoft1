!classDefinition: #TerniLapilliTest category: #TerniLapilli!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 20:40:42'!
testAfterPutOIsTurnOfX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	game putOAt: 0@1.
	
	self assert: game isPlayingX.! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:58:45'!
testAfterPutXAllTokensTheWinnerIsX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 2@2.
	
	self assert: game hasPlayerXWon.! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:37:22'!
testCannotMoveXTooFar

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	self should: [game moveXFrom: 1@1 to: 2@0.] raise: Error withMessageText: TerniLapilli movingTooFarErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:10:53'!
testCannotPutXAfterAxisXOf22

	| game |
	
	game := TerniLapilli new.
	
	self should: [game putXAt: 3@2] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:09:26'!
testCannotPutXAfterAxisYOf22

	| game |
	
	game := TerniLapilli new.
	
	self should: [game putXAt: 2@3] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:26:58'!
testCannotPutXBeforeAxisXOf01

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	self should: [game moveXFrom: 1@1 to: -1@1.] raise: Error withMessageText: TerniLapilli outOfBoardErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:05:29'!
testCannotPutXBeforeInAxisXOf00

	| game |
	
	game := TerniLapilli new.
	
	self should: [game putXAt: -1@0] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:04:54'!
testCannotPutXBeforeInAxisYOf00

	| game |
	
	game := TerniLapilli new.
		
	self should: [game putXAt: 0@-1] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 20:49:08'!
testCannotPutXInAPositionTakenForO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	game putOAt: 0@1.
	
	self should: [game putXAt: 0@1] raise: Error description: TerniLapilli positionIsTakenErrorDescription.! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 20:48:55'!
testCannotPutXInAPositionTakenForX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	game putOAt: 0@1.
	
	self should: [game putXAt: 0@0] raise: Error description: TerniLapilli positionIsTakenErrorDescription.! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 20:43:26'!
testCannotPutXWhenIsTurnOfO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	
	self should: [game putXAt: 0@1] raise: Error withMessageText: TerniLapilli isNotTurnOfXErrorDescription! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:25:52'!
testFailMoveXToTakenPositionForO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	self should: [game moveXFrom: 1@1 to: 1@2.] raise: Error withMessageText: TerniLapilli movingToTakenPositionErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:26:03'!
testFailMoveXToTakenPositionForX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	self should: [game moveXFrom: 1@1 to: 2@1.] raise: Error withMessageText: TerniLapilli movingToTakenPositionErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:24:37'!
testFailMoveXTwoTimes

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveXFrom: 2@1 to: 1@1.] raise: Error withMessageText: TerniLapilli isNotTurnOfXErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:23:52'!
testFailMoveXWhenIsTurnOfO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 1@2.
	
	self should: [game moveXFrom: 1@2 to: 1@0.] raise: Error withMessageText: TerniLapilli isNotTurnOfXErrorDescription.
	! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:22:49'!
testFailMoveXWithPositionBelongsToO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	self should: [game moveXFrom: 0@0 to: 1@0.] raise: Error withMessageText: TerniLapilli movingTokenFailErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:19:05'!
testFailWhenPutXMore3Times

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@1.
	game putOAt: 1@2.
	
	self should: [game putXAt: 0@2] raise: Error description: TerniLapilli notEnoughTokensErrorDescription.! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 22:01:40'!
testMoveXAndFormALinePlayerXWinner

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 2@1.
	game putOAt: 1@1.
	
	game moveXFrom: 2@1 to: 2@2. 
	
	self assert: game hasPlayerXWon. ! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 20:30:39'!
testShouldStartPlayingXWhenNewGame

	| game |
	game := TerniLapilli new.
	
	self assert: game isPlayingX.! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:54:31'!
testWhenMoveXThatPositionsChangeWhoBelongTo

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

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:45:40'!
testWhenPutX2TimesThatsPositionsBelongsToX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@2.
	game putOAt: 2@2.
	game putXAt: 0@0.
	
	self assert: ((game isXAt: 1@2) and: [game isXAt: 0@0]).! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:40:26'!
testWhenPutXInAPositionThatPositionBelogsToX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@2.
	
	self assert: (game isXAt: 1@2).! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:46:13'!
testWhenPutXThatPositionsNoBelongsToO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@2.
	
	self deny: (game isOAt: 2@2).! !

!TerniLapilliTest methodsFor: 'test X' stamp: 'DL 6/17/2020 21:39:43'!
testWhenStartGameNoExistTokensOfXPlaying

	| game |
	
	game := TerniLapilli new.
	
	self deny: (game isXAt: 1@2).! !


!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:58:24'!
testAfterPutOAllTokensTheWinnerIsO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 2@1.
	game putOAt: 2@0.
	
	self assert: game hasPlayerOWon.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 20:40:24'!
testAfterPutXIsTurnOfO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	
	self assert: game isPlayingO.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:36:20'!
testCannotMoveOFrom12ToOutOfBoard

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveOFrom: 1@2 to: 1@3.] raise: Error withMessageText: TerniLapilli outOfBoardErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:37:33'!
testCannotMoveOTooFar

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveOFrom: 1@2 to: 2@0.] raise: Error withMessageText: TerniLapilli movingTooFarErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:16:42'!
testCannotPutOAfterAxisXOf21

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	
	self should: [game putOAt: 3@1] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:17:06'!
testCannotPutOAfterAxisYOf22

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	
	self should: [game putOAt: 2@3] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:15:43'!
testCannotPutOBeforeAxisXOf02

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	
	self should: [game putOAt: -1@2] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:15:28'!
testCannotPutOBeforeAxisYOf10

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	
	self should: [game putOAt: 1@-1] raise: Error description: TerniLapilli outOfBoardErrorDescription.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 20:49:54'!
testCannotPutOInAPositionTakenForO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	game putOAt: 0@1.
	game putXAt: 0@2.
	
	self should: [game putOAt: 0@1] raise: Error description: TerniLapilli positionIsTakenErrorDescription.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 20:49:22'!
testCannotPutOInAPositionTakenForX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@0.
	
	self should: [game putOAt: 0@0] raise: Error description: TerniLapilli positionIsTakenErrorDescription.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 20:41:00'!
testCannotPutOWhenIsTurnOfX

	| game |
	
	game := TerniLapilli new.
	
	self should: [game putOAt: 1@1] raise: Error withMessageText: TerniLapilli isNotTurnOfOErrorDescription.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:34:33'!
testFailMoveOToTakenPositionForO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveOFrom: 1@2 to: 2@2.] raise: Error withMessageText: TerniLapilli movingToTakenPositionErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:29:46'!
testFailMoveOToTakenPositionForX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveOFrom: 1@2 to: 0@2.] raise: Error withMessageText: TerniLapilli movingToTakenPositionErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:29:02'!
testFailMoveOWithPositionBelongsToX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 0@2.
	game putOAt: 1@2.
	
	game moveXFrom: 1@1 to: 1@0.
	
	self should: [game moveOFrom: 2@1 to: 2@0.] raise: Error withMessageText: TerniLapilli movingTokenFailErrorDescription.
	
	
	
	
! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:20:27'!
testFailMovingOBeforePutAllTokensOfO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	
	self should: [game moveOFrom: 2@2 to: 1@2.] raise: Error withMessageText: TerniLapilli notInTokenMovementPhaseErrorDescription.
	
	
	
! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 22:01:15'!
testMoveOAndFormALinePlayerOWinner

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 1@1.
	game putOAt: 2@1.
	
	game moveXFrom: 1@1 to: 0@1. 
	game moveOFrom: 2@1 to: 2@0. 
	
	self assert: game hasPlayerOWon.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 22:03:33'!
testWhenMoveOAndWinCannotMoveX

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 1@1.
	game putOAt: 2@1.
	
	game moveXFrom: 1@1 to: 0@1. 
	game moveOFrom: 2@1 to: 2@0. 
	
	self should: [game moveXFrom: 0@1 to: 1@1] raise: Error withMessageText: TerniLapilli playingWhenThereIsAWinnerErrorDescription.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:55:44'!
testWhenMoveOThatPositionsChangeWhoBelongTo

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

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 22:03:54'!
testWhenMoveXAndWinCannotMoveO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 2@1.
	game putOAt: 1@1.
	
	game moveXFrom: 2@1 to: 2@2. 
	
	self should: [game moveOFrom: 1@1 to: 0@1. ] raise: Error withMessageText: TerniLapilli playingWhenThereIsAWinnerErrorDescription.! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:50:09'!
testWhenPutO2TimesThatPositionsBelongsToO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@2.
	game putOAt: 2@0.
	game putXAt: 0@0.
	game putOAt: 2@1.
	
	self assert: ((game isOAt: 2@0) and: [game isOAt: 2@1]).! !

!TerniLapilliTest methodsFor: 'test O' stamp: 'DL 6/17/2020 21:46:43'!
testWhenPutOThatPositionBelongsToO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@2.
	game putOAt: 2@2.
	game putXAt: 0@0.
	game putOAt: 2@1.
	
	self assert: (game isOAt: 2@2).! !


!TerniLapilliTest methodsFor: 'general' stamp: 'DL 6/17/2020 21:56:53'!
testNoWinnersWhenStartGame

	| game |
	
	game := TerniLapilli new.
	
	self deny: (game hasPlayerOWon or: [game hasPlayerXWon]).! !

!TerniLapilliTest methodsFor: 'general' stamp: 'DL 6/17/2020 22:00:09'!
testWhenXAndOPutsAllTokensAndNoExistWinners

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 2@1.
	game putOAt: 1@1.
	
	self deny: (game hasPlayerXWon or: [game hasPlayerOWon]).! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'turn positionsTakenByX positionsTakenByO winner lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/17/2020 18:04:58'!
hasPlayerOWon

	^winner = #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/17/2020 18:48:04'!
hasPlayerXWon
	
	^winner = #X.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/17/2020 18:40:31'!
initialize

	turn := #X.
	positionsTakenByX := OrderedCollection new.
	positionsTakenByO := OrderedCollection new.
	lines :={
		{0@0. 1@0. 2@0}.
		{0@1. 1@1. 2@1}.
		{0@2. 1@2. 2@2}.
		{0@0. 0@1. 0@2}.
		{1@0. 1@1. 1@2}.
		{2@0. 2@1. 2@2}.
		{0@2. 1@1. 2@0}.
		{0@0. 1@1. 2@2}
	}! !

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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/17/2020 19:28:18'!
verify: positionsTakenByToken makeWinnerTo: typeToken

	^ (positionsTakenByToken size = 3) ifTrue: 
	[(lines anySatisfy: 
		[:line | line allSatisfy: [:position | positionsTakenByToken includes: position]]) 
		ifTrue: [winner := typeToken]]! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/17/2020 19:28:42'!
verifyOIsWinner

	self verify: positionsTakenByO makeWinnerTo: #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/17/2020 19:29:10'!
verifyXIsWinner

	self verify: positionsTakenByX makeWinnerTo: #X.! !


!TerniLapilli methodsFor: 'token management' stamp: 'DL 6/17/2020 20:28:32'!
moveOFrom: positionToken to: aPositionDestination

	self validateSomeoneWon.

	self isPlayingO ifFalse: [self error: self class isNotTurnOfOErrorDescription].

	(positionsTakenByO size = 3) ifFalse: [self error: self class notInTokenMovementPhaseErrorDescription.].
	
	self validatePositionDestination: aPositionDestination.
	
	(aPositionDestination dist: positionToken) = 1 ifFalse: [self error: self class movingTooFarErrorDescription].
	
	positionsTakenByO remove: positionToken ifAbsent: [self error: self class movingTokenFailErrorDescription.].
	
	positionsTakenByO add: aPositionDestination.
	
	self verifyOIsWinner.
	
	self turnOfX. 
	! !

!TerniLapilli methodsFor: 'token management' stamp: 'DL 6/17/2020 20:28:52'!
moveXFrom: positionToken to: aPositionDestination

	self validateSomeoneWon.
	
	self isPlayingX ifFalse: [self error: self class isNotTurnOfXErrorDescription].
 
	(positionsTakenByX size = 3) ifFalse: [self error: self class notInTokenMovementPhaseErrorDescription].
	
	self validatePositionDestination: aPositionDestination.
	
	(aPositionDestination dist: positionToken) = 1 ifFalse: [self error: self class movingTooFarErrorDescription].
	
	positionsTakenByX remove: positionToken ifAbsent: [self error: self class movingTokenFailErrorDescription].
	
	positionsTakenByX add: aPositionDestination.
	
	self verifyXIsWinner. 
	
	self turnOfO.! !

!TerniLapilli methodsFor: 'token management' stamp: 'DL 6/17/2020 19:23:45'!
putOAt: aPosition

 	self isPlayingO ifFalse: [self signalIsNotTurnOfO].
	
	self validatePositionIsInBounds: aPosition.	

	self validPositionTaken: aPosition.
	
	positionsTakenByO add: aPosition.
	
	self verifyOIsWinner.
	
	self turnOfX.! !

!TerniLapilli methodsFor: 'token management' stamp: 'DL 6/17/2020 19:23:15'!
putXAt: aPosition

	self isPlayingX ifFalse: [self signalIsNotTurnOfX].
	
	(positionsTakenByX size >= 3) ifTrue: [self error: self class notEnoughTokensErrorDescription].
	
	self validatePositionIsInBounds: aPosition.	
	
	self validPositionTaken: aPosition.
	
	positionsTakenByX add: aPosition.
	
	self verifyXIsWinner.
	
	self turnOfO.
	! !

!TerniLapilli methodsFor: 'token management' stamp: 'DL 6/17/2020 20:28:32'!
validateSomeoneWon

	^ (winner = #X or: [winner = #O]) ifTrue: [self error: self class playingWhenThereIsAWinnerErrorDescription]! !

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

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/17/2020 19:38:34'!
playingWhenThereIsAWinnerErrorDescription

	 ^'Cannot play when there is a winner'.! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:51:15'!
positionIsTakenErrorDescription

	^'The position is taken.'! !
