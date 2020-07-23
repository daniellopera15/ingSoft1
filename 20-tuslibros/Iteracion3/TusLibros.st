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


!CashierTest methodsFor: 'tests' stamp: 'MF 7/23/2020 13:49:09'!
assertCashierCheckoutFor: aCart and: aCard FailsWith: anErrorDescription

	| cashier salesBook |
	
	salesBook := OrderedCollection new.
	cashier := Cashier registeringSalesOn: salesBook debitingWith: nil.
	
	self should: [cashier checkout: aCart from: 1 with: aCard on: todayDate]
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

!CashierTest methodsFor: 'tests' stamp: 'MF 7/23/2020 13:49:09'!
test03ValidCartAndCardShouldCheckoutCorrectlyOnMerchanProcessorOkResponse

	| cart cashier salesBook internalMerchantProcessor isMerchantProcessorCalled clientId |
	cart := Cart acceptingItemsOf: catalogue.
	salesBook := OrderedCollection new.
	cart add: 1.
	clientId := '1'.
	
	isMerchantProcessorCalled := false.
	internalMerchantProcessor := MerchantProcessorSimulator 
	debitingWith: [isMerchantProcessorCalled := true.].
	cashier := Cashier registeringSalesOn: salesBook debitingWith: internalMerchantProcessor.
	
	self assert: 10 equals: (cashier checkout: cart from: clientId with: nonExpiredCard on: todayDate).
	self assert: 1 equals: salesBook size.
	self assert: ((salesBook at: 1) wasMadeTo: '1').
	self assert: 10 equals: (salesBook at: 1) subtotal.
	self assert: isMerchantProcessorCalled.
! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/23/2020 13:49:09'!
test04DoesNotFinishSaleWithStolenCard

	| cart cashier salesBook internalMerchantProcessor |
	cart := Cart acceptingItemsOf: catalogue.
	salesBook := OrderedCollection new.
	cart add: 1.
	
	internalMerchantProcessor := MerchantProcessorSimulator debitingWith: [self error: 'Cannot checkout with a stolen card.'].
	
	cashier := Cashier registeringSalesOn: salesBook debitingWith: internalMerchantProcessor.
	
	self should: [cashier checkout: cart from: 1 with: nonExpiredCard on: todayDate] 
	raise: Error
	withExceptionDo: [:anError |
			self assert: 'Cannot checkout with a stolen card.' equals: anError messageText.
			self assert: 0 equals: salesBook size.
			].

! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/23/2020 13:49:09'!
test05DoesNotFinishSaleWithACardWithoutEnoughFounds

	| cart cashier salesBook internalMerchantProcessor |
	cart := Cart acceptingItemsOf: catalogue.
	salesBook := OrderedCollection new.
	cart add: 1.
	
	internalMerchantProcessor := MerchantProcessorSimulator debitingWith: [self error: 'Cannot checkout with a card without enough founds.'].
	
	cashier := Cashier registeringSalesOn: salesBook debitingWith: internalMerchantProcessor.
	
	self should: [cashier checkout: cart from: 1 with: nonExpiredCard on: FixedGregorianDate today] 
	raise: Error
	withExceptionDo: [:anError |
			self assert: 'Cannot checkout with a card without enough founds.' equals: anError messageText.
			self assert: 0 equals: salesBook size.
			].

! !

!CashierTest methodsFor: 'tests' stamp: 'MF 7/23/2020 13:49:09'!
test06MerchantProccesorIsNotUsedIfACardIsExpired

	| cart cashier salesBook internalMerchantProcessor isMerchantProcessorCalled |
	cart := Cart acceptingItemsOf: catalogue.
	salesBook := OrderedCollection new.
	cart add: 1.
	
	isMerchantProcessorCalled := false.
	
	internalMerchantProcessor := 
	MerchantProcessorSimulator debitingWith: [isMerchantProcessorCalled := true.].
	
	cashier := Cashier registeringSalesOn: salesBook debitingWith: internalMerchantProcessor.
	
	self should: [cashier checkout: cart from: 1 with: expiredCard on: todayDate] 
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
			self deny: isMerchantProcessorCalled].

! !


!classDefinition: #TusLibrosInterfaceTest category: #TusLibros!
TestCase subclass: #TusLibrosInterfaceTest
	instanceVariableNames: 'workingMerchantProcessor interfaceCatalog blockingUserAuthenticationService workingUserAuthenticationService product1 product1Price clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosInterfaceTest methodsFor: 'support' stamp: 'DL 7/21/2020 20:31:57'!
assert: aClient withPassword: aPassword boughtAQuantityOf: anAmountOfProduct1 on: aTusLibrosInterface 

	self assert: anAmountOfProduct1 equals: (((aTusLibrosInterface listPurchases: aClient authenticatingWith: aPassword) at: 'purchasesItems') occurrencesOf: product1).
	
	self assert: product1Price*anAmountOfProduct1 equals: ((aTusLibrosInterface listPurchases: aClient authenticatingWith: aPassword) at: 'totalPrice').
	! !


!TusLibrosInterfaceTest methodsFor: 'tests - create cart' stamp: 'MF 7/23/2020 13:45:09'!
test01cannotCreateCartAnUserNotAuthenticated

	| clientId password tusLibros |
	
	tusLibros := TusLibrosInterface authenticatingWith: blockingUserAuthenticationService acceptingItemsFrom: interfaceCatalog registeringSalesOn: OrderedCollection new debitingWith: workingMerchantProcessor measuringTimeWith: clock.
	clientId := '1'.
	password := '1234'.
	
	self 
	should: [ tusLibros createCart: clientId authenticatingWith: password. ] 
	raise: Error - MessageNotUnderstood 
	withMessageText: 'User not authenticated'.
	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - create cart' stamp: 'MF 7/23/2020 13:06:11'!
test06cartsAreCreatedEmpty

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self assert: (tusLibros listCart: cartId) isEmpty
	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - create cart' stamp: 'MF 7/23/2020 13:06:57'!
test07canCreateMoreThenOneCart

	| clientId password tusLibros cartId cartId2 |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	cartId2 := tusLibros createCart: clientId authenticatingWith: password.

	self assert: cartId ~= cartId2.

	
	! !


!TusLibrosInterfaceTest methodsFor: 'tests - list purchases' stamp: 'MF 7/23/2020 13:45:09'!
test02cannotListPurchasesWhenUserIsNotAuthenticated

	| clientId password tusLibros |
	
	tusLibros := TusLibrosInterface authenticatingWith: blockingUserAuthenticationService acceptingItemsFrom: interfaceCatalog registeringSalesOn: OrderedCollection new debitingWith: workingMerchantProcessor measuringTimeWith: clock.
	clientId := '1'.
	password := '1234'.
	
	self 
	should: [ tusLibros listPurchases: clientId authenticatingWith: password. ] 
	raise: Error - MessageNotUnderstood 
	withMessageText: 'User not authenticated'.
	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - list purchases' stamp: 'MF 7/23/2020 13:39:28'!
test15ListingPurchasesOfClientWithoutPurchasesShouldBeEmpty

	| clientId password tusLibros |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	tusLibros createCart: clientId authenticatingWith: password.
	
	self assert: ((tusLibros listPurchases: clientId authenticatingWith: password) at: 'purchasesItems') isEmpty.
	self assert: 0 equals: ((tusLibros listPurchases: clientId authenticatingWith: password) at: 'totalPrice').
! !

!TusLibrosInterfaceTest methodsFor: 'tests - list purchases' stamp: 'MF 7/23/2020 13:39:36'!
test16whenClientBoughtCartItShouldAppearWhenListingPurchases

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	tusLibros add: 1 of: product1 to: cartId.
	tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar'.
	
	self assert: clientId withPassword: password boughtAQuantityOf: 1 on: tusLibros.
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - list purchases' stamp: 'MF 7/23/2020 13:39:45'!
test17allPurchasesFromClientMustBeListed

	| clientId password tusLibros cartId1 cartId2 clientPurchases |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId1 := tusLibros createCart: clientId authenticatingWith: password.
	cartId2 := tusLibros createCart: clientId authenticatingWith: password.
	tusLibros add: 1 of: product1 to: cartId1.
	tusLibros add: 1 of: product1 to: cartId2.
	tusLibros checkout: cartId1 with: '1111111111111111' with: '12/2030'  with: 'Edgar'.
	tusLibros checkout: cartId2 with: '1111111111111111' with: '12/2030'  with: 'Edgar'.
	
	clientPurchases := tusLibros listPurchases: clientId authenticatingWith: password.
	
	self assert: clientId withPassword: password boughtAQuantityOf: 2 on: tusLibros.
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - list purchases' stamp: 'MF 7/23/2020 13:39:54'!
test18shouldListPurchasesByClient

	| tusLibros cartId1 cartId2 clientId1 clientId2 password1 password2 |
	
	tusLibros := self buildInterface.
	clientId1 := '1'.
	password1 := '1234'.
	
	clientId2 := '2'.
	password2 := '5678'.
	
	cartId1 := tusLibros createCart: clientId1 authenticatingWith: password1.
	cartId2 := tusLibros createCart: clientId2 authenticatingWith: password2.
	tusLibros add: 2 of: product1 to: cartId1.
	tusLibros add: 1 of: product1 to: cartId2.
	tusLibros checkout: cartId1 with: '1111111111111111' with: '12/2030'  with: 'Edgar'.
	tusLibros checkout: cartId2 with: '2222222222222222' with: '12/2020'  with: 'Jose'.
	
	self assert: clientId1 withPassword: password1 boughtAQuantityOf: 2 on: tusLibros.
	self assert: clientId2 withPassword: password2 boughtAQuantityOf: 1 on: tusLibros.
! !


!TusLibrosInterfaceTest methodsFor: 'tests - checkout' stamp: 'DL 7/22/2020 21:12:29'!
test05cannotCheckoutWithACartNotcreated

	| tusLibros clientId password |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.

	self should: [ tusLibros checkout: '0' with: '1111111111111111' with: '12/2020'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: TusLibrosInterface activeCartNotFoundErrorDescription equals: anError messageText.
		self assert: clientId withPassword: password boughtAQuantityOf: 0 on: tusLibros
	].

	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - checkout' stamp: 'MF 7/23/2020 13:10:49'!
test09cannotCheckoutWithNonDigitsOnlyCcn

	| clientId password tusLibros cartId  |
	
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111A11111111' with: '12/2020'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: tusLibros class invalidCcnErrorDescription equals: anError messageText.
		self assert: clientId withPassword: password boughtAQuantityOf: 0 on: tusLibros.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - checkout' stamp: 'MF 7/23/2020 13:15:06'!
test10cannotCheckoutWhenCcedDoesNotHaveSeparator

	| clientId password tusLibros cartId  |
	
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: '122020'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: (TusLibrosInterface invalidCcedErrorDescription) equals: anError messageText.
		self assert: clientId withPassword: password boughtAQuantityOf: 0 on: tusLibros.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - checkout' stamp: 'MF 7/23/2020 13:15:57'!
test11ShouldFailWhenUseCcedWithNoDigitInYear

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: '12/a202'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: (TusLibrosInterface invalidCcedErrorDescription) equals: anError messageText.
		self assert: clientId withPassword: password boughtAQuantityOf: 0 on: tusLibros.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - checkout' stamp: 'MF 7/23/2020 13:39:04'!
test12cannotCheckoutWithExpiredCard

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	tusLibros add: 1 of: product1 to: cartId.
	
	self should: [tusLibros checkout: cartId with: '1111111111111111' with: '12/1990'  with: 'Edgar'.]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError | 
		self assert: Cashier checkingOutWithExpiredCardErrorDescription equals: anError messageText.
		self assert: clientId withPassword: password boughtAQuantityOf: 0 on: tusLibros.
		
		]! !

!TusLibrosInterfaceTest methodsFor: 'tests - checkout' stamp: 'MF 7/23/2020 13:39:13'!
test13cannotCheckoutEmptyCart

	| clientId password tusLibros cartId |

	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar' ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [:anError |
		self assert: Cashier checkingOutEmptyCartErrorDescription equals: anError messageText.
		self assert: clientId withPassword: password boughtAQuantityOf: 0 on: tusLibros.
	].	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - checkout' stamp: 'MF 7/23/2020 13:39:22'!
test14cannotCheckoutTwiceWithSameCart

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	tusLibros add: 1 of: product1 to: cartId.
	tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar'.
	
	self should: [ tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar'. ]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
		self assert: TusLibrosInterface activeCartNotFoundErrorDescription equals: anError messageText.
		self assert: clientId withPassword: password boughtAQuantityOf: 1 on: tusLibros.
	]	! !


!TusLibrosInterfaceTest methodsFor: 'tests - add to cart' stamp: 'DL 7/22/2020 22:11:57'!
test04cannotAddItemToCartWhenCartNotCreated

	| tusLibros  |
	
	tusLibros := self buildInterface.

	self should: [ tusLibros add: 1 of: product1 to: Object new ]
	raise: Error - MessageNotUnderstood
	withMessageText: TusLibrosInterface activeCartNotFoundErrorDescription.

	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - add to cart' stamp: 'MF 7/23/2020 13:08:50'!
test08addItemToCartMustHaveThatItem

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.

	tusLibros add: 1 of: product1 to: cartId.

	self assert: (tusLibros listCart: cartId) includes: 1.
	self assert: 1 equals: (tusLibros listCart: cartId) size.

	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - add to cart' stamp: 'MF 7/23/2020 13:40:01'!
test19cannotAddItemsToCheckedOutCart

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	tusLibros add: 1 of: product1 to: cartId.
	tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar'.
	
	self should: [tusLibros add: 1 of: product1 to: cartId.]
	raise: Error - MessageNotUnderstood
	withMessageText: TusLibrosInterface activeCartNotFoundErrorDescription.! !


!TusLibrosInterfaceTest methodsFor: 'tests - list cart' stamp: 'DL 7/22/2020 21:02:50'!
test03cannotListCartWhenCartNotCreated

	| tusLibros |
	
	tusLibros := self buildInterface.

	self should: [ tusLibros listCart: Object new ]
	raise: Error - MessageNotUnderstood
	withMessageText: TusLibrosInterface activeCartNotFoundErrorDescription.
	
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - list cart' stamp: 'MF 7/23/2020 13:40:08'!
test20CannotListCheckedOutCart

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	tusLibros add: 1 of: product1 to: cartId.
	tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar'.
	
	self should: [tusLibros listCart: cartId.]
	raise: Error - MessageNotUnderstood
	withMessageText: TusLibrosInterface activeCartNotFoundErrorDescription.! !


!TusLibrosInterfaceTest methodsFor: 'tests - cart session' stamp: 'MF 7/23/2020 13:40:19'!
test21cannotAddItemWhenSessionExpired

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	
	clock advanceTime: (30 minutes + 1 seconds).
	
	self should: [tusLibros add: 1 of: product1 to: cartId.]
	raise: Error - MessageNotUnderstood
	withMessageText: [TusLibrosInterface sessionExpiredErrorDescription].
	
	clock rewindTime: (30 minutes + 1 seconds).
	(tusLibros listCart: cartId) isEmpty. 
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - cart session' stamp: 'MF 7/23/2020 13:40:26'!
test22cannotListCartWhenSessionExpired

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	
	clock advanceTime: (30 minutes + 1 seconds).
	
	self should: [tusLibros listCart: cartId.]
	raise: Error - MessageNotUnderstood
	withMessageText: [TusLibrosInterface sessionExpiredErrorDescription].
	
	clock rewindTime: (30 minutes + 1 seconds).
	(tusLibros listCart: cartId) isEmpty. 
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - cart session' stamp: 'MF 7/23/2020 13:40:34'!
test23cannotCheckOutCartWhenSessionExpired

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	
	clock advanceTime: (30 minutes + 1 seconds).
	
	self should: [tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar'.]
	raise: Error - MessageNotUnderstood
	withMessageText: [TusLibrosInterface sessionExpiredErrorDescription].
	
	clock rewindTime: (30 minutes + 1 seconds).
	(tusLibros listCart: cartId) isEmpty. 
	! !

!TusLibrosInterfaceTest methodsFor: 'tests - cart session' stamp: 'MF 7/23/2020 13:40:40'!
test24cartSessionTimeToLiveGetsExtendedAfterUsingCart

	| clientId password tusLibros cartId |
	
	tusLibros := self buildInterface.
	clientId := '1'.
	password := '1234'.
	
	cartId := tusLibros createCart: clientId authenticatingWith: password.
	
	clock advanceTime: (25 minutes).
	
	tusLibros add: 1 of: product1 to: cartId. 
	
	clock advanceTime: (10 minutes).
	
	tusLibros checkout: cartId with: '1111111111111111' with: '12/2030'  with: 'Edgar'.
	
	self assert: clientId withPassword: password boughtAQuantityOf: 1 on: tusLibros.
	
	
	
	! !


!TusLibrosInterfaceTest methodsFor: 'setup' stamp: 'MF 7/23/2020 13:45:09'!
buildInterface

	^ TusLibrosInterface authenticatingWith: workingUserAuthenticationService acceptingItemsFrom: interfaceCatalog registeringSalesOn: OrderedCollection new debitingWith: workingMerchantProcessor measuringTimeWith: clock! !

!TusLibrosInterfaceTest methodsFor: 'setup' stamp: 'DL 7/21/2020 21:33:58'!
setUp

	workingMerchantProcessor := MerchantProcessorSimulator debitingWith: [].
	
	blockingUserAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | self error: 'User not authenticated'].
	
	workingUserAuthenticationService := UserAuthenticationServiceSimulator authenticatingWith: [:id :pass | true].
	
	product1 := 1.
	product1Price := 10.
	
	interfaceCatalog := Dictionary new.
	interfaceCatalog at: product1 put: product1Price.
	
	clock := ClockSimulator startingOn: (January,2020 onOrLast: 1).! !


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


!Cart methodsFor: 'initialization' stamp: 'DL 7/20/2020 20:12:09'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := Bag new.! !


!Cart methodsFor: 'queries' stamp: 'MF 7/18/2020 17:21:46'!
listItems
	^items copy.! !

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

!Cart methodsFor: 'adding' stamp: 'DL 7/20/2020 20:14:05'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	items add: anItem withOccurrences: aQuantity.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #CartSession category: #TusLibros!
Object subclass: #CartSession
	instanceVariableNames: 'cart lastTimeUsed client clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartSession methodsFor: 'validations' stamp: 'DL 7/21/2020 22:48:15'!
validateSessionTimeToLive

	^ ((clock now) - lastTimeUsed) < (30 minutes) ifFalse: [self error: TusLibrosInterface sessionExpiredErrorDescription]! !


!CartSession methodsFor: 'initialization' stamp: 'MF 7/23/2020 13:51:20'!
InitializeWithCart: aCart from: aClient measuringTimeWith: aClock

	cart := aCart.
	client  := aClient.
	clock  := aClock.
	lastTimeUsed  := clock now.! !


!CartSession methodsFor: 'operating' stamp: 'DL 7/21/2020 22:48:15'!
do: aBlock

	self validateSessionTimeToLive.

	^[aBlock value: cart] ensure: [lastTimeUsed := clock now].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartSession class' category: #TusLibros!
CartSession class
	instanceVariableNames: ''!

!CartSession class methodsFor: 'instance creation' stamp: 'MF 7/23/2020 13:46:21'!
createWith: aCart from: aClient measuringTimeWith: aClock

	^self new InitializeWithItems: aCart debiting: aClient madeTo: aClock.! !


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


!Cashier methodsFor: 'checkout' stamp: 'MF 7/23/2020 13:44:50'!
checkout: aCart from: aClient with: aCard on: aDate 
	| subtotal |
	
	aCart isEmpty ifTrue: [ self signalEmptyCartCheckout ].
	(aCard isExpiredOn: aDate) ifTrue: [ self signalExpiredCardCheckout ].
	
	subtotal := aCart subtotal.
	
	merchantProcessor debit: subtotal from: aCard.
	
	salesBook add: (Sale withItems: aCart listItems debiting: subtotal madeTo: aClient).
		
	^subtotal.
! !


!Cashier methodsFor: 'initialization' stamp: 'MF 7/23/2020 13:50:04'!
initializeRegisteringSalesOn: aSalesBook debitingWith: aMerchantProcessor

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


!Cashier class methodsFor: 'instance creation' stamp: 'MF 7/23/2020 13:50:04'!
registeringSalesOn: aSalesBook debitingWith: aMerchantProcessor
	
	^self new initializeRegisteringSalesOn: aSalesBook debitingWith: aMerchantProcessor.! !


!classDefinition: #Clock category: #TusLibros!
Object subclass: #Clock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Clock methodsFor: 'measuring time' stamp: 'MF 7/23/2020 13:56:24'!
now
	^self subclassResponsibility.! !

!Clock methodsFor: 'measuring time' stamp: 'MF 7/23/2020 13:56:27'!
today
	^self subclassResponsibility.! !


!classDefinition: #ClockSimulator category: #TusLibros!
Clock subclass: #ClockSimulator
	instanceVariableNames: 'date now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ClockSimulator methodsFor: 'initialization' stamp: 'MF 7/23/2020 13:48:32'!
InitializeOn: aFixedGregorianDate

	date := aFixedGregorianDate.
	now := Duration zero.! !


!ClockSimulator methodsFor: 'measuring time' stamp: 'DL 7/21/2020 22:19:07'!
now

	^now! !

!ClockSimulator methodsFor: 'measuring time' stamp: 'MF 7/23/2020 13:36:06'!
today
	^date.! !


!ClockSimulator methodsFor: 'managing time' stamp: 'DL 7/21/2020 21:55:33'!
advanceTime: aDuration 

	now := now + aDuration.! !

!ClockSimulator methodsFor: 'managing time' stamp: 'DL 7/21/2020 22:33:09'!
rewindTime: aDuration 

	now := now - aDuration.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ClockSimulator class' category: #TusLibros!
ClockSimulator class
	instanceVariableNames: ''!

!ClockSimulator class methodsFor: 'instance creation' stamp: 'MF 7/23/2020 13:48:32'!
startingOn: aFixedGregorianDate

	^self new InitializeOn: aFixedGregorianDate.! !


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

!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'MF 7/23/2020 13:48:04'!
initializeDebitingWith: aBlock  

	blockToValue := aBlock.! !


!MerchantProcessorSimulator methodsFor: 'operations' stamp: 'DL 7/14/2020 17:55:29'!
debit: anAmount from: aCard

	^blockToValue value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: #TusLibros!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'instance creation' stamp: 'MF 7/23/2020 13:47:12'!
debitingWith: aBlock

	^self new initializeWith: aBlock.! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'soldItems subtotal client'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'initialization' stamp: 'MF 7/23/2020 13:46:21'!
InitializeWithItems: items debiting: aSubtotal madeTo: aClient

	soldItems := items.
	subtotal := aSubtotal.
	client := aClient.! !


!Sale methodsFor: 'assertions' stamp: 'DL 7/21/2020 19:04:30'!
wasMadeTo: aClient 
	
	^client = aClient.! !


!Sale methodsFor: 'sale details' stamp: 'DL 7/21/2020 19:05:35'!
items

	^soldItems.! !

!Sale methodsFor: 'sale details' stamp: 'DL 7/21/2020 18:22:14'!
subtotal

	^subtotal! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'MF 7/23/2020 13:46:21'!
withItems: items debiting: aSubtotal madeTo: aClient 

	^self new InitializeWithItems: items debiting: aSubtotal madeTo: aClient.! !


!classDefinition: #TusLibrosInterface category: #TusLibros!
Object subclass: #TusLibrosInterface
	instanceVariableNames: 'userAuthenticator lastCartId catalog salesBook merchantProcessor clientIdByCartId sessions clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosInterface methodsFor: 'initialization' stamp: 'MF 7/23/2020 13:45:29'!
initializeAuthenticatingWith: anUserAuthenticator acceptingItemsFrom: aCatalog registeringSalesOn: aSalesBook debitingWith: aMerchantProcessor measuringTimeWith: aClock  
	userAuthenticator := anUserAuthenticator.
	catalog := aCatalog.
	
	salesBook := aSalesBook.
	merchantProcessor := aMerchantProcessor.
	
	sessions := Dictionary new.
	clientIdByCartId := Dictionary new.
	lastCartId  := 0.
	
	clock := aClock.! !


!TusLibrosInterface methodsFor: 'private' stamp: 'MF 7/23/2020 13:49:09'!
buildCashier

	^ Cashier registeringSalesOn: salesBook debitingWith: merchantProcessor.! !

!TusLibrosInterface methodsFor: 'private' stamp: 'DL 7/21/2020 22:29:19'!
withCartId: aCartId do: aBlock
	
	| session |
	
	session := sessions at: aCartId ifAbsent: [self signalActiveCartNotFound].
	
	^session do: aBlock.! !


!TusLibrosInterface methodsFor: 'interface messages' stamp: 'DL 7/20/2020 20:33:35'!
add: aQuantity of: anIsbn to: aCartId 

	self withCartId: aCartId do: [ :cart | cart add: aQuantity of: anIsbn].! !

!TusLibrosInterface methodsFor: 'interface messages' stamp: 'MF 7/23/2020 15:25:26'!
checkout: aCartId with: aCcn with: aCced with: aCco 
	| card aCashier transactionId |
	
	card := self builCardWith: aCcn expiringOn: aCced from: aCco.
	
	self withCartId: aCartId do: [ :cart | | aClientId |

			aCashier := self buildCashier.
			aClientId := clientIdByCartId at: aCartId.
			
			aCashier checkout: cart from: aClientId with: card on: clock today. 
			sessions removeKey: aCartId.].
		
	transactionId := salesBook size + 1.
	^transactionId.
	
	
! !

!TusLibrosInterface methodsFor: 'interface messages' stamp: 'DL 7/21/2020 22:16:31'!
createCart: aClientId authenticatingWith: aPassword 
	
	| newCartId |
	userAuthenticator authenticate: aClientId with: aPassword.
	
	newCartId := lastCartId + 1.
	lastCartId  := newCartId.
	
	clientIdByCartId at: newCartId put: aClientId.
	sessions at: newCartId put: (CartSession createWith: (Cart acceptingItemsOf: catalog) from: aClientId measuringTimeWith: clock).
	
	^newCartId.! !

!TusLibrosInterface methodsFor: 'interface messages' stamp: 'DL 7/20/2020 20:34:46'!
listCart: aCartId 

	^ self withCartId: aCartId do: [:cart | cart listItems].! !

!TusLibrosInterface methodsFor: 'interface messages' stamp: 'DL 7/21/2020 19:18:24'!
listPurchases: aClientId authenticatingWith: aPassword 

	| listPurchases salesByClient purchasesItems subtotal |
	userAuthenticator authenticate: aClientId with: aPassword.
	
	salesByClient := salesBook select: [:sale | sale wasMadeTo: aClientId].
	
	purchasesItems := salesByClient inject: Bag new into: [:acc :sale | acc addAll: sale items. acc].
	
	subtotal := salesByClient sum: [:sale | sale subtotal] ifEmpty: [0].
	
	listPurchases := Dictionary new.
	
	listPurchases at: 'purchasesItems' put: purchasesItems.
	listPurchases at: 'totalPrice' put: subtotal.
	
	^listPurchases.
	! !


!TusLibrosInterface methodsFor: 'signals' stamp: 'DL 7/21/2020 19:49:01'!
signalActiveCartNotFound

	^ self error: self class activeCartNotFoundErrorDescription! !

!TusLibrosInterface methodsFor: 'signals' stamp: 'DL 7/20/2020 20:22:19'!
signalCheckingOutCartTwice

	^ self error: self class checkingOutCartTwiceErrorDescription! !

!TusLibrosInterface methodsFor: 'signals' stamp: 'MF 7/18/2020 18:52:04'!
signalInvalidCced

	^ self error: self class invalidCcedErrorDescription! !

!TusLibrosInterface methodsFor: 'signals' stamp: 'MF 7/18/2020 18:52:18'!
signalInvalidCcn

	^ self error: self class invalidCcnErrorDescription! !


!TusLibrosInterface methodsFor: 'Card data operations' stamp: 'DL 7/20/2020 20:17:57'!
builCardWith: aCcn expiringOn: aCced from: aCco

	| aMonthOfYear |
	self validateCardCcn: aCcn.
	aMonthOfYear := self buildMonthOfYearFrom: aCced.
	^Card withNumber: aCcn expiringOn: aMonthOfYear withName: aCco. 
	
	! !

!TusLibrosInterface methodsFor: 'Card data operations' stamp: 'MF 7/20/2020 16:05:23'!
buildMonthOfYearFrom: aCced

	('##/####' match: aCced) ifFalse: [ self signalInvalidCced ].
	
	[ ^GregorianMonthOfYear yearNumber: (aCced copyFrom: 4 to: 7) asNumber monthNumber: (aCced copyFrom: 1 to: 2) asNumber ]
		on: Error
		do: [ self signalInvalidCced ].! !

!TusLibrosInterface methodsFor: 'Card data operations' stamp: 'MF 7/18/2020 18:52:18'!
validateCardCcn: aCcn

	^ (aCcn allSatisfy: [:aCcnChar | aCcnChar isDigit ]) ifFalse: [ self signalInvalidCcn ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosInterface class' category: #TusLibros!
TusLibrosInterface class
	instanceVariableNames: ''!

!TusLibrosInterface class methodsFor: 'instance creation' stamp: 'MF 7/23/2020 13:45:29'!
authenticatingWith: anUserAuthenticationServiceSimulator acceptingItemsFrom: aCatalog registeringSalesOn: aSalesBook debitingWith: aMerchantProcessor measuringTimeWith: aClock   
	^self new initializeAuthenticatingWith: anUserAuthenticationServiceSimulator acceptingItemsFrom: aCatalog registeringSalesOn: aSalesBook debitingWith: aMerchantProcessor measuringTimeWith: aClock.! !


!TusLibrosInterface class methodsFor: 'errors' stamp: 'DL 7/21/2020 19:48:25'!
activeCartNotFoundErrorDescription
	^'Active cart was not found matching cartId'.! !

!TusLibrosInterface class methodsFor: 'errors' stamp: 'MF 7/20/2020 17:40:05'!
checkingOutCartTwiceErrorDescription
	^'cannot check out a cart twice'.! !

!TusLibrosInterface class methodsFor: 'errors' stamp: 'MF 7/18/2020 18:34:50'!
invalidCcedErrorDescription
	^'Expiration date does not conform to MM/YYYY format'.! !

!TusLibrosInterface class methodsFor: 'errors' stamp: 'MF 7/18/2020 17:51:57'!
invalidCcnErrorDescription
	^'ccn can only have digits'.! !

!TusLibrosInterface class methodsFor: 'errors' stamp: 'DL 7/21/2020 22:32:30'!
sessionExpiredErrorDescription

	^'cannot operate when session is expired.'! !


!classDefinition: #UserAuthenticationService category: #TusLibros!
Object subclass: #UserAuthenticationService
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UserAuthenticationService methodsFor: 'authentication' stamp: 'DL 7/21/2020 19:57:40'!
authenticate: aClientId with: aPassword

	self subclassResponsibility.! !


!classDefinition: #UserAuthenticationServiceSimulator category: #TusLibros!
UserAuthenticationService subclass: #UserAuthenticationServiceSimulator
	instanceVariableNames: 'blockClosure authenticateBehaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UserAuthenticationServiceSimulator methodsFor: 'initialization' stamp: 'DL 7/21/2020 22:46:49'!
initializeWith: aBlock 
	authenticateBehaviour := aBlock.! !


!UserAuthenticationServiceSimulator methodsFor: 'authentication' stamp: 'MF 7/16/2020 19:29:37'!
authenticate: aClientId with: aPassword
	^authenticateBehaviour value: aClientId value: aPassword.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UserAuthenticationServiceSimulator class' category: #TusLibros!
UserAuthenticationServiceSimulator class
	instanceVariableNames: ''!

!UserAuthenticationServiceSimulator class methodsFor: 'instance creation' stamp: 'DL 7/21/2020 22:46:33'!
authenticatingWith: aBlock 
	^self new initializeWith: aBlock.! !
