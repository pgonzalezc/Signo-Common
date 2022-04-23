Class {
	#name : #SgModelo111View,
	#superclass : #WAComponent,
	#category : #'Signo-Common-Web'
}

{ #category : #testing }
SgModelo111View class >> canBeRoot [

	^ true
]

{ #category : #rendering }
SgModelo111View >> renderContentOn: html [
	html tbsContainer: [ self renderDatosIdentificativosPanelOn: html  ]
	
]

{ #category : #rendering }
SgModelo111View >> renderDatosIdentificativosPanelOn: html [ 

html tbsPanel beInfo
		with: [ html tbsPanelHeading: 'Datos identificativos'.
			html
				tbsPanelBody: [ html
						render:
							(SgGroupIdentificacion new
								addDecoration: SgM111IdentificacionDecoration new) ] ]
]
