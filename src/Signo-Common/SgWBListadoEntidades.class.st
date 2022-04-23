Class {
	#name : #SgWBListadoEntidades,
	#superclass : #WAComponent,
	#category : #'Signo-Common-Web'
}

{ #category : #rendering }
SgWBListadoEntidades >> renderContentOn: html [
	html
		tbsContainer: [ html heading
				level: 4;
				with: 'Aquí el listado de entidades' ]
]
