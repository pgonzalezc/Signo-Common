Class {
	#name : #SgIdentificacionPanel,
	#superclass : #WAComponent,
	#instVars : [
		'titulo',
		'tipo',
		'identificacion'
	],
	#category : #'Signo-Common-Web'
}

{ #category : #initialization }
SgIdentificacionPanel >> initialize [
	super initialize.
	titulo := 'Datos identificativos'.
	tipo := #pFisica.
]

{ #category : #rendering }
SgIdentificacionPanel >> renderContentOn: html [
	html tbsPanel beInfo
		with: [ html tbsPanelHeading: titulo.
			html
				tbsPanelBody: [ html
						tbsRow: [ html tbsColumn: [ self renderNifCaptionOn: html ] mediumSize: 2.
							html
								tbsColumn: [ self renderRazonSocialOApellidosCaptionOn: html ]
								mediumSize: 6.
							tipo = #pFisica
								ifTrue: [ html tbsColumn: [ self renderNombreCaptionOn: html ] mediumSize: 4 ] ]] ]
]

{ #category : #rendering }
SgIdentificacionPanel >> renderNifCaptionOn: html [
	html
		tbsFormGroup: [ html label
				for: 'nif';
				with: 'NIF'.
			html textInput
				tbsFormControl;
				id: 'NIF' ]
]

{ #category : #rendering }
SgIdentificacionPanel >> renderNombreCaptionOn: html [
	html tbsFormGroup: [ 
		html label for: 'nombre'; with: 'Nombre'.
		html textInput tbsFormControl; id: 'nombre' ]
]

{ #category : #rendering }
SgIdentificacionPanel >> renderRazonSocialOApellidosCaptionOn: html [
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

{ #category : #'private-initialization' }
SgIdentificacionPanel >> setTipo: unTipo [ 

	"Establece el tipo de identificación, puede ser de persona física #pFisica o de persona Jurídica #pJuridica"
	tipo := unTipo.
]

{ #category : #'private-initialization' }
SgIdentificacionPanel >> setTitulo: unaCadena [

	"Establece el titulo que se mostrará en la cabecera del panel"
	titulo := unaCadena
]
