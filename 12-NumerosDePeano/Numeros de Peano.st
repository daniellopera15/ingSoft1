!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'base' stamp: 'DL 4/29/2020 21:00:06'!
> aNumber
	
	^false.! !

!I class methodsFor: 'base' stamp: 'MF 4/28/2020 17:19:32'!
next

	^self createChildNamed: self name , 'I'.! !


!I class methodsFor: 'operation' stamp: 'MF 4/28/2020 17:24:28'!
* aNumber 
	^aNumber.! !

!I class methodsFor: 'operation' stamp: 'MF 4/30/2020 15:03:44'!
+ aNumber 
	
	^aNumber next! !

!I class methodsFor: 'operation' stamp: 'MF 4/29/2020 18:01:54'!
- aNumber 
	^self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'operation' stamp: 'MF 4/30/2020 14:33:27'!
/ aNumber 

	aNumber > self
		ifTrue: [^self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ]
		
		ifFalse: [^self calculateQuotient: aNumber].! !


!I class methodsFor: 'errors' stamp: 'DL 4/29/2020 19:38:06'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'Cannot be divided by a larger number'! !

!I class methodsFor: 'errors' stamp: 'MF 4/28/2020 17:36:17'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Non positive numbers are not supported'.! !


!I class methodsFor: 'private' stamp: 'MF 4/30/2020 14:27:34'!
calculateQuotient: aNumber 
	^self! !

!I class methodsFor: 'private' stamp: 'DL 4/29/2020 21:14:47'!
greaterThan: aNumber

	^true.! !

!I class methodsFor: 'private' stamp: 'MF 4/29/2020 17:53:11'!
substractFrom: aNumber 
	^aNumber previous ! !


!classDefinition: #II category: #'Numeros de Peano'!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'base' stamp: 'AM 4/27/2020 21:42:53'!
previous

	^self parent! !


!II class methodsFor: 'private' stamp: 'MF 4/30/2020 15:03:57'!
calculateQuotient: aNumber
	|remaining|

	self = aNumber
		ifTrue: [^I]
		ifFalse: [
				remaining := self - aNumber.		
				self > remaining
					ifTrue: [^(remaining/aNumber) next]
					ifFalse: [^I].
			].! !

!II class methodsFor: 'private' stamp: 'DL 4/29/2020 21:18:29'!
greaterThan: aNumber

	^aNumber previous > self previous.! !

!II class methodsFor: 'private' stamp: 'MF 4/29/2020 17:57:18'!
substractFrom: aNumber
	^aNumber previous - self previous! !


!II class methodsFor: 'operation' stamp: 'MF 4/28/2020 17:34:01'!
* aNumber 
	^aNumber + (self previous * aNumber).! !

!II class methodsFor: 'operation' stamp: 'MF 4/30/2020 15:03:50'!
+ aNumber 

	^self previous + aNumber next! !

!II class methodsFor: 'operation' stamp: 'MF 4/29/2020 18:01:21'!
- aNumber 

	^aNumber substractFrom: self! !

!II class methodsFor: 'operation' stamp: 'DL 4/29/2020 21:19:51'!
> aNumber

	^aNumber greaterThan: self.! !


!classDefinition: #III category: #'Numeros de Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIII category: #'Numeros de Peano'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIII category: #'Numeros de Peano'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIII category: #'Numeros de Peano'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!
