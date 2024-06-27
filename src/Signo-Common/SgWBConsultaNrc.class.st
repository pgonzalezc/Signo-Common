Class {
	#name : #SgWBConsultaNrc,
	#superclass : #WAComponent,
	#category : #'Signo-Common-Web'
}

{ #category : #rendering }
SgWBConsultaNrc >> renderContentOn: html [

	html div class: 'container'; with: [
		html heading
			level: 4;
			with: 'Aqui van las consultas de NRCs' ]
]
