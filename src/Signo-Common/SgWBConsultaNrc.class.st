Class {
	#name : #SgWBConsultaNrc,
	#superclass : #WAComponent,
	#category : #'Signo-Common-Web'
}

{ #category : #rendering }
SgWBConsultaNrc >> renderContentOn: html [
	html
		tbsContainer: [ html heading
				level: 4;
				with: 'Aqui van las consultas de NRCs' ]
]
