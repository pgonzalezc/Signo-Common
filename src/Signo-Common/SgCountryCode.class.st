Class {
	#name : #SgCountryCode,
	#superclass : #WARequestHandler,
	#category : #'Signo-Common-Web'
}

{ #category : #'class initialization' }
SgCountryCode class >> initialize [ 

	<script>
	WAAdmin register: self at: 'CountryCode'
]

{ #category : #'as yet unclassified' }
SgCountryCode >> getCountryFor: aCountryCode [

	^ WALocale iso2Countries keyAtValue: aCountryCode asUppercase 
]

{ #category : #handling }
SgCountryCode >> handleFiltered: aRequestContext [
	| pais |
	pais := aRequestContext request
		at: 'pais'
		ifAbsent: ''.
	aRequestContext
		respond: [ :response | 
			response
				status: WAResponse statusOk;
				contentType: WAMimeType textPlain;
				nextPutAll:
					('{1} = {2}'
						format:
							{pais.
							(self getCountryFor: pais)}) ]
]
