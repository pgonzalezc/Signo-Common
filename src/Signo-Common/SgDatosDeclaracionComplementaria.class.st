Class {
	#name : #SgDatosDeclaracionComplementaria,
	#superclass : #Object,
	#instVars : [
		'complementaria',
		'sustitutiva',
		'nroJustificanteAnterior'
	],
	#category : #'Signo-Common-Web'
}

{ #category : #accessing }
SgDatosDeclaracionComplementaria >> complementaria [
	^ complementaria
]

{ #category : #accessing }
SgDatosDeclaracionComplementaria >> complementaria: anObject [
	complementaria := anObject
]

{ #category : #initialization }
SgDatosDeclaracionComplementaria >> initialize [
	complementaria := false.
	sustitutiva := false
]

{ #category : #accessing }
SgDatosDeclaracionComplementaria >> nroJustificanteAnterior [
	^ nroJustificanteAnterior
]

{ #category : #accessing }
SgDatosDeclaracionComplementaria >> nroJustificanteAnterior: anObject [
	nroJustificanteAnterior := anObject
]

{ #category : #accessing }
SgDatosDeclaracionComplementaria >> sustitutiva [
	^ sustitutiva
]

{ #category : #accessing }
SgDatosDeclaracionComplementaria >> sustitutiva: anObject [
	sustitutiva := anObject
]
