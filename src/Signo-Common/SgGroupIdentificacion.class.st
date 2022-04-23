Class {
	#name : #SgGroupIdentificacion,
	#superclass : #WAComponent,
	#instVars : [
		'tipo',
		'identificacion'
	],
	#category : #'Signo-Common-Web'
}

{ #category : #'as yet unclassified' }
SgGroupIdentificacion >> callbackNif: unNif [

	Transcript show: ('callbackNif a recibido: {1}' format: { unNif} ); cr
]

{ #category : #initialization }
SgGroupIdentificacion >> initialize [ 

	super initialize.
	tipo := #pFisica
]

{ #category : #rendering }
SgGroupIdentificacion >> renderContentOn: html [
	html tbsRow: [ html tbsColumn: [ self renderNifCaptionOn: html ] mediumSize: 2.
							html
								tbsColumn: [ self renderRazonSocialOApellidosCaptionOn: html ]
								mediumSize: 6.
							tipo = #pFisica
								ifTrue: [ html tbsColumn: [ self renderNombreCaptionOn: html ] mediumSize: 4 ] ]
]

{ #category : #rendering }
SgGroupIdentificacion >> renderNifCaptionOn: html [
	html
		tbsFormGroup: [ html label
				for: 'nif';
				with: 'NIF'.
			html textInput
				tbsFormControl;
				callback: [ :value | self callbackNif: value ];
				id: 'NIF' ]
]

{ #category : #rendering }
SgGroupIdentificacion >> renderNombreCaptionOn: html [
	html
		tbsFormGroup: [ html label
				for: 'nombre';
				with: 'Nombre'.
			html textInput
				tbsFormControl;
				id: 'nombre' ]
]

{ #category : #rendering }
SgGroupIdentificacion >> renderRazonSocialOApellidosCaptionOn: html [
	html
		tbsFormGroup: [ html label
				for: 'razon-social-o-apellidos';
				with:
					(tipo = #pFisica
						ifTrue: [ 'Apellidos' ]
						ifFalse: [ 'Razón social' ]).
			html textInput
				tbsFormControl;
				id: 'razon-social-o-apellidos' ]
]

{ #category : #initialization }
SgGroupIdentificacion >> setTipo: unTipo [
	"Uno de los siguiente valores #pFisica o #pJuridica"
	tipo := unTipo
]
