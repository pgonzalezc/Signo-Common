Class {
	#name : #SgCountriesView,
	#superclass : #WAComponent,
	#category : #'Signo-Common-Web'
}

{ #category : #testing }
SgCountriesView class >> canBeRoot [

	^ true
]

{ #category : #'class initialization' }
SgCountriesView class >> initialize [ 
	
	WAAdmin register: self asApplicationAt: 'Country/Listado'.
]

{ #category : #hooks }
SgCountriesView >> initialRequest: aRequest [
	
	self session user
		ifNil: [ | dn cert matcher |
			dn := aRequest headers at: 'ssl_client_s_dn'.
			cert := aRequest headers at: 'ssl_client_cert'.
			matcher := '^CN=(.+),SN=.+$' asRegex.
			(matcher matches: dn)
				ifNotNil: [ | cn idx nif deno |
					cn := matcher subexpression: 2.
					idx := cn indexOfSubCollection: ' - '.
					deno := cn copyFrom: 1 to: idx.
					nif := cn copyFrom: idx + 3 to: cn size.
					self session
						setUser: ((SgUser forNif: nif denominacion: deno) setCredential: cert) ] ]
]

{ #category : #rendering }
SgCountriesView >> renderContentOn: html [
	| component |
	
	component := SgCountriesListView new
		addDecoration: SgIdentDecoration new;
		yourself.
	html form: [ html render: component ]
]

{ #category : #updating }
SgCountriesView >> updateRoot: aHtmlRoot [
	super updateRoot: aHtmlRoot.
	aHtmlRoot title: 'Lista de países'
]

{ #category : #updating }
SgCountriesView >> updateUrl: anUrl [

	Transcript show: anUrl; cr.
]
