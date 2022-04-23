Class {
	#name : #SgIdentDecoration,
	#superclass : #WADecoration,
	#category : #'Signo-Common-Web'
}

{ #category : #action }
SgIdentDecoration >> doLogout [
	self session logout.
	
	self requestContext
		redirectTo: 'https://www.naupacto.es/signo-index.html'
]

{ #category : #rendering }
SgIdentDecoration >> renderContentOn: html [
	| user |
	user := self session user.
	user
		ifNotNil: [ html
				tbsRow: [ html tbsColumn
						mediumOffset: 6;
						mediumSize: 5;
						with: [ self renderDatosAutenticadoOn: html ].
					html tbsColumn
						mediumSize: 1;
						with: [ self renderLogoutButtonOn: html ] ] ].
	self renderNextOn: html
]

{ #category : #rendering }
SgIdentDecoration >> renderDatosAutenticadoOn: html [
	html
		strong:
			(String
				streamContents: [ :s | 
					s
						<< self session user nif;
						<< ' - ';
						<< self session user denominacion ])
]

{ #category : #rendering }
SgIdentDecoration >> renderLogoutButtonOn: html [
	html tbsButton
						beDefault;
						beSmall;
						attributeAt: 'data-toggle' put: 'tooltip';
						attributeAt: 'data-placement' put: 'bottom';
						callback: [ self doLogout ];
						value: [ html tbsGlyphIcon iconOff ]  
]
