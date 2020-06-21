!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 17:32:41'!
test20PortfolioCantAddSelf

	| portfolio |
	portfolio := Portfolio new.
	
	self should: [portfolio add: portfolio]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 17:34:20'!
test21PortfolioCantAddTwiceSameAccount

	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	portfolio add: account.
	
	self should: [portfolio add: account]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 17:36:35'!
test22PortfolioCantAddTwiceSamePortfolio

	| portfolio portfolio2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio add: portfolio2.
	
	self should: [portfolio add: portfolio2]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 17:37:50'!
test23PortfolioCantAddAccountAlreadyInChildPortfolio

	| portfolio portfolio2 account |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio2 add: account.
	portfolio add: portfolio2. 
	
	self should: [portfolio add: account]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 17:39:08'!
test24PortfolioCantAddAPortofolioWithAccountAlreadyAdded

	| portfolio portfolio2 account |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio add: account.
	portfolio2 add: account.
	 
	self should: [portfolio add: portfolio2]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 17:41:05'!
test25PortfolioCantAddPortfolioWithAccountAlreadyAddedInChildPortfolio

	| portfolio portfolio2 portfolio3 account |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	account := ReceptiveAccount new.
	
	portfolio2 add: account.
	portfolio3 add: account.
	portfolio add: portfolio2.
	 
	self should: [portfolio add: portfolio3]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 17:43:35'!
test26ChildPortfolioCantAddPortfolioWithAccountAlreadyAddedInParent

	| portfolio portfolio2 portfolio3 account |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	account := ReceptiveAccount new.
		
	portfolio add: portfolio2.
	portfolio add: account.
	portfolio3 add: account.
	 
	self should: [portfolio2 add: portfolio3]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 17:49:17'!
test27ChildPortfolioCantAddPortfolioWithAccountAlreadyAddedInRoot

	| portfolio portfolio2 portfolio3 account portfolio4 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio4 := Portfolio new.
	account := ReceptiveAccount new.
		
	portfolio add: portfolio2.
	portfolio2 add: portfolio4.
	portfolio add: account.
	portfolio3 add: account.
	 
	self should: [portfolio4 add: portfolio3]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'tree validation testing' stamp: 'DL 6/21/2020 17:51:10'!
test28ChildPortfolioCantAddPortfolioWithAccountAlreadyAddedInAnyRoot

	| portfolio portfolio2 portfolio3 account portfolio4 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio4 := Portfolio new.
	account := ReceptiveAccount new.
		
	portfolio add: portfolio4.
	portfolio2 add: portfolio4.
	portfolio2 add: account.
	portfolio3 add: account.
	
	self should: [portfolio4 add: portfolio3]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !


!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 16:42:05'!
test01EmptyPortfolioShouldHaveBalanceInCero

	| portfolio |
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 16:43:05'!
test02PortfolioWithEmptyAccountShouldHaveBalanceCero

	| portfolio account |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	portfolio add: account. 
	
	self assert: 0 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 16:46:53'!
test03PortfolioWithAccountShouldSameBalance

	| portfolio account |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	portfolio add: account. 
	
	self assert: 100 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 16:53:27'!
test04PortfolioWithManyAccountsBalanceShouldSumTheirBalance

	| portfolio account secondAccount thirdAccount |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account.

	secondAccount  := ReceptiveAccount  new.
	Withdraw register: 50 on: secondAccount.

	thirdAccount := ReceptiveAccount new.
	Deposit register: 25 on: thirdAccount.
	 
	portfolio add: account.
	portfolio add: secondAccount.
	portfolio add: thirdAccount .
	
	self assert: 75 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 17:09:28'!
test12NestedPortofolioWithEmptyAccountShouldHaveBalanceCero

	| portfolio account portfolio2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	
	portfolio add: account.
	portfolio add: portfolio2.

	self assert: 0 equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 17:13:36'!
test13NestedPortfolioWithAccountRootShouldHaveSumBalance

	| portfolio account portfolio2 account2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	
	portfolio add: account.
	portfolio2 add: account2.
	portfolio add: portfolio2.

	self assert: 200 equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 17:14:53'!
test14NestedPortfolioWithAccountChildShouldHaveOnlyOwnBalance

	| portfolio account portfolio2 account2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	
	portfolio add: account.
	portfolio2 add: account2.
	portfolio add: portfolio2.

	self assert: 100 equals: portfolio2 balance.
	! !

!PortfolioTest methodsFor: 'balance testing' stamp: 'DL 6/21/2020 17:21:12'!
test15NestedManyPortfoliosWithAccountShouldSumAllBalances

	| portfolio portfolio2 account2  account3 portfolio3 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.

	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.

	account3 := ReceptiveAccount new.
	
	portfolio2 add: account2.
	portfolio3 add: account3.
	portfolio add: portfolio2.
	portfolio add: portfolio3.

	self assert: 100 equals: portfolio balance.
	! !


!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 16:55:05'!
test05EmptyPortfolioShoulNotHaveTransactions

	| portfolio account transaction |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account.
	 	
	self deny: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 16:57:51'!
test06PortfolioWithAnAccountWithTransactionShouldHaveItRegistered

	| portfolio account transaction |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account.
	 
	portfolio add: account.
	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 16:59:55'!
test07PortfolioShouldNotHaveRegisteredTransactionsNotInAccounts

	| portfolio account account2 transaction2 |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 200 on: account.
	
	account2 := ReceptiveAccount new.
	transaction2 := Deposit register: 200 on: account2.
	 
	portfolio add: account.
	
	self deny: (portfolio hasRegistered: transaction2).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:02:32'!
test08PortfolioHaveRegisteredATransactionInAnyHisAccounts

	| portfolio account account2 account3 transaction |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 200 on: account.
	Withdraw  register: 100 on: account.
	
	account2 := ReceptiveAccount  new.
	Deposit register: 50 on: account2.
	
	account3 := ReceptiveAccount  new.
	transaction := Deposit register: 50 on: account3.
	 
	portfolio add: account.
	portfolio add: account2.
	portfolio add: account3.
	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:03:15'!
test09EmptyPortfolioShouldNotHaveTransactions

	| portfolio |
	portfolio := Portfolio new.

	self assert: portfolio transactions isEmpty.
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:04:41'!
test10PortfolioWithAccountTransactionsShouldHaveTheAccountTransactions

	| portfolio account transaction|
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account. 	
	
	portfolio add: account.

	self assert: (OrderedCollection with: transaction) equals: portfolio transactions.
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:06:31'!
test11PortfolioWithManyAccountsShouldHaveAllTransactions

	| portfolio account transaction account2 transaction2 account3 transaction3|
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account. 
	
	account2 := ReceptiveAccount new.
	transaction2 := Deposit register: 100 on: account. 
	
	account3 := ReceptiveAccount new.
	transaction3 := Deposit register: 100 on: account. 	
	
	portfolio add: account.
	portfolio add: account2.
	portfolio add: account3.

	self assert: (OrderedCollection with: transaction with: transaction2 with: transaction3) 
		equals: portfolio transactions.
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:25:22'!
test16NestedPortfoliosShouldHaveRegisteredTransactionIfAnyChildHas

	| portfolio transaction account2 portfolio2 |
	portfolio := Portfolio new.
	
	portfolio2 := Portfolio new.
	account2 := ReceptiveAccount  new.
	transaction := Deposit register: 100 on: account2.

	portfolio2 add: account2.
	portfolio add: portfolio2.
	 	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:27:41'!
test17DoubleNestedPortfoliosShouldHaveRegisteredTransactionIfAnyChildHas

	| portfolio transaction account2 portfolio2 portfolio3 portfolio4 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3  := Portfolio  new.
	portfolio4 := Portfolio new.
	
	portfolio2 := Portfolio new.
	account2 := ReceptiveAccount  new.
	transaction := Deposit register: 100 on: account2.

	portfolio4 add: account2.
	portfolio add: portfolio2.
	portfolio add: portfolio3.
	portfolio add: portfolio4.
	 	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:30:01'!
test18NestedPortfolioShouldHaveAllTransactions

	| portfolio account2 portfolio2 transaction |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account2 := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account2.
	
	portfolio2 add: account2.
	portfolio add: portfolio2. 

	self assert: (OrderedCollection with: transaction) equals: portfolio transactions.
	! !

!PortfolioTest methodsFor: 'transactions testing' stamp: 'DL 6/21/2020 17:31:55'!
test19ManyNestedPortfolioShouldHaveAllChildTransactions

	| portfolio account2 portfolio2 account3 account4 portfolio3 transaction2 transaction3 transaction4 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	account2 := ReceptiveAccount new.
	transaction2 := Deposit register: 100 on: account2.
	account3 := ReceptiveAccount new.
	transaction3 := Withdraw register: 50 on: account3.
	account4 := ReceptiveAccount new.
	transaction4 := Deposit register: 25 on: account4.
	
	portfolio2 add: account2.
	portfolio3 add: account3.
	portfolio add: portfolio2.
	portfolio add: portfolio3.
	portfolio add: account4.

	self assert: (OrderedCollection with: transaction2 with: transaction3 with: transaction4) equals: portfolio transactions.
	! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 6/18/2020 17:33:13'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance operation' stamp: 'DL 6/21/2020 18:20:34'!
applyToBalance: balance

	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'DL 6/21/2020 18:19:48'!
value

	^ value! !


!Deposit methodsFor: 'balance operation' stamp: 'DL 6/21/2020 18:21:58'!
applyToBalance: balance

	^ balance + self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance operation' stamp: 'DL 6/21/2020 18:22:11'!
applyToBalance: balance

	^ balance - self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'entries parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'DL 6/21/2020 16:39:54'!
add: aPortfolioEntry 
	
	
	(self hasAnyRootPortfolioAccountInCommonWith: aPortfolioEntry) ifTrue: [self signalTreeStructureBroken].
	
	entries add: aPortfolioEntry.
	(aPortfolioEntry isKindOf: self class) ifTrue: [ aPortfolioEntry addPortfolioOwner: self ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 20:29:26'!
addPortfolioOwner: aPortfolio 
	parents add: aPortfolio.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:05:21'!
balance
	^(entries sum: [:account | account balance] ifEmpty: [0])! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 19:28:38'!
hasAccountInCommonWith: aPortfolioEntry
	^(aPortfolioEntry isReachable: self) or: [entries anySatisfy: [:entry | entry hasAccountInCommonWith: aPortfolioEntry]]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 21:04:23'!
hasAnyRootPortfolioAccountInCommonWith: aPortfolioEntry 
	
	self isRootPortfolio ifTrue: [^self hasAccountInCommonWith: aPortfolioEntry].
	^parents anySatisfy: [:parent | (parent hasAnyRootPortfolioAccountInCommonWith: aPortfolioEntry)].
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:05:36'!
hasRegistered: aTransaction
	^(entries anySatisfy: [:anAccount | anAccount hasRegistered: aTransaction]).! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 20:15:18'!
initialize
	entries := OrderedCollection new.
	parents := OrderedCollection new.
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:37:55'!
isReachable: aPortfolioEntry
	^(aPortfolioEntry = self) or: [entries anySatisfy: [:entry | entry isReachable: aPortfolioEntry]]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 21:04:23'!
isRootPortfolio

	^ parents isEmpty! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:15:17'!
signalTreeStructureBroken

	^ self error: self class cantBreakTreeStructureErrorDescription! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:05:49'!
transactions
		^(entries inject: OrderedCollection new into: [:acc :account | acc , account transactions])

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:13:02'!
cantBreakTreeStructureErrorDescription
	^'cannot create cyclic references to accounts nor Portfolios'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'MF 6/20/2020 20:15:34'!
initialize

	transactions := OrderedCollection new.
	parents := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'DL 6/21/2020 18:23:58'!
balance

	^transactions inject: 0 into: [:balance :aTransaction | aTransaction applyToBalance: balance]. ! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'MF 6/20/2020 19:29:05'!
hasAccountInCommonWith: aPortfolioEntry
	^aPortfolioEntry isReachable: self! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'MF 6/20/2020 18:38:56'!
isReachable: aPortfolioEntry
	^aPortfolioEntry = self! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
