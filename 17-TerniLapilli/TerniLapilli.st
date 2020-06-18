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

!TerniLapilliTest methodsFor: 'test X' stamp: 'MF 6/18/2020 14:00:49'!
testFailWhenPutXMore3Times

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 1@1.
	game putOAt: 2@2.
	
	game putXAt: 2@1.
	game putOAt: 0@0.
	
	game putXAt: 2@0.
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

!TerniLapilliTest methodsFor: 'test O' stamp: 'MF 6/18/2020 13:59:21'!
testWhenPlayXAndWinCannotPlayO

	| game |
	
	game := TerniLapilli new.
	
	game putXAt: 0@2.
	game putOAt: 0@0.
	game putXAt: 1@2.
	game putOAt: 1@0.
	game putXAt: 2@2.
	
	self should: [game putOAt: 1@1. ] raise: Error withMessageText: TerniLapilli playingWhenThereIsAWinnerErrorDescription.! !

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
	instanceVariableNames: 'state turn positionsTakenByX positionsTakenByO winner lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'assertions' stamp: 'MF 6/18/2020 16:07:54'!
hasPlayerOWon

	^state hasPlayerOWon.! !

!TerniLapilli methodsFor: 'assertions' stamp: 'MF 6/18/2020 16:08:09'!
hasPlayerXWon
	
	^state hasPlayerXWon.! !

!TerniLapilli methodsFor: 'assertions' stamp: 'MF 6/17/2020 16:47:09'!
isOAt: aPosition 
	^positionsTakenByO includes: aPosition.! !

!TerniLapilli methodsFor: 'assertions' stamp: 'MF 6/18/2020 14:59:03'!
isOver

	^self hasPlayerOWon or: [self hasPlayerXWon].! !

!TerniLapilli methodsFor: 'assertions' stamp: 'MF 6/18/2020 15:58:01'!
isPlayingO

	^state isPlayingO .! !

!TerniLapilli methodsFor: 'assertions' stamp: 'MF 6/18/2020 15:58:37'!
isPlayingX

	^state isPlayingX .! !

!TerniLapilli methodsFor: 'assertions' stamp: 'MF 6/17/2020 16:29:26'!
isXAt: aPosition 
	^positionsTakenByX includes: aPosition.! !


!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:19:30'!
XXXXXXXverifyOIsWinner

	^self XXXXXverify: positionsTakenByO! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:19:36'!
XXXXXXXverifyXIsWinner

	^self XXXXXverify: positionsTakenByX.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:19:19'!
XXXXXverify: positionsTakenByToken

	^(positionsTakenByToken size = 3) ifTrue: 
	[^lines anySatisfy: 
		[:line | line allSatisfy: [:position | positionsTakenByToken includes: position]]
	] ifFalse: [^false]! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:02:13'!
initialize

	turn := #X.
	positionsTakenByX := OrderedCollection new.
	positionsTakenByO := OrderedCollection new.
	state := TerniLapilliXPlaysState new.
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

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:06:28'!
numberOfOTokensInBoard
	^positionsTakenByO size.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:06:33'!
numberOfXTokensInBoard
	^positionsTakenByX size.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:08:22'!
turnOfO

	turn := #O.! !

!TerniLapilli methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:17:35'!
turnOfX

	turn := #X.! !

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


!TerniLapilli methodsFor: 'signals' stamp: 'DL 6/15/2020 16:45:24'!
signalIsNotTurnOfO

	^ self error: self class isNotTurnOfOErrorDescription! !

!TerniLapilli methodsFor: 'signals' stamp: 'DL 6/15/2020 16:46:03'!
signalIsNotTurnOfX

	^ self error: self class isNotTurnOfXErrorDescription! !

!TerniLapilli methodsFor: 'signals' stamp: 'MF 6/18/2020 16:37:32'!
signalMovingInPlayPhase

	^ self error: self class notInTokenMovementPhaseErrorDescription! !

!TerniLapilli methodsFor: 'signals' stamp: 'DL 6/15/2020 17:04:09'!
signalOutOfBoard

	^ self error: self class outOfBoardErrorDescription! !

!TerniLapilli methodsFor: 'signals' stamp: 'MF 6/18/2020 16:40:52'!
signalPlayingInMovePhase

	^ self error: self class notInTokenPlayingPhaseErrorDescription! !

!TerniLapilli methodsFor: 'signals' stamp: 'MF 6/18/2020 16:32:18'!
signalPlayingNotInOTurn

	^ self error: self class isNotTurnOfOErrorDescription! !

!TerniLapilli methodsFor: 'signals' stamp: 'MF 6/18/2020 16:31:26'!
signalPlayingNotInXTurn

	^ self error: self class isNotTurnOfXErrorDescription! !

!TerniLapilli methodsFor: 'signals' stamp: 'MF 6/18/2020 16:28:13'!
signalPlayingOnGameOver

	^ self error: self class playingWhenThereIsAWinnerErrorDescription! !

!TerniLapilli methodsFor: 'signals' stamp: 'DL 6/15/2020 16:41:16'!
signalPositionIsTaken
	
	self error: self class positionIsTakenErrorDescription.	! !


!TerniLapilli methodsFor: 'validations' stamp: 'DL 6/15/2020 16:41:40'!
validPositionTaken: aPosition
	
	(positionsTakenByO includes: aPosition) ifTrue: [self signalPositionIsTaken].	
	(positionsTakenByX includes: aPosition) ifTrue: [self signalPositionIsTaken].! !

!TerniLapilli methodsFor: 'validations' stamp: 'DL 6/16/2020 18:31:14'!
validatePositionDestination: aPositionDestination
	
	self validatePositionIsInBounds: aPositionDestination.
	
	(positionsTakenByX includes: aPositionDestination) ifTrue: [self error: self class movingToTakenPositionErrorDescription].
	
	(positionsTakenByO includes: aPositionDestination) ifTrue: [self error: self class movingToTakenPositionErrorDescription].! !

!TerniLapilli methodsFor: 'validations' stamp: 'DL 6/15/2020 17:08:21'!
validatePositionIsInBounds: aPosition
	
	(aPosition x between: 0 and: 2) ifFalse: [self signalOutOfBoard].
	(aPosition y between: 0 and: 2) ifFalse: [self signalOutOfBoard].	
	! !


!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/18/2020 16:52:48'!
addOTokenAt: aPosition
	self validatePositionIsInBounds: aPosition.	

	self validPositionTaken: aPosition.
	
	positionsTakenByO add: aPosition.! !

!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/18/2020 16:53:00'!
addXTokenAt: aPosition
	self validatePositionIsInBounds: aPosition.	

	self validPositionTaken: aPosition.
	
	positionsTakenByX add: aPosition.! !

!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/18/2020 16:59:36'!
moveOFrom: positionToken to: aPositionDestination
	state moveOFrom: positionToken to: aPositionDestination in: self.
	state := state nextStateFor: self! !

!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/18/2020 16:59:43'!
moveXFrom: positionToken to: aPositionDestination
	state moveXFrom: positionToken to: aPositionDestination in: self.
	state := state nextStateFor: self ! !

!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/18/2020 16:59:52'!
putOAt: aPosition
	state putOAt: aPosition in: self.
	state := state nextStateFor: self! !

!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/18/2020 16:59:58'!
putXAt: aPosition

	state putXAt: aPosition in: self.
	state := state nextStateFor: self! !

!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/18/2020 16:59:22'!
removeOFrom: positionToken andAddTo: aPositionDestination
	
	self validatePositionDestination: aPositionDestination.
	
	(aPositionDestination dist: positionToken) = 1 ifFalse: [self error: self class movingTooFarErrorDescription].
	
	positionsTakenByO remove: positionToken ifAbsent: [self error: self class movingTokenFailErrorDescription.].
	
	positionsTakenByO add: aPositionDestination.! !

!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/18/2020 16:59:28'!
removeXFrom: positionToken andAddTo: aPositionDestination
	
	self validatePositionDestination: aPositionDestination.
	
	(aPositionDestination dist: positionToken) = 1 ifFalse: [self error: self class movingTooFarErrorDescription].
	
	positionsTakenByX remove: positionToken ifAbsent: [self error: self class movingTokenFailErrorDescription.].
	
	positionsTakenByX add: aPositionDestination.! !

!TerniLapilli methodsFor: 'token management' stamp: 'MF 6/18/2020 16:28:13'!
validateSomeoneWon

	^ (winner = #X or: [winner = #O]) ifTrue: [self signalPlayingOnGameOver]! !

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

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:41:40'!
notInTokenMovementPhaseErrorDescription

 	^'Not in phase of movement.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:41:50'!
notInTokenPlayingPhaseErrorDescription

 	^'Not in phase of playing new tokens.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/15/2020 16:52:37'!
outOfBoardErrorDescription

	^'Cannot play in a position out of board.'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/17/2020 19:38:34'!
playingWhenThereIsAWinnerErrorDescription

	 ^'Cannot play when there is a winner'.! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'DL 6/11/2020 20:51:15'!
positionIsTakenErrorDescription

	^'The position is taken.'! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:08:37'!
hasPlayerOWon
	^self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:08:40'!
hasPlayerXWon
	^self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 15:58:17'!
isPlayingO
	^self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 15:58:19'!
isPlayingX
	^self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:26:56'!
moveOFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	^self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:27:14'!
moveXFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	^self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 15:50:10'!
nextStateFor: aTerniLapilliGame
	^self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:28:54'!
putOAt: aPosition in: aTerniLapilliGame
	^self subclassResponsibility ! !

!TerniLapilliState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:28:57'!
putXAt: aPosition in: aTerniLapilliGame
	^self subclassResponsibility ! !


!classDefinition: #TerniLapilliGameOverState category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliGameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliGameOverState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:09:13'!
hasPlayerOWon
	^self subclassResponsibility ! !

!TerniLapilliGameOverState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:09:19'!
hasPlayerXWon
	^self subclassResponsibility ! !

!TerniLapilliGameOverState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 15:54:32'!
isPlayingO
	^false! !

!TerniLapilliGameOverState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 15:54:38'!
isPlayingX
	^false! !

!TerniLapilliGameOverState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:28:30'!
moveOFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	^aTerniLapilliGame signalPlayingOnGameOver ! !

!TerniLapilliGameOverState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:28:34'!
moveXFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	^aTerniLapilliGame signalPlayingOnGameOver ! !

!TerniLapilliGameOverState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 15:56:33'!
nextStateFor: aTerniLapilliGame
	^self! !

!TerniLapilliGameOverState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:29:45'!
putOAt: aPosition in: aTerniLapilliGame
	^aTerniLapilliGame signalPlayingOnGameOver! !

!TerniLapilliGameOverState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:29:40'!
putXAt: aPosition in: aTerniLapilliGame
	^aTerniLapilliGame signalPlayingOnGameOver! !


!classDefinition: #TerniLapilliOWinsState category: #TerniLapilli!
TerniLapilliGameOverState subclass: #TerniLapilliOWinsState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliOWinsState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:09:31'!
hasPlayerOWon
	^true! !

!TerniLapilliOWinsState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:09:38'!
hasPlayerXWon
	^false! !


!classDefinition: #TerniLapilliXWinsState category: #TerniLapilli!
TerniLapilliGameOverState subclass: #TerniLapilliXWinsState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliXWinsState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:10:13'!
hasPlayerOWon
	^false! !

!TerniLapilliXWinsState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:10:17'!
hasPlayerXWon
	^true! !


!classDefinition: #TerniLapilliOTurnState category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliOTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliOTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:10:39'!
hasPlayerOWon
	^false! !

!TerniLapilliOTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:10:48'!
hasPlayerXWon
	^false! !

!TerniLapilliOTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 15:52:53'!
isPlayingO
	^true! !

!TerniLapilliOTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 15:52:58'!
isPlayingX
	^false! !

!TerniLapilliOTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:33:39'!
moveOFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	^self subclassResponsibility! !

!TerniLapilliOTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:32:58'!
moveXFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	^aTerniLapilliGame signalPlayingNotInXTurn ! !

!TerniLapilliOTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 15:53:34'!
nextStateFor: aTerniLapilliGame
	^self subclassResponsibility ! !

!TerniLapilliOTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:30:23'!
putOAt: aPosition in: aTerniLapilliGame
	^self subclassResponsibility! !

!TerniLapilliOTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:32:33'!
putXAt: aPosition in: aTerniLapilliGame
	^aTerniLapilliGame signalPlayingNotInXTurn ! !


!classDefinition: #TerniLapilliOMovesState category: #TerniLapilli!
TerniLapilliOTurnState subclass: #TerniLapilliOMovesState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliOMovesState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:56:05'!
moveOFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	aTerniLapilliGame removeOFrom: positionToken andAddTo: aPositionDestination 
! !

!TerniLapilliOMovesState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:15:43'!
nextStateFor: aTerniLapilliGame
	aTerniLapilliGame XXXXXXXverifyOIsWinner ifTrue: [^TerniLapilliOWinsState new] ifFalse: [^TerniLapilliXMovesState new]! !

!TerniLapilliOMovesState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:39:41'!
putOAt: aPosition in: aTerniLapilliGame
	^aTerniLapilliGame signalPlayingInMovePhase
! !


!classDefinition: #TerniLapilliOPlaysState category: #TerniLapilli!
TerniLapilliOTurnState subclass: #TerniLapilliOPlaysState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliOPlaysState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:38:37'!
moveOFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	^aTerniLapilliGame signalMovingInPlayPhase
	! !

!TerniLapilliOPlaysState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:15:53'!
nextStateFor: aTerniLapilliGame
	aTerniLapilliGame XXXXXXXverifyOIsWinner 
		ifTrue: [^TerniLapilliOWinsState new] 
		ifFalse: [
			(aTerniLapilliGame numberOfOTokensInBoard < 3) ifTrue: [^TerniLapilliXPlaysState new] ifFalse: [^TerniLapilliXMovesState new]
			]! !

!TerniLapilliOPlaysState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:53:53'!
putOAt: aPosition in: aTerniLapilliGame
	aTerniLapilliGame addOTokenAt: aPosition! !


!classDefinition: #TerniLapilliXTurnState category: #TerniLapilli!
TerniLapilliState subclass: #TerniLapilliXTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliXTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:11:01'!
hasPlayerOWon
	^false! !

!TerniLapilliXTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:11:03'!
hasPlayerXWon
	^false! !

!TerniLapilliXTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:03:07'!
isPlayingO
	^false! !

!TerniLapilliXTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:03:25'!
isPlayingX
	^true! !

!TerniLapilliXTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:34:15'!
moveOFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	^aTerniLapilliGame signalPlayingNotInOTurn! !

!TerniLapilliXTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:33:56'!
moveXFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	^self subclassResponsibility ! !

!TerniLapilliXTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 15:56:03'!
nextStateFor: aTerniLapilliGame
	^self subclassResponsibility! !

!TerniLapilliXTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:34:40'!
putOAt: aPosition in: aTerniLapilliGame
	^aTerniLapilliGame signalPlayingNotInOTurn! !

!TerniLapilliXTurnState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:34:51'!
putXAt: aPosition in: aTerniLapilliGame
	^self subclassResponsibility! !


!classDefinition: #TerniLapilliXMovesState category: #TerniLapilli!
TerniLapilliXTurnState subclass: #TerniLapilliXMovesState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliXMovesState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:56:17'!
moveXFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	aTerniLapilliGame removeXFrom: positionToken andAddTo: aPositionDestination 

! !

!TerniLapilliXMovesState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:16:02'!
nextStateFor: aTerniLapilliGame
	aTerniLapilliGame XXXXXXXverifyXIsWinner ifTrue: [^TerniLapilliXWinsState new] ifFalse: [^TerniLapilliOMovesState new]! !

!TerniLapilliXMovesState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:46:42'!
putXAt: aPosition in: aTerniLapilliGame
	^aTerniLapilliGame signalPlayingInMovePhase! !


!classDefinition: #TerniLapilliXPlaysState category: #TerniLapilli!
TerniLapilliXTurnState subclass: #TerniLapilliXPlaysState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliXPlaysState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:46:27'!
moveXFrom: positionToken to: aPositionDestination in: aTerniLapilliGame
	^aTerniLapilliGame signalMovingInPlayPhase
	! !

!TerniLapilliXPlaysState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:16:10'!
nextStateFor: aTerniLapilliGame
	aTerniLapilliGame XXXXXXXverifyXIsWinner ifTrue: [^TerniLapilliXWinsState new] ifFalse: [^TerniLapilliOPlaysState new]! !

!TerniLapilliXPlaysState methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 16:54:12'!
putXAt: aPosition in: aTerniLapilliGame
	aTerniLapilliGame addXTokenAt: aPosition 
! !
