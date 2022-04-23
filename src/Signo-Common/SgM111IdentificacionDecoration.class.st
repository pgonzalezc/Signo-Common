Class {
	#name : #SgM111IdentificacionDecoration,
	#superclass : #WADecoration,
	#instVars : [
		'value'
	],
	#category : #'Signo-Common-Web'
}

{ #category : #rendering }
SgM111IdentificacionDecoration >> renderContentOn: html [
	self renderNextOn: html.
	html checkbox.
	html space.
	html text: 'Autoliquidación presentada por la Administración para declarar e ingresar las retenciones correspondientes al personal docente del centro concertado cuyo NIF figura en este modelo.'
]
