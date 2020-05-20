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

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'DL 5/20/2020 17:51:36'!
test01
	| sentencesStack sentenceFinderByPrefix prefixToFind result |
	
	sentencesStack := OOStack new.
	sentencesStack push: 'winter is coming'.
	sentencesStack push: 'The winds of Winter'.
	sentencesStack push: 'winning is everything'.
	sentencesStack push: 'Winter is here'.
	sentenceFinderByPrefix := SentenceFinderByPrefix new initializeWithStack: sentencesStack.
	prefixToFind := 'Wint'.
		
	result := sentenceFinderByPrefix find: prefixToFind.
	
	Assert that: result size isEqualTo: 1.
	Assert that: (result at: 1) isEqualTo: 'Winter is here'.
	
	Assert that: sentencesStack pop isEqualTo: 'Winter is here'.
	Assert that: sentencesStack pop isEqualTo: 'winning is everything'.
	Assert that: sentencesStack pop isEqualTo: 'The winds of Winter'.
	Assert that: sentencesStack pop isEqualTo: 'winter is coming'.

		
	
! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topElement size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'stack operations' stamp: 'MF 5/18/2020 22:07:11'!
pop
	
	| newTope value |

	newTope := topElement getBelowElement.
	value := topElement getValue.
	
	topElement := newTope.
	size := size - 1.
	^value! !

!OOStack methodsFor: 'stack operations' stamp: 'MF 5/18/2020 18:28:12'!
push: anObject
	|newElement|

	newElement  := OOStackRealElement new initializeWith: anObject.
	size := size + 1.
	topElement addAbove: newElement.
	topElement := newElement! !


!OOStack methodsFor: 'initializing' stamp: 'MF 5/18/2020 18:54:58'!
initialize
	topElement := OOStackBaseElement new.
	size := 0! !


!OOStack methodsFor: 'checking' stamp: 'MF 5/14/2020 21:11:11'!
isEmpty
	^self size = 0.! !

!OOStack methodsFor: 'checking' stamp: 'MF 5/17/2020 15:35:56'!
size
	^size.! !


!OOStack methodsFor: 'stack query' stamp: 'MF 5/18/2020 18:19:18'!
top
	^topElement getValue.! !

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

!OOStackElement methodsFor: 'adding' stamp: 'MF 5/17/2020 15:53:37'!
addAbove: aStackElement
	aStackElement addBelow: self.
	^aStackElement! !

!OOStackElement methodsFor: 'adding' stamp: 'MF 5/17/2020 15:46:37'!
addBelow: aStackElement
	^self subclassResponsibility ! !


!OOStackElement methodsFor: 'getters' stamp: 'MF 5/18/2020 19:01:51'!
getBelowElement
	^self subclassResponsibility ! !

!OOStackElement methodsFor: 'getters' stamp: 'MF 5/17/2020 16:00:16'!
getValue
	^self subclassResponsibility ! !


!OOStackElement methodsFor: 'initializing' stamp: 'MF 5/17/2020 16:17:30'!
initializeWith: aValue
	^self subclassResponsibility! !


!classDefinition: #OOStackBaseElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackBaseElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackBaseElement methodsFor: 'initializing' stamp: 'MF 5/17/2020 16:17:46'!
initializeWith: aValue
	self error: OOStack stackEmptyErrorDescription
! !


!OOStackBaseElement methodsFor: 'adding' stamp: 'MF 5/17/2020 16:14:53'!
addBelow
	self error: OOStack stackEmptyErrorDescription
! !


!OOStackBaseElement methodsFor: 'getters' stamp: 'MF 5/18/2020 19:01:51'!
getBelowElement
	^self error: OOStack stackEmptyErrorDescription
! !

!OOStackBaseElement methodsFor: 'getters' stamp: 'MF 5/17/2020 16:15:26'!
getValue
	self error: OOStack stackEmptyErrorDescription
! !


!classDefinition: #OOStackRealElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackRealElement
	instanceVariableNames: 'value below'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackRealElement methodsFor: 'initializing' stamp: 'MF 5/17/2020 16:19:34'!
initializeWith: aValue
	value := aValue 
	! !


!OOStackRealElement methodsFor: 'getters' stamp: 'MF 5/18/2020 19:01:51'!
getBelowElement
	^below
	! !

!OOStackRealElement methodsFor: 'getters' stamp: 'MF 5/17/2020 16:15:37'!
getValue
	^value 
	! !


!OOStackRealElement methodsFor: 'adding' stamp: 'MF 5/18/2020 18:53:54'!
addBelow: aStackElement
	below := aStackElement ! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentencesStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'validation' stamp: 'DL 5/20/2020 17:59:02'!
validatePrefix: aPrefix

	self validatePrefixIsAString: aPrefix.
	self validatePrefixIsNotEmpty: aPrefix.
	self validatePrefixCannotHaveSpaces: aPrefix.! !

!SentenceFinderByPrefix methodsFor: 'validation' stamp: 'DL 5/20/2020 18:05:24'!
validatePrefixCannotHaveSpaces: aPrefix.

	( 0 < (aPrefix  indexOf: Character space)) ifTrue: [self error: self class errorMessagePrefixWithSpaces].
! !

!SentenceFinderByPrefix methodsFor: 'validation' stamp: 'DL 5/20/2020 17:58:23'!
validatePrefixIsAString: aPrefix
	
	( aPrefix isKindOf: String ) ifFalse: [self error: self class errorMessageCollaboratorIsNotAString].
! !

!SentenceFinderByPrefix methodsFor: 'validation' stamp: 'DL 5/20/2020 17:58:39'!
validatePrefixIsNotEmpty: aPrefix.

	( aPrefix isEmpty ) ifTrue: [self error: self class errorMessageEmptyPrefix].! !


!SentenceFinderByPrefix methodsFor: 'initializing' stamp: 'DL 5/20/2020 18:18:37'!
initializeWithStack: aStack

	"self validateThatStackHasSentences: aStack."
	sentencesStack  := aStack.
	
! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'DL 5/20/2020 18:35:44'!
reverseStack: stackFrom to: stackTo andDo: block

	| element |
	
	[ stackFrom isEmpty ] whileFalse: [ 
		element := stackFrom pop.
		block value: element.
		stackTo push: element.
		].
! !


!SentenceFinderByPrefix methodsFor: 'searching' stamp: 'DL 5/20/2020 18:17:55'!
find: aPrefix

	| matchesList |
	
	self validatePrefix: aPrefix.

	matchesList := self findSentencesThatStartWith: aPrefix.
	
	^matchesList
	
! !

!SentenceFinderByPrefix methodsFor: 'searching' stamp: 'DL 5/20/2020 18:39:36'!
findSentencesThatStartWith: aPrefix

	| matchesList auxiliaryStack |

	matchesList := OrderedCollection new.
	auxiliaryStack := OOStack new.
	
	self reverseStack: sentencesStack to: auxiliaryStack andDo: [:sentence | (sentence beginsWith: aPrefix) ifTrue: [matchesList addLast: sentence]].
	
	self reverseStack: auxiliaryStack to: sentencesStack andDo: [:sentence |].

	^matchesList
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MF 5/18/2020 21:47:49'!
errorMessageCollaboratorIsNotAString
	^'Collaborator must be a String instance'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MF 5/18/2020 21:44:32'!
errorMessageEmptyPrefix
	^'Prefix cannot be empty'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'MF 5/18/2020 21:44:59'!
errorMessagePrefixWithSpaces
	^'Prefix cannot have spaces'! !
