Class {
	#name : #SgIdentificacionView,
	#superclass : #WAComponent,
	#instVars : [
		'title',
		'subtitle'
	],
	#category : #'Signo-Common-Web'
}

{ #category : #rendering }
SgIdentificacionView >> renderContentOn: html [
	
	html div
				class: 'container';
				with: [ html tbsWell beLarge with: 'Consulta Avanzada']
]
