Class {
	#name : #SgCountryCodeRF,
	#superclass : #WARestfulHandler,
	#category : #'Signo-Common-Web'
}

{ #category : #'class initialization' }
SgCountryCodeRF class >> initialize [
	<script>
	| app |
	app := WAAdmin register: self at: 'Services'.
	"app preferenceAt: #sessionClass put: SgSession"
]

{ #category : #'as yet unclassified' }
SgCountryCodeRF >> countryCode: aCountryCode [
	<get>
	<path: 'country/name/{aCountryCode}'>
	<produces: 'application/json'>
	| name |
	Halt now.
	name := WALocale iso2Countries
		keyAtValue: aCountryCode asUppercase
		ifAbsent: [ ^ {(#status -> 'KO').
			(#codigo -> aCountryCode).
			(#causa
				->
					('El pais [{1}] no se encuentra la base de datos'
						format: {aCountryCode}))} asDictionary asJson ].
	^ {(#status -> 'OK').
	(#codigo -> aCountryCode).
	(#pais -> name)} asDictionary asJson
]

{ #category : #'as yet unclassified' }
SgCountryCodeRF >> countryName: aCountryCode [
	<get>
	<path: 'country/code/{aCountryCode}'>
	<produces: 'application/json'>
	| name |
	
	name := WALocale iso2Countries
		at: aCountryCode asUppercase
		ifAbsent: [ ^ {(#codigo -> aCountryCode).
			(#status -> 'KO').
			(#causa
				->
					('El código [{1}] no se encuentra en la base de datos'
						format: {aCountryCode}))} asDictionary asJson ].
	^ {(#codigo -> aCountryCode).
	(#status -> 'OK').
	(#pais -> name)} asDictionary asJson
]

{ #category : #'as yet unclassified' }
SgCountryCodeRF >> error: errorCode [
	<get>
	<path: 'error/{errorCode}'>
	<produces: 'application/html'>
	self requestContext
		respond: [ :response | 
			"| builder |
	builder := WAHtmlCanvas builder.
	builder
		rootBlock:
			[ :aRoot | aRoot addStyle: '/static-files/css/bootstrap.min.4.3.1..css' ].
	^ builder
		fullDocument: true;
		render: [ :html | html render: SgErr403View new ]"
			response
				forbidden;
				nextPutAll:
					('{1} No está autorizado'
						format: self session user nif) ]
]

{ #category : #'as yet unclassified' }
SgCountryCodeRF >> error: errorCode forUser: aNif [
	<get>
	<path: 'error/{errorCode}/{aNif}'>
	<produces: 'application/html'>
	self requestContext
		respond: [ :response | 
			"| builder |
	builder := WAHtmlCanvas builder.
	builder
		rootBlock:
			[ :aRoot | aRoot addStyle: '/static-files/css/bootstrap.min.4.3.1..css' ].
	^ builder
		fullDocument: true;
		render: [ :html | html render: SgErr403View new ]"
			response
				forbidden;
				nextPutAll: ('{1} No está autorizado' format: {aNif}) ]
]

{ #category : #handling }
SgCountryCodeRF >> handleFiltered: aRequestContext [
	| contextUser nif |
	Halt now.
	contextUser := SgUser fromHttpRequest: aRequestContext request.
	nif := contextUser nif.
	(aRequestContext request uri path includes: 'error')
		ifTrue: [ super handleFiltered: aRequestContext ].
	contextUser nif = '09759005X'
		ifTrue: [ super handleFiltered: aRequestContext ]
		ifFalse: [ aRequestContext
				respond: [ :response | 
					"redirectTo: ('/st/Services/error/403/{1}' format: {nif})"
					response
						status: WAResponse statusForbidden;
						contentType: WAMimeType textHtml;
						nextPutAll: ('El usuario con nif {1} no está autorizado' format: {nif}) ] ]
]
