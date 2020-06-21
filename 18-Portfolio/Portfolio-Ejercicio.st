!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 19:42:13'!
test01

	| portfolio |
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 19:49:09'!
test02

	| portfolio account |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	portfolio addAccount: account. 
	
	self assert: 0 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 19:51:34'!
test03

	| portfolio account |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	portfolio addAccount: account. 
	
	self assert: 100 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 20:02:05'!
test04

	| portfolio account secondAccount |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account.

	secondAccount  := ReceptiveAccount  new.
	Withdraw register: 50 on: secondAccount.
	 
	portfolio addAccount: account.
	portfolio addAccount: secondAccount. 
	
	self assert: 50 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 20:11:39'!
test05

	| portfolio account secondAccount thirdAccount |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account.

	secondAccount  := ReceptiveAccount  new.
	Withdraw register: 50 on: secondAccount.

	thirdAccount := ReceptiveAccount new.
	Deposit register: 25 on: thirdAccount.
	 
	portfolio addAccount: account.
	portfolio addAccount: secondAccount.
	portfolio addAccount: thirdAccount .
	
	self assert: 75 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 20:47:13'!
test06

	| portfolio account transaction |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account.
	 	
	self deny: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 20:46:35'!
test07

	| portfolio account transaction |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account.
	 
	portfolio addAccount: account.
	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 20:50:55'!
test08

	| portfolio account account2 transaction2 |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 200 on: account.
	
	account2 := ReceptiveAccount new.
	transaction2 := Deposit register: 200 on: account2.
	 
	portfolio addAccount: account.
	
	self deny: (portfolio hasRegistered: transaction2).
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 21:00:13'!
test09

	| portfolio account account2 account3 transaction |
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 200 on: account.
	Withdraw  register: 100 on: account.
	
	account2 := ReceptiveAccount  new.
	Deposit register: 50 on: account2.
	
	account3 := ReceptiveAccount  new.
	transaction := Deposit register: 50 on: account3.
	 
	portfolio addAccount: account.
	portfolio addAccount: account2.
	portfolio addAccount: account3.
	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 21:03:04'!
test10

	| portfolio |
	portfolio := Portfolio new.

	self assert: portfolio transactions isEmpty.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 21:06:46'!
test11

	| portfolio account transaction|
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account. 	
	
	portfolio addAccount: account.

	self assert: (OrderedCollection with: transaction) equals: portfolio transactions.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/18/2020 21:13:00'!
test12

	| portfolio account transaction account2 transaction2 account3 transaction3|
	portfolio := Portfolio new.

	account := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account. 
	
	account2 := ReceptiveAccount new.
	transaction2 := Deposit register: 100 on: account. 
	
	account3 := ReceptiveAccount new.
	transaction3 := Deposit register: 100 on: account. 	
	
	portfolio addAccount: account.
	portfolio addAccount: account2.
	portfolio addAccount: account3.

	self assert: (OrderedCollection with: transaction with: transaction2 with: transaction3) 
		equals: portfolio transactions.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 16:42:52'!
test13

	| portfolio account portfolio2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	
	portfolio addAccount: account.
	portfolio addPortfolio: portfolio2.

	self assert: 0 equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 16:46:13'!
test14

	| portfolio account portfolio2 account2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	
	portfolio addAccount: account.
	portfolio2 addAccount: account2.
	portfolio addPortfolio: portfolio2.

	self assert: 200 equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 16:50:47'!
test15

	| portfolio account portfolio2 account2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account. 
	
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	
	portfolio addAccount: account.
	portfolio2 addAccount: account2.
	portfolio addPortfolio: portfolio2.

	self assert: 100 equals: portfolio2 balance.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 16:56:39'!
test16

	| portfolio account portfolio2 account2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.
	
	portfolio addAccount: account.
	portfolio2 addAccount: account2.
	portfolio addPortfolio: portfolio2.

	self assert: 100 equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 16:58:13'!
test17

	| portfolio account portfolio2 account2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	account := ReceptiveAccount new.
	Deposit register: 100 on: account.

	account2 := ReceptiveAccount new.
	
	portfolio addAccount: account.
	portfolio2 addAccount: account2.
	portfolio addPortfolio: portfolio2.

	self assert: 100 equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 17:02:55'!
test18

	| portfolio portfolio2 account2  account3 portfolio3 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.

	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.

	account3 := ReceptiveAccount new.
	
	portfolio2 addAccount: account2.
	portfolio3 addAccount: account3.
	portfolio addPortfolio: portfolio2.
	portfolio addPortfolio: portfolio3.

	self assert: 100 equals: portfolio balance.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 17:03:59'!
test19

	| portfolio portfolio2 account2  account3 portfolio3 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.

	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.

	account3 := ReceptiveAccount new.
	Withdraw register: 50 on: account3.
	
	portfolio2 addAccount: account2.
	portfolio3 addAccount: account3.
	portfolio addPortfolio: portfolio2.
	portfolio addPortfolio: portfolio3.

	self assert: 50 equals: portfolio balance.
	
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 17:16:09'!
test20

	| portfolio transaction account2 portfolio2 |
	portfolio := Portfolio new.
	
	portfolio2 := Portfolio new.
	account2 := ReceptiveAccount  new.
	transaction := Deposit register: 100 on: account2.

	portfolio2 addAccount: account2.
	portfolio addPortfolio: portfolio2.
	 	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 17:25:07'!
test21

	| portfolio transaction account2 portfolio2 portfolio3 portfolio4 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3  := Portfolio  new.
	portfolio4 := Portfolio new.
	
	portfolio2 := Portfolio new.
	account2 := ReceptiveAccount  new.
	transaction := Deposit register: 100 on: account2.

	portfolio4 addAccount: account2.
	portfolio addPortfolio: portfolio2.
	portfolio addPortfolio: portfolio3.
	portfolio addPortfolio: portfolio4.
	 	
	self assert: (portfolio hasRegistered: transaction).
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 17:35:44'!
test22

	| portfolio account2 portfolio2 transaction |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account2 := ReceptiveAccount new.
	transaction := Deposit register: 100 on: account2.
	
	portfolio2 addAccount: account2.
	portfolio addPortfolio: portfolio2. 

	self assert: (OrderedCollection with: transaction) equals: portfolio transactions.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:06:55'!
test23

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
	
	portfolio2 addAccount: account2.
	portfolio3 addAccount: account3.
	portfolio addPortfolio: portfolio2.
	portfolio addPortfolio: portfolio3.
	portfolio addAccount: account4.

	self assert: (OrderedCollection with: transaction2 with: transaction3 with: transaction4) equals: portfolio transactions.
	! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:11:21'!
test24

	| portfolio |
	portfolio := Portfolio new.
	
	self should: [portfolio add: portfolio]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:16:46'!
test25

	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	portfolio add: account.
	
	self should: [portfolio add: account]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:20:09'!
test26

	| portfolio portfolio2 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio add: portfolio2.
	
	self should: [portfolio add: portfolio2]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:07:31'!
test26CHECKLATERXXXXXXXXXXXXXXX

	"Ver si tiene sentido este test desde un aspecto funcional."

	| portfolio account2 portfolio2 portfolio3 |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	
	account2 := ReceptiveAccount new.
	Deposit register: 100 on: account2.

	portfolio addAccount: account2.
	portfolio2 addAccount: account2.
	portfolio addPortfolio: portfolio3.
	portfolio2 addPortfolio: portfolio3.

	self assert: portfolio balance equals: portfolio2 balance.
	self assert: portfolio transactions equals: portfolio2 transactions.
! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:23:41'!
test27

	| portfolio portfolio2 account |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio2 add: account.
	portfolio add: portfolio2. 
	
	self should: [portfolio add: account]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:40:15'!
test28

	| portfolio portfolio2 account |
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	
	account := ReceptiveAccount new.
	portfolio add: account.
	portfolio2 add: account.
	 
	self should: [portfolio add: portfolio2]
		raise: Error
		withMessageText: Portfolio cantBreakTreeStructureErrorDescription.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 19:00:50'!
test29

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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 20:30:16'!
test30

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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 20:32:20'!
test31

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

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 20:51:05'!
test32

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


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

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

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 20:55:37'!
add: aPortfolioEntry 
	
	
	(self hasAnyRootPortfolioAccountInCommonWith: aPortfolioEntry) ifTrue: [self signalTreeStructureBroken].
	
	entries add: aPortfolioEntry.
	(aPortfolioEntry isKindOf: self class) ifTrue: [ aPortfolioEntry addPortfolioOwner: self ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:05:58'!
addAccount: aReceptiveAccount 
	entries add: aReceptiveAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'MF 6/20/2020 18:06:05'!
addPortfolio: aPortfolio 
	entries add: aPortfolio.
	! !

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


!ReceptiveAccount methodsFor: 'balance' stamp: 'MF 6/18/2020 19:29:29'!
balance

	^transactions sum: [ :aTransaction | (aTransaction isKindOf: Deposit) ifTrue: [aTransaction value] ifFalse: [aTransaction value negated] ] ifEmpty: [ 0 ]! !

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
