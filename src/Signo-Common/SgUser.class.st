Class {
	#name : #SgUser,
	#superclass : #Object,
	#instVars : [
		'nif',
		'denominacion',
		'credential'
	],
	#category : #'Signo-Common-Common'
}

{ #category : #'as yet unclassified' }
SgUser class >> forNif: aNif denominacion: aString [

	^ (self basicNew)
		setNif: aNif;
		setDenominacion: aString;
		yourself
]

{ #category : #'instance creation' }
SgUser class >> fromHttpRequest: aHttpRequest [
	| dn cert matcher nif deno |
	dn := aHttpRequest headers at: 'ssl_client_s_dn'.
	cert := aHttpRequest headers at: 'ssl_client_cert'.
	matcher := '^CN=(.+),SN=.+$' asRegex.
	(matcher matches: dn)
		ifNotNil: [ | cn idx |
			cn := matcher subexpression: 2.
			idx := cn indexOfSubCollection: ' - '.
			deno := cn copyFrom: 1 to: idx.
			nif := cn copyFrom: idx + 3 to: cn size ].
	^ self forNif: nif denominacion: deno
]

{ #category : #accessing }
SgUser >> credential [
	^ credential
]

{ #category : #accessing }
SgUser >> denominacion [
	^ denominacion
]

{ #category : #accessing }
SgUser >> nif [
	^ nif
]

{ #category : #printing }
SgUser >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' nif: ';
		print: nif.
	aStream
		nextPutAll: ' denominacion: ';
		print: denominacion
]

{ #category : #'private-initialization' }
SgUser >> setCredential: aCertificate [

	credential := aCertificate
]

{ #category : #'private-initialization' }
SgUser >> setDenominacion: aString [

	denominacion := aString

	
]

{ #category : #'private-initialization' }
SgUser >> setNif: aNif [

	nif := aNif
]
