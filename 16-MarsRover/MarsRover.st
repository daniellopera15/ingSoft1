!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation validCommands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'MF 6/6/2020 18:48:57'!
at: startingPoint pointingTowards: anOrientation 
	position := startingPoint.
	orientation := anOrientation.
	validCommands := Set with: $f with: $b with: $l with: $r.! !


!MarsRover methodsFor: 'execution' stamp: 'MF 6/6/2020 19:48:48'!
excecute: aCommandList
	aCommandList do: [ :aCommandChar |
		
		(self isCommandValid: aCommandChar) ifFalse: [^aCommandChar].
		
		self executeSingleCommand: aCommandChar.
	]
! !

!MarsRover methodsFor: 'execution' stamp: 'MF 6/8/2020 15:39:39'!
executeSingleCommand: aCommandChar
	(MarsRoverCommand commandFor: aCommandChar) executeFor: self.

! !

!MarsRover methodsFor: 'execution' stamp: 'MF 6/6/2020 18:52:18'!
isCommandValid: aCommand 
	^validCommands includes: aCommand.! !


!MarsRover methodsFor: 'commands actions' stamp: 'MF 6/6/2020 18:04:08'!
backward
	^position := position + orientation backwardVector.! !

!MarsRover methodsFor: 'commands actions' stamp: 'MF 6/6/2020 17:54:23'!
forward
	position := position + orientation forwardVector.! !

!MarsRover methodsFor: 'commands actions' stamp: 'MF 6/6/2020 17:18:41'!
rotate90DegLeft

	^orientation := orientation rotate90DegLeft.! !

!MarsRover methodsFor: 'commands actions' stamp: 'MF 6/6/2020 17:38:47'!
rotate90DegRight

	^orientation := orientation rotate90DegRight.! !


!MarsRover methodsFor: 'getters' stamp: 'MF 6/4/2020 21:39:21'!
orientation
	^orientation! !

!MarsRover methodsFor: 'getters' stamp: 'MF 6/4/2020 21:09:22'!
position
	^position! !


!classDefinition: #MarsRoverCommand category: #MarsRover!
Object subclass: #MarsRoverCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverCommand methodsFor: 'as yet unclassified' stamp: 'MF 6/8/2020 15:35:09'!
executeFor: aMarsRover
	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverCommand class' category: #MarsRover!
MarsRoverCommand class
	instanceVariableNames: ''!

!MarsRoverCommand class methodsFor: 'canHandle' stamp: 'MF 6/6/2020 19:53:27'!
canHandle: aCommandChar
	^self subclassResponsibility.! !


!MarsRoverCommand class methodsFor: 'execute' stamp: 'MF 6/8/2020 15:38:46'!
commandFor: aCommandChar
	^(self subclasses detect: [:subclass | subclass canHandle: aCommandChar]) new.! !


!classDefinition: #BackwardCommand category: #MarsRover!
MarsRoverCommand subclass: #BackwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!BackwardCommand methodsFor: 'as yet unclassified' stamp: 'MF 6/8/2020 15:35:24'!
executeFor: aMarsRover
	^aMarsRover backward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardCommand class' category: #MarsRover!
BackwardCommand class
	instanceVariableNames: ''!


!BackwardCommand class methodsFor: 'canHandle' stamp: 'MF 6/6/2020 19:52:41'!
canHandle: aCommandChar
	^aCommandChar = $b.! !


!classDefinition: #ForwardCommand category: #MarsRover!
MarsRoverCommand subclass: #ForwardCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!ForwardCommand methodsFor: 'as yet unclassified' stamp: 'MF 6/8/2020 15:35:35'!
executeFor: aMarsRover
	^aMarsRover forward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ForwardCommand class' category: #MarsRover!
ForwardCommand class
	instanceVariableNames: ''!

!ForwardCommand class methodsFor: 'canHandle' stamp: 'MF 6/6/2020 19:52:52'!
canHandle: aCommandChar
	^aCommandChar = $f.! !



!classDefinition: #Rotate90LeftCommand category: #MarsRover!
MarsRoverCommand subclass: #Rotate90LeftCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Rotate90LeftCommand methodsFor: 'as yet unclassified' stamp: 'MF 6/8/2020 15:35:56'!
executeFor: aMarsRover
	^aMarsRover rotate90DegLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rotate90LeftCommand class' category: #MarsRover!
Rotate90LeftCommand class
	instanceVariableNames: ''!

!Rotate90LeftCommand class methodsFor: 'canHandle' stamp: 'MF 6/6/2020 19:53:03'!
canHandle: aCommandChar
	^aCommandChar = $l.! !



!classDefinition: #Rotate90RightCommand category: #MarsRover!
MarsRoverCommand subclass: #Rotate90RightCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Rotate90RightCommand methodsFor: 'as yet unclassified' stamp: 'MF 6/8/2020 15:36:09'!
executeFor: aMarsRover
	^aMarsRover rotate90DegRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rotate90RightCommand class' category: #MarsRover!
Rotate90RightCommand class
	instanceVariableNames: ''!

!Rotate90RightCommand class methodsFor: 'canHandle' stamp: 'MF 6/6/2020 19:53:11'!
canHandle: aCommandChar
	^aCommandChar = $r.! !



!classDefinition: #MarsRoverDirection category: #MarsRover!
Object subclass: #MarsRoverDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverDirection methodsFor: 'comparing' stamp: 'MF 6/6/2020 17:28:49'!
= aCardinalPoint
 	^self class = aCardinalPoint class.! !


!MarsRoverDirection methodsFor: 'vector' stamp: 'MF 6/6/2020 18:05:49'!
backwardVector
	^(self forwardVector) negated.! !

!MarsRoverDirection methodsFor: 'vector' stamp: 'MF 6/6/2020 17:51:47'!
forwardVector
	^self subclassResponsibility.! !


!MarsRoverDirection methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:12:58'!
rotate90DegLeft
	^self subclassResponsibility.! !

!MarsRoverDirection methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:36:50'!
rotate90DegRight
	^self subclassResponsibility.! !


!classDefinition: #MarsRoverEastDirection category: #MarsRover!
MarsRoverDirection subclass: #MarsRoverEastDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverEastDirection methodsFor: 'vector' stamp: 'MF 6/6/2020 17:52:54'!
forwardVector
	^1@0.! !


!MarsRoverEastDirection methodsFor: 'rotate' stamp: 'MF 6/8/2020 15:45:29'!
rotate90DegLeft
	^MarsRoverNorthDirection new.! !

!MarsRoverEastDirection methodsFor: 'rotate' stamp: 'MF 6/8/2020 15:45:41'!
rotate90DegRight
	^MarsRoverSouthDirection new.! !


!classDefinition: #MarsRoverNorthDirection category: #MarsRover!
MarsRoverDirection subclass: #MarsRoverNorthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverNorthDirection methodsFor: 'rotate' stamp: 'MF 6/8/2020 15:45:54'!
rotate90DegLeft
	^MarsRoverWestDirection new! !

!MarsRoverNorthDirection methodsFor: 'rotate' stamp: 'MF 6/8/2020 15:45:04'!
rotate90DegRight
	^MarsRoverEastDirection new! !


!MarsRoverNorthDirection methodsFor: 'vector' stamp: 'MF 6/6/2020 17:53:08'!
forwardVector
	^0@1.! !


!classDefinition: #MarsRoverSouthDirection category: #MarsRover!
MarsRoverDirection subclass: #MarsRoverSouthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverSouthDirection methodsFor: 'rotate' stamp: 'MF 6/8/2020 15:45:04'!
rotate90DegLeft
	^MarsRoverEastDirection new.! !

!MarsRoverSouthDirection methodsFor: 'rotate' stamp: 'MF 6/8/2020 15:45:54'!
rotate90DegRight
	^MarsRoverWestDirection new.! !


!MarsRoverSouthDirection methodsFor: 'vector' stamp: 'MF 6/6/2020 17:53:24'!
forwardVector
	^0@-1.! !


!classDefinition: #MarsRoverWestDirection category: #MarsRover!
MarsRoverDirection subclass: #MarsRoverWestDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverWestDirection methodsFor: 'rotate' stamp: 'MF 6/8/2020 15:45:41'!
rotate90DegLeft
	^MarsRoverSouthDirection new.! !

!MarsRoverWestDirection methodsFor: 'rotate' stamp: 'MF 6/8/2020 15:45:29'!
rotate90DegRight
	^MarsRoverNorthDirection new.! !


!MarsRoverWestDirection methodsFor: 'vector' stamp: 'MF 6/6/2020 17:53:47'!
forwardVector
	^-1@0.! !


!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'north south west east'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'invalid commands' stamp: 'MF 6/6/2020 19:44:16'!
testWithInvalidCommandsShouldIgnoreItsFollowingCommands

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: north.
	commandList := 'ffkrrff'.
	
	rover excecute: commandList.
	
	self assert: 0@2 equals: rover position.
	self assert: north equals: rover orientation.! !


!MarsRoverTest methodsFor: 'forward' stamp: 'MF 6/6/2020 19:34:50'!
testMultipleForwardLookingAtNorthShouldGoNorthAccordingly

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: north.
	commandList := 'fffff'.
	
	rover excecute: commandList.
	
	self assert: 0@5 equals: rover position.
	self assert: north equals: rover orientation.! !

!MarsRoverTest methodsFor: 'forward' stamp: 'MF 6/6/2020 19:29:24'!
testSingleForwardLookingAtEastShouldGoOneEastWithSameOrientation

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: east.
	commandList := 'f'.
	
	rover excecute: commandList.
	
	self assert: 1@0 equals: rover position.
	self assert: east equals: rover orientation.! !

!MarsRoverTest methodsFor: 'forward' stamp: 'MF 6/6/2020 19:18:00'!
testSingleForwardLookingAtNorthShouldGoOneNorthWithSameOrientation

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: north.
	commandList := 'f'.
	
	rover excecute: commandList.
	
	self assert: 0@1 equals: rover position.
	self assert: north equals: rover orientation.! !

!MarsRoverTest methodsFor: 'forward' stamp: 'MF 6/6/2020 19:31:02'!
testSingleForwardLookingAtSouthShouldGoOneSouthWithSameOrientation

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: south.
	commandList := 'f'.
	
	rover excecute: commandList.
	
	self assert: 0@-1 equals: rover position.
	self assert: south equals: rover orientation.! !

!MarsRoverTest methodsFor: 'forward' stamp: 'MF 6/6/2020 19:28:57'!
testSingleForwardLookingAtWestShouldGoOneWestWithSameOrientation

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: west.
	commandList := 'f'.
	
	rover excecute: commandList.
	
	self assert: -1@0 equals: rover position.
	self assert: west equals: rover orientation.! !


!MarsRoverTest methodsFor: 'backward' stamp: 'MF 6/6/2020 19:35:22'!
testMultipleBackwardLookingAtNorthShouldGoSouthAccordingly

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: north.
	commandList := 'bbbbb'.
	
	rover excecute: commandList.
	
	self assert: 0@-5 equals: rover position.
	self assert: north equals: rover orientation.! !

!MarsRoverTest methodsFor: 'backward' stamp: 'MF 6/6/2020 19:33:48'!
testSingleBackwardLookingAtEastShouldGoOneWestWithSameOrientation

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: east.
	commandList := 'b'.
	
	rover excecute: commandList.
	
	self assert: -1@0 equals: rover position.
	self assert: east equals: rover orientation.! !

!MarsRoverTest methodsFor: 'backward' stamp: 'MF 6/6/2020 19:33:17'!
testSingleBackwardLookingAtSouthShouldGoOneNorthWithSameOrientation

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: south.
	commandList := 'b'.
	
	rover excecute: commandList.
	
	self assert: 0@1 equals: rover position.
	self assert: south equals: rover orientation.! !

!MarsRoverTest methodsFor: 'backward' stamp: 'MF 6/6/2020 19:31:52'!
testSingleBackwardLookingAtWestShouldGoOneEastWithSameOrientation

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: west.
	commandList := 'b'.
	
	rover excecute: commandList.
	
	self assert: 1@0 equals: rover position.
	self assert: west equals: rover orientation.! !

!MarsRoverTest methodsFor: 'backward' stamp: 'MF 6/6/2020 19:17:48'!
testSingleForwardLookingAtNorthShouldGoOneSouthWithSameOrientation

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: north.
	commandList := 'b'.
	
	rover excecute: commandList.
	
	self assert: 0@-1 equals: rover position.
	self assert: north equals: rover orientation.! !


!MarsRoverTest methodsFor: 'rotate left' stamp: 'MF 6/6/2020 19:36:53'!
testMultipleRotateLeftLookingAtNorthShouldLookAtCorrespondingDirection

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: north.
	commandList := 'lll'.
	
	rover excecute: commandList.
	
	self assert: 0@0 equals: rover position.
	self assert: east equals: rover orientation.! !

!MarsRoverTest methodsFor: 'rotate left' stamp: 'MF 6/6/2020 19:27:00'!
testSingleRotateLeftLookingAtEastShouldLookAtNorthWithSamePosition

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: east.
	commandList := 'l'.
	
	rover excecute: commandList.
	
	self assert: 0@0 equals: rover position.
	self assert: north equals: rover orientation.! !

!MarsRoverTest methodsFor: 'rotate left' stamp: 'MF 6/6/2020 19:26:56'!
testSingleRotateLeftLookingAtNorthShouldLookAtWestWithSamePosition

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: north.
	commandList := 'l'.
	
	rover excecute: commandList.
	
	self assert: 0@0 equals: rover position.
	self assert: west equals: rover orientation.! !

!MarsRoverTest methodsFor: 'rotate left' stamp: 'MF 6/6/2020 19:26:51'!
testSingleRotateLeftLookingAtSouthShouldLookAtEastWithSamePosition

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: south.
	commandList := 'l'.
	
	rover excecute: commandList.
	
	self assert: 0@0 equals: rover position.
	self assert: east equals: rover orientation.! !

!MarsRoverTest methodsFor: 'rotate left' stamp: 'MF 6/6/2020 19:26:42'!
testSingleRotateLeftLookingAtWestShouldLookAtSouthWithSamePosition

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: west.
	commandList := 'l'.
	
	rover excecute: commandList.
	
	self assert: 0@0 equals: rover position.
	self assert: south equals: rover orientation.! !


!MarsRoverTest methodsFor: 'rotate right' stamp: 'MF 6/6/2020 19:37:14'!
testMultipleRotateRightLookingAtNorthShouldLookAtCorrespondingDirection

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: north.
	commandList := 'rrr'.
	
	rover excecute: commandList.
	
	self assert: 0@0 equals: rover position.
	self assert: west equals: rover orientation.! !

!MarsRoverTest methodsFor: 'rotate right' stamp: 'MF 6/6/2020 19:26:29'!
testSingleRotateRightLookingAtEasthShouldLookAtSouthWithSamePosition

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: east.
	commandList := 'r'.
	
	rover excecute: commandList.
	
	self assert: 0@0 equals: rover position.
	self assert: south equals: rover orientation.! !

!MarsRoverTest methodsFor: 'rotate right' stamp: 'MF 6/6/2020 19:26:23'!
testSingleRotateRightLookingAtNorthShouldLookAtEastWithSamePosition

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: north.
	commandList := 'r'.
	
	rover excecute: commandList.
	
	self assert: 0@0 equals: rover position.
	self assert: east equals: rover orientation.! !

!MarsRoverTest methodsFor: 'rotate right' stamp: 'MF 6/6/2020 19:26:07'!
testSingleRotateRightLookingAtSouthShouldLookAtWestWithSamePosition

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: south.
	commandList := 'r'.
	
	rover excecute: commandList.
	
	self assert: 0@0 equals: rover position.
	self assert: west equals: rover orientation.! !

!MarsRoverTest methodsFor: 'rotate right' stamp: 'MF 6/6/2020 19:27:41'!
testSingleRotateRightLookingAtWestShouldLookAtNorthWithSamePosition

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: west.
	commandList := 'r'.
	
	rover excecute: commandList.
	
	self assert: 0@0 equals: rover position.
	self assert: north equals: rover orientation.! !


!MarsRoverTest methodsFor: 'mixed commands' stamp: 'MF 6/6/2020 19:38:36'!
testExecutingMixedCommandsShouldWorkProperly

	| commandList rover |
	rover := MarsRover new at: 0@0 pointingTowards: north.
	commandList := 'flbrrblf'.
	
	rover excecute: commandList.
	
	self assert: 0@2 equals: rover position.
	self assert: north equals: rover orientation.! !


!MarsRoverTest methodsFor: 'setup' stamp: 'MF 6/8/2020 15:45:54'!
setUp
	north := MarsRoverNorthDirection new.
	south := MarsRoverSouthDirection new.
	west := MarsRoverWestDirection new.
	east := MarsRoverEastDirection new.! !
