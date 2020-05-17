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
	instanceVariableNames: 'tope size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 15:35:48'!
initialize
	tope := OOStackNullElement new.
	size := 0! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 5/14/2020 21:11:11'!
isEmpty
	^self size = 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 16:33:23'!
pop
	
	| newTope value |

	newTope := tope dameElDeAbajo.
	value := tope getValue.
	
	tope := newTope.
	size := size - 1.
	^value! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 16:26:52'!
push: anObject
	|newElement|

	newElement  := OOStackRealElement new initializeWith: anObject.
	size := size + 1.
	tope addAbove: newElement.
	tope := newElement! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 15:35:56'!
size
	^size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 15:38:14'!
top
	^tope getValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackElement category: #'Stack-Exercise'!
Object subclass: #OOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 15:53:37'!
addAbove: aStackElement
	aStackElement addBelow: self.
	^aStackElement! !

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 15:46:37'!
addBelow: aStackElement
	^self subclassResponsibility ! !

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 15:58:37'!
dameElDeAbajo
	^self subclassResponsibility ! !

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 16:00:16'!
getValue
	^self subclassResponsibility ! !

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 16:17:30'!
initializeWith: aValue
	^self subclassResponsibility! !


!classDefinition: #OOStackNullElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackNullElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNullElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 16:14:53'!
addBelow
	self error: OOStack stackEmptyErrorDescription
! !

!OOStackNullElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 16:09:17'!
dameElDeAbajo
	self error: OOStack stackEmptyErrorDescription
! !

!OOStackNullElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 16:15:26'!
getValue
	self error: OOStack stackEmptyErrorDescription
! !

!OOStackNullElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 16:17:46'!
initializeWith: aValue
	self error: OOStack stackEmptyErrorDescription
! !


!classDefinition: #OOStackRealElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackRealElement
	instanceVariableNames: 'value abajo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackRealElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 15:48:00'!
addBelow: aStackElement
	abajo := aStackElement ! !

!OOStackRealElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 15:58:16'!
dameElDeAbajo
	^abajo
	! !

!OOStackRealElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 16:15:37'!
getValue
	^value 
	! !

!OOStackRealElement methodsFor: 'as yet unclassified' stamp: 'MF 5/17/2020 16:19:34'!
initializeWith: aValue
	value := aValue 
	! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
