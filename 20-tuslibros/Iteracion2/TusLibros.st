!classDefinition: #CardTest category: #TusLibros!
TestCase subclass: #CardTest
	instanceVariableNames: 'expiredMonthOfYear nonExpiredMonthOfYear validCcn invalidCcn validCco invalidCco'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CardTest methodsFor: 'setup' stamp: 'MF 7/10/2020 16:49:05'!
setUp

	expiredMonthOfYear := GregorianMonthOfYear yearNumber: 2000 monthNumber: 10.
	nonExpiredMonthOfYear := GregorianMonthOfYear yearNumber: 3333 monthNumber: 10.
	validCcn := '0123456787654321'.
	invalidCcn := '012345678765432'.
	validCco := 'Edgar'.
	invalidCco := ''.
	! !


!CardTest methodsFor: 'tests' stamp: 'MF 7/10/2020 16:53:32'!
test01CannotCreateWithInvalidCardNumber
	
	self should: [Card withNumber: invalidCcn expiringOn: nonExpiredMonthOfYear withName: validCco.]
		raise: Error - MessageNotUnderstood
		withMessageText: Card invalidCardNumberErrorDescription.! !

!CardTest methodsFor: 'tests' stamp: 'MF 7/10/2020 16:54:08'!
test02CannotCreateWithEmptyCardName
	
	self should: [Card withNumber: validCcn expiringOn: nonExpiredMonthOfYear withName: invalidCco.]
		raise: Error - MessageNotUnderstood
		withMessageText: Card emptyCardNameErrorDescription.! !

!CardTest methodsFor: 'tests' stamp: 'MF 7/10/2020 16:54:30'!
test03OldCardShouldBeExpired
	
	self assert: (Card withNumber: validCcn expiringOn: expiredMonthOfYear withName: validCco) isExpired.! !

!CardTest methodsFor: 'tests' stamp: 'MF 7/10/2020 16:54:51'!
test04NewCardShouldNotBeExpired
	
	self deny: (Card withNumber: validCcn expiringOn: nonExpiredMonthOfYear withName: validCco) isExpired.! !


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

!CartTest methodsFor: 'tests' stamp: 'MF 7/10/2020 17:37:16'!
test09EmptyCartSubtotalShouldBeZero

	| cart |
	
	cart := self createCart.
	self assert: cart subtotal = 0.! !

!CartTest methodsFor: 'tests' stamp: 'MF 7/10/2020 17:37:53'!
test10CartWithOneItemKnowsItsSubtotal

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: cart subtotal = 10.! !

!CartTest methodsFor: 'tests' stamp: 'MF 7/10/2020 17:38:12'!
test11CartWithMoreThanOneItemKnowsItsSubtotal

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: cart subtotal = 20.! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'MF 7/10/2020 17:28:33'!
defaultCatalog
	
	| catalogue |
	
	catalogue := Dictionary new.
	catalogue at: self itemSellByTheStore put: 10.
	^ catalogue.! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'catalogue expiredCard nonExpiredCard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'setup' stamp: 'MF 7/10/2020 17:18:24'!
setUp

	| expiredMonthOfYear nonExpiredMonthOfYear |

	expiredMonthOfYear := GregorianMonthOfYear yearNumber: 2000 monthNumber: 10.
	nonExpiredMonthOfYear := GregorianMonthOfYear yearNumber: 3333 monthNumber: 10.

	expiredCard := Card withNumber: '1111111111111111' expiringOn: expiredMonthOfYear withName: 'Edgar'.
	nonExpiredCard := Card withNumber: '1111111111111111' expiringOn: nonExpiredMonthOfYear withName: 'Edgar'.
	
	catalogue := Dictionary new.
	catalogue at: 1 put: 10.! !


!CashierTest methodsFor: 'tests' stamp: 'MF 7/10/2020 18:33:10'!
assertCashierCheckoutFor: aCart and: aCard FailsWith: anErrorDescription

	| cashier salesBook |
	
	salesBook := OrderedCollection new.
	cashier := Cashier with: salesBook.
	
	self should: [cashier checkout: aCart with: aCard ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError |
			self assert: anErrorDescription equals: anError messageText.
			self assert: 0 equals: salesBook size.
			]	
	! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/10/2020 18:37:09'!
test01CannotCheckoutAnEmptyCart

	| cart |
	cart := Cart acceptingItemsOf: catalogue.

	self assertCashierCheckoutFor: cart and: nonExpiredCard 
		FailsWith: Cashier checkingOutEmptyCartErrorDescription.
	! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/10/2020 18:37:37'!
test02CannotCheckoutWithAnExpiredCard
	
	| cart isbn |
	cart := Cart acceptingItemsOf: catalogue.
	isbn := 1.
	cart add: isbn.
		
	self assertCashierCheckoutFor: cart and: expiredCard 
		FailsWith: Cashier checkingOutWithExpiredCardErrorDescription .
! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/10/2020 18:40:39'!
test03ValidCartAndCardShouldCheckoutCorrectly

	| cart cashier salesBook |
	cart := Cart acceptingItemsOf: catalogue.
	salesBook := OrderedCollection new.
	cart add: 1.
	cashier := Cashier with: salesBook.
	
	self assert: 10 equals: (cashier checkout: cart with: nonExpiredCard).
	self assert: 1 equals: salesBook size.
	self assert: 10 equals: (salesBook at: 1).
! !


!classDefinition: #Card category: #TusLibros!
Object subclass: #Card
	instanceVariableNames: 'cardNumber monthOfYearExpiration cardName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Card methodsFor: 'initialization' stamp: 'MF 7/10/2020 16:32:57'!
initializeWithNumber: aCardNumber expiringOn: aMonthOfYearExpiration withName: aCardName 
	cardNumber := aCardNumber.
	monthOfYearExpiration := aMonthOfYearExpiration.
	cardName := aCardName.! !


!Card methodsFor: 'assertions' stamp: 'MF 7/10/2020 16:41:30'!
isExpired
	| currentMonthOfYear |
		
	currentMonthOfYear := GregorianMonthOfYear current.
	
	^monthOfYearExpiration < currentMonthOfYear! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Card class' category: #TusLibros!
Card class
	instanceVariableNames: ''!

!Card class methodsFor: 'errors' stamp: 'MF 7/6/2020 20:32:19'!
emptyCardNameErrorDescription
	^'Card name cannot be empty'! !

!Card class methodsFor: 'errors' stamp: 'MF 7/6/2020 20:20:51'!
invalidCardNumberErrorDescription
	^'Card number must have 16 digits only'.! !


!Card class methodsFor: 'instance creation' stamp: 'MF 7/10/2020 16:30:28'!
withNumber: aCardNumber expiringOn: aMonthOfYearExpiration withName: aCardName 

	(aCardNumber size  ~= 16) ifTrue: [ self error: self invalidCardNumberErrorDescription ].
	
	(aCardName size = 0) ifTrue: [self error: self emptyCardNameErrorDescription ].
		
	^self new initializeWithNumber: aCardNumber expiringOn:  aMonthOfYearExpiration withName: aCardName.
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


!Cart methodsFor: 'assertions' stamp: 'MF 7/10/2020 17:24:07'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

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

!Cart methodsFor: 'queries' stamp: 'MF 7/10/2020 17:35:51'!
subtotal
	^items sum: [ :item | catalog at: item ] ifEmpty: [0].! !


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
	instanceVariableNames: 'salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'signals' stamp: 'MF 7/6/2020 19:54:40'!
signalEmptyCartCheckout

	^ self error: self class checkingOutEmptyCartErrorDescription! !

!Cashier methodsFor: 'signals' stamp: 'MF 7/10/2020 17:09:14'!
signalExpiredCardCheckout

	^ self error: self class checkingOutWithExpiredCardErrorDescription! !


!Cashier methodsFor: 'checkout' stamp: 'MF 7/10/2020 18:28:02'!
checkout: aCart with: aCard
	| subtotal |
	
	aCart isEmpty ifTrue: [ self signalEmptyCartCheckout ].
	aCard isExpired ifTrue: [ self signalExpiredCardCheckout ].
	
	subtotal := aCart subtotal.
	
	salesBook add: subtotal.
	
	^subtotal.
! !


!Cashier methodsFor: 'initialization' stamp: 'MF 7/10/2020 17:58:03'!
initializeWith: aSalesBook 
	salesBook := aSalesBook.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'errors' stamp: 'MF 7/6/2020 19:41:19'!
checkingOutEmptyCartErrorDescription
	^'Cannot checkout empty cart'.! !

!Cashier class methodsFor: 'errors' stamp: 'MF 7/10/2020 17:07:18'!
checkingOutWithExpiredCardErrorDescription
	^'cannot checkout with an expired card'.! !


!Cashier class methodsFor: 'instance creation' stamp: 'MF 7/10/2020 17:57:50'!
with: aSalesBook 
	^self new initializeWith: aSalesBook.! !
