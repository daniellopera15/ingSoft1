!classDefinition: #CardinalPoint category: #MarsRover!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!CardinalPoint methodsFor: 'comparing' stamp: 'MF 6/6/2020 17:28:49'!
= aCardinalPoint
 	^self class = aCardinalPoint class.! !


!CardinalPoint methodsFor: 'vector' stamp: 'MF 6/6/2020 18:05:49'!
backwardVector
	^(self forwardVector) negated.! !

!CardinalPoint methodsFor: 'vector' stamp: 'MF 6/6/2020 17:51:47'!
forwardVector
	^self subclassResponsibility.! !


!CardinalPoint methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:12:58'!
rotate90DegLeft
	^self subclassResponsibility.! !

!CardinalPoint methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:36:50'!
rotate90DegRight
	^self subclassResponsibility.! !


!classDefinition: #East category: #MarsRover!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'vector' stamp: 'MF 6/6/2020 17:52:54'!
forwardVector
	^1@0.! !


!East methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:17:56'!
rotate90DegLeft
	^North new.! !

!East methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:37:07'!
rotate90DegRight
	^South new.! !


!classDefinition: #North category: #MarsRover!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:14:47'!
rotate90DegLeft
	^West new! !

!North methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:38:05'!
rotate90DegRight
	^East new! !


!North methodsFor: 'vector' stamp: 'MF 6/6/2020 17:53:08'!
forwardVector
	^0@1.! !


!classDefinition: #South category: #MarsRover!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:16:44'!
rotate90DegLeft
	^East new.! !

!South methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:37:42'!
rotate90DegRight
	^West new.! !


!South methodsFor: 'vector' stamp: 'MF 6/6/2020 17:53:24'!
forwardVector
	^0@-1.! !


!classDefinition: #West category: #MarsRover!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:15:25'!
rotate90DegLeft
	^South new.! !

!West methodsFor: 'rotate' stamp: 'MF 6/6/2020 17:37:56'!
rotate90DegRight
	^North new.! !


!West methodsFor: 'vector' stamp: 'MF 6/6/2020 17:53:47'!
forwardVector
	^-1@0.! !


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


!MarsRover methodsFor: 'execution' stamp: 'MF 6/6/2020 18:54:56'!
excecute: aCommandList
	aCommandList do: [ :aCommand |
		
		(self isCommandValid: aCommand) ifFalse: [^aCommand].
		
		self executeSingleCommand: aCommand.
	]
! !

!MarsRover methodsFor: 'execution' stamp: 'MF 6/6/2020 18:55:07'!
executeSingleCommand: aCommand

	(aCommand = $f) ifTrue: [
			self forward.
	].
	
	(aCommand =$b) ifTrue: [
			self backward.
	].
		
	(aCommand = $l) ifTrue: [
			self rotate90DegLeft.
	].
			
	(aCommand = $r) ifTrue: [
			self rotate90DegRight.
	].
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


!MarsRoverTest methodsFor: 'setup' stamp: 'MF 6/6/2020 17:21:29'!
setUp
	north := North new.
	south := South new.
	west := West new.
	east := East new.! !
