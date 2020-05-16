!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 5/14/2020 21:00:30'!
initializeStack
	stack := OrderedCollection new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:39:03'!
isEmpty

	^self size = 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:34:45'!
pop

	^(OOStack subclasses detect: [:aClass | aClass isEmpty: stack]) pop: stack.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:19:41'!
push: anObject

	stack addLast: anObject.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:37:06'!
size

	^stack size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:37:18'!
top

	^(self class subclasses detect: [:aClass | aClass isEmpty: stack]) top: stack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'MF 5/14/2020 20:59:33'!
new
	^self basicNew initializeStack! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #EmptyStack category: #'Stack-Exercise'!
OOStack subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: #'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:30:55'!
isEmpty: stack

	^stack size = 0.! !

!EmptyStack class methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:35:25'!
pop: stack

	^self error: OOStack stackEmptyErrorDescription.! !

!EmptyStack class methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:35:54'!
top: stack

	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #FilledStack category: #'Stack-Exercise'!
OOStack subclass: #FilledStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledStack class' category: #'Stack-Exercise'!
FilledStack class
	instanceVariableNames: ''!

!FilledStack class methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:33:21'!
isEmpty: stack

	^stack size ~= 0.! !

!FilledStack class methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:33:42'!
pop: stack

	^stack removeLast.! !

!FilledStack class methodsFor: 'as yet unclassified' stamp: 'DL 5/16/2020 20:36:15'!
top: stack

	^stack last.! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
