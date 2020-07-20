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

!CardTest methodsFor: 'tests' stamp: 'DL 7/14/2020 18:35:00'!
test03OldCardShouldBeExpired
	
	self assert: ((Card withNumber: validCcn expiringOn: expiredMonthOfYear withName: validCco) 
	isExpiredOn: FixedGregorianDate today).! !

!CardTest methodsFor: 'tests' stamp: 'DL 7/14/2020 18:35:30'!
test04NewCardShouldNotBeExpired
	
	self deny: ((Card withNumber: validCcn expiringOn: nonExpiredMonthOfYear withName: validCco) isExpiredOn: FixedGregorianDate today).! !


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
	instanceVariableNames: 'catalogue expiredCard nonExpiredCard todayDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'setup' stamp: 'DL 7/14/2020 18:49:24'!
setUp

	| expiredMonthOfYear nonExpiredMonthOfYear |

	expiredMonthOfYear := GregorianMonthOfYear yearNumber: 2000 monthNumber: 10.
	nonExpiredMonthOfYear := GregorianMonthOfYear yearNumber: 3333 monthNumber: 10.

	expiredCard := Card withNumber: '1111111111111111' expiringOn: expiredMonthOfYear withName: 'Edgar'.
	
	todayDate := FixedGregorianDate yearNumber: 2020 monthNumber: 07 dayNumber: 14.
	
	nonExpiredCard := Card withNumber: '1111111111111111' expiringOn: nonExpiredMonthOfYear withName: 'Edgar'.
	
	catalogue := Dictionary new.
	catalogue at: 1 put: 10.! !


!CashierTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:27:25'!
assertCashierCheckoutFor: aCart and: aCard FailsWith: anErrorDescription

	| cashier salesBook |
	
	salesBook := OrderedCollection new.
	cashier := Cashier with: salesBook with: nil with: OrderedCollection new with: MerchantProcessorSimulator new.
	
	self should: [cashier checkout: aCart with: aCard on: todayDate]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError |
			self assert: anErrorDescription equals: anError messageText.
			self assert: 0 equals: salesBook size.
			]	
	! !

!CashierTest methodsFor: 'tests' stamp: 'DL 7/14/2020 18:49:44'!
test01CannotCheckoutAnEmptyCart

	| cart |
	cart := Cart acceptingItemsOf: catalogue.

	self assertCashierCheckoutFor: cart and: nonExpiredCard 
		FailsWith: Cashier checkingOutEmptyCartErrorDescription.
	! !

!CashierTest methodsFor: 'tests' stamp: 'DL 7/14/2020 18:18:00'!
test02CannotCheckoutWithAnExpiredCard
	
	| cart isbn |
	cart := Cart acceptingItemsOf: catalogue.
	isbn := 1.
	cart add: isbn.
		
	self assertCashierCheckoutFor: cart and: expiredCard 
		FailsWith: Cashier checkingOutWithExpiredCardErrorDescription .
! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:27:25'!
test03ValidCartAndCardShouldCheckoutCorrectlyOnMerchanProcessorOkResponse

	| cart cashier salesBook internalMerchantProcessor isMerchantProcessorCalled |
	cart := Cart acceptingItemsOf: catalogue.
	salesBook := OrderedCollection new.
	cart add: 1.
	
	isMerchantProcessorCalled := false.
	internalMerchantProcessor := MerchantProcessorSimulator 
	debitingWith: [isMerchantProcessorCalled := true.].
	cashier := Cashier with: salesBook with: internalMerchantProcessor with: OrderedCollection new with: MerchantProcessorSimulator new.
	
	self assert: 10 equals: (cashier checkout: cart with: nonExpiredCard on: todayDate).
	self assert: 1 equals: salesBook size.
	self assert: 10 equals: (salesBook at: 1).
	self assert: isMerchantProcessorCalled.
! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:27:25'!
test04DoesNotFinishSaleWithStolenCard

	| cart cashier salesBook internalMerchantProcessor |
	cart := Cart acceptingItemsOf: catalogue.
	salesBook := OrderedCollection new.
	cart add: 1.
	
	internalMerchantProcessor := MerchantProcessorSimulator debitingWith: [self error: 'Cannot checkout with a stolen card.'].
	
	cashier := Cashier with: salesBook with: internalMerchantProcessor with: OrderedCollection new with: MerchantProcessorSimulator new.
	
	self should: [cashier checkout: cart with: nonExpiredCard on: todayDate] 
	raise: Error
	withExceptionDo: [:anError |
			self assert: 'Cannot checkout with a stolen card.' equals: anError messageText.
			self assert: 0 equals: salesBook size.
			].

! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:27:25'!
test05DoesNotFinishSaleWithACardWithoutEnoughFounds

	| cart cashier salesBook internalMerchantProcessor |
	cart := Cart acceptingItemsOf: catalogue.
	salesBook := OrderedCollection new.
	cart add: 1.
	
	internalMerchantProcessor := MerchantProcessorSimulator debitingWith: [self error: 'Cannot checkout with a card without enough founds.'].
	
	cashier := Cashier with: salesBook with: internalMerchantProcessor with: OrderedCollection new with: MerchantProcessorSimulator new.
	
	self should: [cashier checkout: cart with: nonExpiredCard on: FixedGregorianDate today] 
	raise: Error
	withExceptionDo: [:anError |
			self assert: 'Cannot checkout with a card without enough founds.' equals: anError messageText.
			self assert: 0 equals: salesBook size.
			].

! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:27:25'!
test06MerchantProccesorIsNotUsedIfACardIsExpired

	| cart cashier salesBook internalMerchantProcessor isMerchantProcessorCalled |
	cart := Cart acceptingItemsOf: catalogue.
	salesBook := OrderedCollection new.
	cart add: 1.
	
	isMerchantProcessorCalled := false.
	
	internalMerchantProcessor := 
	MerchantProcessorSimulator debitingWith: [isMerchantProcessorCalled := true.].
	
	cashier := Cashier with: salesBook with: internalMerchantProcessor with: OrderedCollection new with: MerchantProcessorSimulator new.
	
	self should: [cashier checkout: cart with: expiredCard on: todayDate] 
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
			self deny: isMerchantProcessorCalled].

! !


!classDefinition: #TusLibrosInterfaceTest category: #TusLibros!
TestCase subclass: #TusLibrosInterfaceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosInterfaceTest methodsFor: 'support' stamp: 'MF 7/20/2020 16:31:19'!
workingMerchantProcessor

	^MerchantProcessorSimulator debitingWith: [].! !


!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:31:39'!
test01

	| clientId password tusLibros userAuthenticationService catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | self error: 'User not authenticated'].
	
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	self 
	should: [ tusLibros createCart: clientId authenticatingWith: password. ] 
	raise: Error - MessageNotUnderstood 
	withMessageText: 'User not authenticated'.
	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:31:48'!
test02

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self assert: (tusLibros listCart: cartId) isEmpty
	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:31:56'!
test03

	| tusLibros userAuthenticationService catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.

	self should: [ tusLibros listCart: '0' ]
	raise: Error - MessageNotUnderstood
	withMessageText: 'Cart not found'.
	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:32:10'!
test04

	| clientId password tusLibros userAuthenticationService cartId cartId2 catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	cartId2 := tusLibros createCart: clientId authenticatingWith: password.

	self assert: cartId ~= cartId2.

	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:32:17'!
test05

	| tusLibros userAuthenticationService catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.

	self should: [ tusLibros add: 1 of: 1 to: '0' ]
	raise: Error - MessageNotUnderstood
	withMessageText: 'Cart not found'.

	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:32:24'!
test06

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	tusLibros add: 1 of: 1 to: cartId.

	self assert: (tusLibros listCart: cartId) includes: 1.
	self assert: 1 equals: (tusLibros listCart: cartId) size.

	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:32:31'!
test07

	| clientId password tusLibros userAuthenticationService catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | self error: 'User not authenticated'].
	
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	self 
	should: [ tusLibros listPurchases: clientId authenticatingWith: password. ] 
	raise: Error - MessageNotUnderstood 
	withMessageText: 'User not authenticated'.
	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:32:37'!
test08

	| tusLibros userAuthenticationService catalog clientId password |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.

	self should: [ tusLibros checkout: '0' with: '1111111111111111' with: '12/2020'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: 'Cart not found' equals: anError messageText.
		self assert: (tusLibros listPurchases: clientId authenticatingWith: password) isEmpty.
	].

	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:32:46'!
test09

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111A11111111' with: '12/2020'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: tusLibros class invalidCcnErrorDescription equals: anError messageText.
		self assert: (tusLibros listPurchases: clientId authenticatingWith: password) isEmpty.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:32:53'!
test10

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: '122020'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: (TusLibrosInterface invalidCcedErrorDescription) equals: anError messageText.
		self assert: (tusLibros listPurchases: clientId authenticatingWith: password) isEmpty.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:33:01'!
test11

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: '12-2020'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: (TusLibrosInterface invalidCcedErrorDescription) equals: anError messageText.
		self assert: (tusLibros listPurchases: clientId authenticatingWith: password) isEmpty.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:33:11'!
test12

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: '123/202'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: (TusLibrosInterface invalidCcedErrorDescription) equals: anError messageText.
		self assert: (tusLibros listPurchases: clientId authenticatingWith: password) isEmpty.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:33:19'!
test13

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: '12/a202'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: (TusLibrosInterface invalidCcedErrorDescription) equals: anError messageText.
		self assert: (tusLibros listPurchases: clientId authenticatingWith: password) isEmpty.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:33:26'!
test14

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: 'a1/2020'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: (TusLibrosInterface invalidCcedErrorDescription) equals: anError messageText.
		self assert: (tusLibros listPurchases: clientId authenticatingWith: password) isEmpty.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 16:33:34'!
test15

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: 'Cannot checkout empty cart' equals: anError messageText.
		self assert: (tusLibros listPurchases: clientId authenticatingWith: password) isEmpty.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 17:22:32'!
test16

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	tusLibros add: 1 of: 1 to: cartId.
	tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar'.
	
	self assert: (OrderedCollection with: 1 with: 1) equals: (tusLibros listPurchases: clientId authenticatingWith: password).
	! !

!TusLibrosInterfaceTest methodsFor: 'tests' stamp: 'MF 7/20/2020 17:32:31'!
test17

	| clientId password tusLibros userAuthenticationService cartId catalog |
	
	catalog := Dictionary new.
	catalog at: 1 put: 10.
	userAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	tusLibros := TusLibrosInterface with: userAuthenticationService with: catalog with: OrderedCollection new with: self workingMerchantProcessor.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	tusLibros add: 1 of: 1 to: cartId.
	tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar'.
	
	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar'. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
		self assert: TusLibrosInterface checkingOutCartTwiceErrorDescription equals: anError messageText.
		self assert: (OrderedCollection with: 1 with: 1) equals: (tusLibros listPurchases: clientId authenticatingWith: password).
	]	! !


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


!Card methodsFor: 'assertions' stamp: 'DL 7/14/2020 18:33:30'!
isExpiredOn: aDate 
	
	^monthOfYearExpiration < aDate monthOfYear.! !

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


!Cart methodsFor: 'as yet unclassified' stamp: 'MF 7/18/2020 17:21:46'!
listItems
	^items copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'signals' stamp: 'MF 7/6/2020 19:54:40'!
signalEmptyCartCheckout

	^ self error: self class checkingOutEmptyCartErrorDescription! !

!Cashier methodsFor: 'signals' stamp: 'MF 7/10/2020 17:09:14'!
signalExpiredCardCheckout

	^ self error: self class checkingOutWithExpiredCardErrorDescription! !


!Cashier methodsFor: 'checkout' stamp: 'DL 7/14/2020 18:25:30'!
checkout: aCart with: aCard on: aDate 
	| subtotal |
	
	aCart isEmpty ifTrue: [ self signalEmptyCartCheckout ].
	(aCard isExpiredOn: aDate) ifTrue: [ self signalExpiredCardCheckout ].
	
	subtotal := aCart subtotal.
	
	merchantProcessor debit: subtotal from: aCard.
	
	salesBook add: subtotal.
		
	^subtotal.
! !


!Cashier methodsFor: 'initialization' stamp: 'DL 7/13/2020 21:03:55'!
initializeWith: aSalesBook with: aMerchantProcessor

	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor.! !

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


!Cashier class methodsFor: 'instance creation' stamp: 'MF 7/20/2020 16:27:25'!
with: aSalesBook with: aMerchantProcessor with: salesBook with: merchantProcessor  
	
	^self new initializeWith: aSalesBook with: aMerchantProcessor.! !


!classDefinition: #MerchantProcessor category: #TusLibros!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'operations' stamp: 'DL 7/14/2020 17:55:11'!
debit: anAmount from: aCard

	self subclassResponsibility.! !


!classDefinition: #MerchantProcessorSimulator category: #TusLibros!
MerchantProcessor subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'blockToValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'MF 7/18/2020 17:16:26'!
initializeWith: aBlock with: aCatalog  

	blockToValue := aBlock.! !


!MerchantProcessorSimulator methodsFor: 'operations' stamp: 'DL 7/14/2020 17:55:29'!
debit: anAmount from: aCard

	^blockToValue value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: #TusLibros!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'as yet unclassified' stamp: 'MF 7/18/2020 17:16:26'!
debitingWith: aBlock

	^self new initializeWith: aBlock with: catalog.! !


!classDefinition: #TusLibrosInterface category: #TusLibros!
Object subclass: #TusLibrosInterface
	instanceVariableNames: 'userAuthenticator carts lastCartId catalog salesBook merchantProcessor sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosInterface methodsFor: 'initialization' stamp: 'MF 7/20/2020 16:49:17'!
initializeWith: anUserAuthenticator with: aCatalog with: aSalesBook with: aMerchantProcessor 
	userAuthenticator := anUserAuthenticator.
	catalog := aCatalog.
	
	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor.
	
	carts := Dictionary new.
	lastCartId  := 0.
	
	sales := OrderedCollection new.! !


!TusLibrosInterface methodsFor: 'interface messages' stamp: 'MF 7/18/2020 19:41:00'!
add: aQuantity of: anIsbn to: aCartId 
	self validateACartExistsFor: aCartId.	
	(carts at: aCartId) add: aQuantity of: anIsbn.! !

!TusLibrosInterface methodsFor: 'interface messages' stamp: 'MF 7/20/2020 17:38:16'!
checkout: aCartId with: aCcn with: aCced with: aCco 
	| aMonthOfYear card aCashier cart |
	self validateACartExistsFor: aCartId.
	
	self validateCardCcn: aCcn.
	aMonthOfYear := self buildMonthOfYearFrom: aCced.
	card := Card withNumber: aCcn expiringOn: aMonthOfYear withName: aCco. 
	
	cart := carts at: aCartId.
	(sales includes: cart) ifTrue: [self error: self class checkingOutCartTwiceErrorDescription].

	aCashier := Cashier with: salesBook with: merchantProcessor with: OrderedCollection new with: MerchantProcessorSimulator new.
	aCashier checkout: cart with: card on: FixedGregorianDate today. 
	
	sales add: cart.
! !

!TusLibrosInterface methodsFor: 'interface messages' stamp: 'MF 7/18/2020 17:11:08'!
createCart: aClientId authenticatingWith: aPassword 
	
	| newCartId |
	userAuthenticator authenticate: aClientId with: aPassword.
	
	newCartId := lastCartId + 1.
	lastCartId  := newCartId.
	
	carts at: newCartId put: (Cart acceptingItemsOf: catalog).
	^newCartId.! !

!TusLibrosInterface methodsFor: 'interface messages' stamp: 'MF 7/18/2020 19:41:26'!
listCart: aCartId 
	self validateACartExistsFor: aCartId.
	^(carts at: aCartId) listItems.! !

!TusLibrosInterface methodsFor: 'interface messages' stamp: 'MF 7/20/2020 17:39:33'!
listPurchases: aClientId authenticatingWith: aPassword 

	| allItemsSold |
	userAuthenticator authenticate: aClientId with: aPassword.
	
	allItemsSold := sales inject: OrderedCollection new into: [:acc :cart | acc addAll: cart listItems].
	^allItemsSold asSet inject: OrderedCollection new into: [:acc :item | acc add: item. acc add: (allItemsSold count: [:soldItem | soldItem == item]). acc]! !


!TusLibrosInterface methodsFor: 'signals' stamp: 'MF 7/18/2020 19:36:50'!
signalCartNotFound

	^ self error: self class cartNotFoundErrorDescription! !

!TusLibrosInterface methodsFor: 'signals' stamp: 'MF 7/18/2020 18:52:04'!
signalInvalidCced

	^ self error: self class invalidCcedErrorDescription! !

!TusLibrosInterface methodsFor: 'signals' stamp: 'MF 7/18/2020 18:52:18'!
signalInvalidCcn

	^ self error: self class invalidCcnErrorDescription! !


!TusLibrosInterface methodsFor: 'Card data operations' stamp: 'MF 7/20/2020 16:05:23'!
buildMonthOfYearFrom: aCced

	('##/####' match: aCced) ifFalse: [ self signalInvalidCced ].
	
	[ ^GregorianMonthOfYear yearNumber: (aCced copyFrom: 4 to: 7) asNumber monthNumber: (aCced copyFrom: 1 to: 2) asNumber ]
		on: Error
		do: [ self signalInvalidCced ].! !

!TusLibrosInterface methodsFor: 'Card data operations' stamp: 'MF 7/18/2020 18:52:18'!
validateCardCcn: aCcn

	^ (aCcn allSatisfy: [:aCcnChar | aCcnChar isDigit ]) ifFalse: [ self signalInvalidCcn ]! !


!TusLibrosInterface methodsFor: 'assertions' stamp: 'MF 7/18/2020 19:41:00'!
validateACartExistsFor: aCartId

	^ (carts includesKey: aCartId) ifFalse: [ self signalCartNotFound ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosInterface class' category: #TusLibros!
TusLibrosInterface class
	instanceVariableNames: ''!

!TusLibrosInterface class methodsFor: 'as yet unclassified' stamp: 'MF 7/16/2020 20:02:35'!
cartNotFoundErrorDescription
	^'Cart not found'.! !

!TusLibrosInterface class methodsFor: 'as yet unclassified' stamp: 'MF 7/20/2020 17:40:05'!
checkingOutCartTwiceErrorDescription
	^'cannot check out a cart twice'.! !

!TusLibrosInterface class methodsFor: 'as yet unclassified' stamp: 'MF 7/18/2020 18:34:50'!
invalidCcedErrorDescription
	^'Expiration date does not conform to MM/YYYY format'.! !

!TusLibrosInterface class methodsFor: 'as yet unclassified' stamp: 'MF 7/18/2020 17:51:57'!
invalidCcnErrorDescription
	^'ccn can only have digits'.! !

!TusLibrosInterface class methodsFor: 'as yet unclassified' stamp: 'MF 7/20/2020 16:27:37'!
with: anUserAuthenticationServiceSimulator with: aCatalog with: aSalesBook with: aMerchantProcessor  
	^self new initializeWith: anUserAuthenticationServiceSimulator with: aCatalog with: aSalesBook with: aMerchantProcessor.! !


!classDefinition: #UserAuthenticationService category: #TusLibros!
Object subclass: #UserAuthenticationService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!classDefinition: #UserAuthenticationServiceSimulator category: #TusLibros!
UserAuthenticationService subclass: #UserAuthenticationServiceSimulator
	instanceVariableNames: 'blockClosure authenticateBehaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UserAuthenticationServiceSimulator methodsFor: 'initialization' stamp: 'MF 7/18/2020 17:16:26'!
initializeWith: aBlock with: aCatalog  
	authenticateBehaviour := aBlock.! !


!UserAuthenticationServiceSimulator methodsFor: 'as yet unclassified' stamp: 'MF 7/16/2020 19:29:37'!
authenticate: aClientId with: aPassword
	^authenticateBehaviour value: aClientId value: aPassword.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UserAuthenticationServiceSimulator class' category: #TusLibros!
UserAuthenticationServiceSimulator class
	instanceVariableNames: ''!

!UserAuthenticationServiceSimulator class methodsFor: 'as yet unclassified' stamp: 'MF 7/18/2020 17:16:26'!
authenticatingWith: aBlockClosure 
	^self new initializeWith: aBlockClosure with: catalog.! !
