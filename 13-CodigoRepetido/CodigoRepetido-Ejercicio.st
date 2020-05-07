!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'DL 5/4/2020 20:32:16'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self executionOf: [customerBook addCustomerNamed: 'John Lennon'.] shouldNotTakeMoreThan: 50.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DL 5/4/2020 20:33:29'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self executionOf: [customerBook removeCustomerNamed: paulMcCartney.] shouldNotTakeMoreThan: 100.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DL 5/4/2020 21:15:21'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self expectFailFrom: [customerBook addCustomerNamed: ''.] 
	ofType: Error thenAssert: 
	[ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage .
			self assert: customerBook isEmpty].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DL 5/4/2020 21:16:26'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self expectFailFrom: [customerBook removeCustomerNamed: 'Paul McCartney'.] ofType:  NotFound thenAssert: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MF 5/7/2020 13:58:01'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.

	self assertCustomerBook: customerBook 
		hasActiveCountOf: 0 
		hasSuspendedCountOf: 1 
		hasCustomerCountOf: 1.
		
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MF 5/7/2020 13:56:49'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertCustomerBook: customerBook 
		hasActiveCountOf: 0 
		hasSuspendedCountOf: 0 
		hasCustomerCountOf: 0.

	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DL 5/4/2020 21:17:20'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self expectFailFrom: [customerBook suspendCustomerNamed: 'Ringo Starr'.] ofType: CantSuspend  thenAssert: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'DL 5/4/2020 21:18:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	self expectFailFrom: [customerBook suspendCustomerNamed: johnLennon.] ofType: CantSuspend thenAssert: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !


!CustomerBookTest methodsFor: 'block checks' stamp: 'DL 5/4/2020 20:34:09'!
executionOf: aClosure shouldNotTakeMoreThan: timeLimitInMillis

	|millisecondsBeforeRunning millisecondsAfterRunning|
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (timeLimitInMillis * millisecond)! !

!CustomerBookTest methodsFor: 'block checks' stamp: 'DL 5/4/2020 21:14:45'!
expectFailFrom: block ofType: exceptionType thenAssert: assertionBlock

[ block value.
	self fail ]
		on: exceptionType 
		do: assertionBlock.! !


!CustomerBookTest methodsFor: 'CustomerBook checking' stamp: 'MF 5/7/2020 13:50:33'!
assertCustomerBook: aCustomerBook hasActiveCountOf: expectedActiveCount hasSuspendedCountOf: expectedSuspendCount hasCustomerCountOf: expectedCustomersCount

	self assert: expectedActiveCount equals: aCustomerBook numberOfActiveCustomers.
	self assert: expectedSuspendCount equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: expectedCustomersCount equals: aCustomerBook numberOfCustomers.! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'DL 5/4/2020 21:45:04'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'DL 5/4/2020 21:47:54'!
isEmpty
	
	^self numberOfCustomers  = 0.! !


!CustomerBook methodsFor: 'initialization' stamp: 'DL 5/4/2020 21:44:09'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'signaling' stamp: 'DL 5/4/2020 21:32:29'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signaling' stamp: 'DL 5/4/2020 21:32:33'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !


!CustomerBook methodsFor: 'customer management' stamp: 'DL 5/4/2020 21:32:46'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'DL 5/4/2020 21:42:29'!
removeCustomerNamed: aName 

	(self removeFrom: active withName: aName) = aName ifTrue: [^aName].
	(self removeFrom: suspended withName: aName) = aName ifTrue: [^aName].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'MF 5/7/2020 13:29:53'!
removeFrom: aCustomerList withName: aName

	1 to: aCustomerList size do: 
	[ :index |
		aName = (aCustomerList at: index)
			ifTrue: [
				aCustomerList removeAt: index.
				^ aName 
			] 
	].! !

!CustomerBook methodsFor: 'customer management' stamp: 'DL 5/4/2020 21:54:37'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'customer counting' stamp: 'DL 5/4/2020 21:51:45'!
numberOfActiveCustomers
	
	^self numberOfCustomersInList: active.! !

!CustomerBook methodsFor: 'customer counting' stamp: 'DL 5/4/2020 21:32:04'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer counting' stamp: 'MF 5/7/2020 13:29:13'!
numberOfCustomersInList: aCustomerList
	
	^aCustomerList size.! !

!CustomerBook methodsFor: 'customer counting' stamp: 'DL 5/4/2020 21:50:56'!
numberOfSuspendedCustomers
	
	^self numberOfCustomersInList: suspended.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
