Class {
	#name : #SgCountriesListView,
	#superclass : #WAComponent,
	#category : #'Signo-Common-Web'
}

{ #category : #rendering }
SgCountriesListView >> renderContentOn: html [
	| columnsBlock bodyBlock |
columnsBlock := [ html tableHeading: 'Código'.
			html tableHeading: 'Nombre' ].
			bodyBlock := [ WALocale iso2Countries
				associationsDo: [ :assoc | 
					html
						tableRow: [ html tableData: assoc key.
							html tableData: assoc value ] ] ].
			html div
				class: 'container';
				id: 'listado-paises';
				with: [ html heading
						level: 2;
						with: 'Paises y sus códigos ISO'.
					html
						tbsTable: [ html tableHead: columnsBlock.
							html tableBody: bodyBlock ] ] 
]

{ #category : #updating }
SgCountriesListView >> updateRoot: aHtmlRoot [
	super updateRoot: aHtmlRoot.
	aHtmlRoot title: 'Lista de países'
]
