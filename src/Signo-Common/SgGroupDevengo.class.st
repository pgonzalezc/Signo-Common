Class {
	#name : #SgGroupDevengo,
	#superclass : #WAComponent,
	#instVars : [
		'conInicioPeriodoImpositivo',
		'conFinPeriodoImpositivo',
		'devengo'
	],
	#category : #'Signo-Common-Web'
}

{ #category : #'as yet unclassified' }
SgGroupDevengo >> activaFinPeriodoImpositivo [
	conFinPeriodoImpositivo := true
]

{ #category : #'as yet unclassified' }
SgGroupDevengo >> activaInicioPeriodoImpositivo [
	conInicioPeriodoImpositivo  := true
]

{ #category : #'as yet unclassified' }
SgGroupDevengo >> callbackEjercicio: unEjercicio [
	Transcript
		show: ('callbackEjercicio a recibido: {1}' format: {unEjercicio});cr
]

{ #category : #initialization }
SgGroupDevengo >> initialize [
	super initialize.
	conInicioPeriodoImpositivo  := false.
	conFinPeriodoImpositivo := false
]

{ #category : #'as yet unclassified' }
SgGroupDevengo >> listaPeriodos [

	^ #(#enero #febrero #marzo #abril #mayo #junio #julio #agosto #septiembre #noviembre #diciembre)
]

{ #category : #rendering }
SgGroupDevengo >> renderCaptionEjerccioOn: html [
	html
		tbsFormGroup: [ html label
				for: 'ejercicio';
				with: 'Ejercicio'.
			html textInput tbsFormControl 
			id: 'ejercicio';
			callback: [ :value | self callbackEjercicio: value ] ]
]

{ #category : #rendering }
SgGroupDevengo >> renderCaptionFinPeriodoImpositivo: html [
	html
		tbsFormGroup: [ html label
				for: 'fin-periodo-impositivo';
				with: 'Fecha fin periodo impositivo'.
			html dateInput5 tbsFormControl id: 'fin-periodo-impositivo' ]
]

{ #category : #rendering }
SgGroupDevengo >> renderCaptionInicioPeriodoImpositvoOn: html [
	html
		tbsFormGroup: [ html label
				for: 'inicio-periodo-impositivo';
				with: 'Fecha inicio periodo impositivo'.
			html dateInput5
				class: 'form-control';
				id: 'inicio-periodo-impositivo' ]
]

{ #category : #rendering }
SgGroupDevengo >> renderCaptionPeriodoOn: html [
	html
		tbsFormGroup: [ html label
				for: 'periodo';
				with: 'Periodo'.
			html select
				id: 'periodo';
				class: 'form-control';
				list: self listaPeriodos ]
]

{ #category : #rendering }
SgGroupDevengo >> renderContentOn: html [

	html
		tbsRow:
			[ html tbsColumn: [ self renderCaptionEjerccioOn: html ] mediumSize: 2.
			html tbsColumn: [ self renderCaptionPeriodoOn: html ] mediumSize: 2.
			conInicioPeriodoImpositivo
				ifTrue: [ html
						tbsColumn: [ self renderCaptionInicioPeriodoImpositvoOn: html ]
						mediumSize: 3 ].
			conFinPeriodoImpositivo
				ifTrue: [ html
						tbsColumn: [ self renderCaptionFinPeriodoImpositivo: html ]
						mediumSize: 3 ] ]
]
