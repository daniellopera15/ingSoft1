!classDefinition: #CardTest category: #TusLibros!
TestCase subclass: #CardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CardTest methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:21:58'!
test01
	
	
	| cced ccn cco |
	ccn := '012345A678765432'.
	cced := '12/2000'.
	cco := 'Nombre'.
	
	self should: [Card withNumber: ccn expiringOn: cced withName: cco.]
		raise: Error - MessageNotUnderstood
		withMessageText: Card invalidCardNumberErrorDescription.! !

!CardTest methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:29:58'!
test02
	
	
	| cced ccn cco |
	ccn := '012345678765432'.
	cced := '12/2000'.
	cco := 'Nombre'.
	
	self should: [Card withNumber: ccn expiringOn: cced withName: cco.]
		raise: Error - MessageNotUnderstood
		withMessageText: Card invalidCardNumberErrorDescription.! !

!CardTest methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:45:40'!
test03
	
	
	| cced ccn cco |
	ccn := '0123456787654321'.
	cced := '122000'.
	cco := ''.
	
	self should: [Card withNumber: ccn expiringOn: cced withName: cco.]
		raise: Error - MessageNotUnderstood
		withMessageText: Card emptyCardNameErrorDescription.! !

!CardTest methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:42:47'!
test04
	
	
	| cced ccn cco |
	ccn := '0123456787654321'.
	cced := '1A2000'.
	cco := 'Edgar'.
	
	self should: [Card withNumber: ccn expiringOn: cced withName: cco.]
		raise: Error - MessageNotUnderstood
		withMessageText: Card invalidMonthOfYearErrorDescription.! !

!CardTest methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:46:06'!
test05
	
	
	| cced ccn cco |
	ccn := '0123456787654321'.
	cced := '12000'.
	cco := 'Edgar'.
	
	self should: [Card withNumber: ccn expiringOn: cced withName: cco.]
		raise: Error - MessageNotUnderstood
		withMessageText: Card invalidMonthOfYearErrorDescription.! !

!CardTest methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:49:37'!
test06
	
	| cced ccn cco |
	ccn := '0123456787654321'.
	cced := '122000'.
	cco := 'Edgar'.
	
	self assert: (Card withNumber: ccn expiringOn: cced withName: cco) isExpired.! !

!CardTest methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:50:43'!
test07
	
	| cced ccn cco |
	ccn := '0123456787654321'.
	cced := '129999'.
	cco := 'Edgar'.
	
	self deny: (Card withNumber: ccn expiringOn: cced withName: cco) isExpired.! !


!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
defaultCatalog
	
	^ Array with: self itemSellByTheStore! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!CashierTest methodsFor: 'tests' stamp: 'MF 7/6/2020 19:39:04'!
test01

	| cart cashier cced ccn cco |
	cart := Cart acceptingItemsOf: (OrderedCollection with: 1).
	cashier := Cashier new.
	ccn := 1.
	cced := 121234.
	cco := 'Nombre'.
	
	self should: [cashier checkout: cart with: ccn expiringOn: cced from: cco]
		raise: Error - MessageNotUnderstood 
		withMessageText: Cashier checkingOutEmptyCartErrorDescription.	
	! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/6/2020 19:57:43'!
test02

	| cart cashier cced ccn cco isbn |
	cart := Cart acceptingItemsOf: (OrderedCollection with: 1).
	isbn := 1.
	cart add: isbn.
	cashier := Cashier new.
	ccn := 1.
	cced := 121234.
	cco := 'Nombre'.
	
	self assert: 0 equals: (cashier checkout: cart with: ccn expiringOn: cced from: cco).	! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/6/2020 19:55:48'!
test03
	
	| cart cashier cced ccn cco isbn |
	cart := Cart acceptingItemsOf: (OrderedCollection with: 1).
	isbn := 1.
	cart add: isbn.
	cashier := Cashier new.
	ccn := 'Edgar'.
	cced := 121234.
	cco := 'Nombre'.
	
	self should: [cashier checkout: cart with: ccn expiringOn: cced from: cco]
		raise: Error - MessageNotUnderstood 
		withMessageText: Cashier checkingOutWithInvalidCardNumberErrorDescription.	
! !


!classDefinition: #Card category: #TusLibros!
Object subclass: #Card
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Card class' category: #TusLibros!
Card class
	instanceVariableNames: ''!

!Card class methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:32:19'!
emptyCardNameErrorDescription
	^'Card name cannot be empty'! !

!Card class methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:20:51'!
invalidCardNumberErrorDescription
	^'Card number must have 16 digits only'.! !

!Card class methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:43:20'!
invalidMonthOfYearErrorDescription
	^'Month of year can only contain 6 digits'! !

!Card class methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:49:59'!
isExpired
	^true! !

!Card class methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 20:53:42'!
withNumber: aCardNumberAsString expiringOn: aCardExpirationDateAsString withName: aCardName 
	| aMonthOfYearExpiration |
	(aCardNumberAsString anySatisfy: [:aChar | aChar < $0 or: [aChar > $9]]) ifTrue: [ self error: self invalidCardNumberErrorDescription ].
	(aCardNumberAsString size  ~= 16) ifTrue: [ self error: self invalidCardNumberErrorDescription ].
	
	(aCardExpirationDateAsString anySatisfy: [ :aChar | aChar < $0 or: [aChar > $9] ]) ifTrue: [ self error: self invalidMonthOfYearErrorDescription ].
	(aCardExpirationDateAsString size ~= 6) ifTrue: [self error: self invalidMonthOfYearErrorDescription ].
	
	(aCardName size = 0) ifTrue: [self error: self emptyCardNameErrorDescription ].
	
	aMonthOfYearExpiration := GregorianMonthOfYear yearNumber: 1 monthNumber: 1.
	
	^self new initializeWithNumber: aCardNumberAsString expiringOn:  aMonthOfYearExpiration withName: aCardName.
	! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidItem: anItem

	(catalog includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 19:57:14'!
checkout: aCart with: aCardNumber expiringOn: aCardExpirationDate from: aCardName 
	aCart isEmpty ifTrue: [ self signalEmptyCartCheckout ].
	(aCardNumber isKindOf: Integer) ifFalse: [ self error: self class checkingOutWithInvalidCardNumberErrorDescription ].
	
	^0.
	
	! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 19:54:40'!
signalEmptyCartCheckout

	^ self error: self class checkingOutEmptyCartErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 19:41:19'!
checkingOutEmptyCartErrorDescription
	^'Cannot checkout empty cart'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'MF 7/6/2020 19:47:17'!
checkingOutWithInvalidCardNumberErrorDescription
	^'Cannot checkout with an invalid card number'.! !
