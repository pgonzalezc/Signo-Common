Class {
	#name : #SgGroupComplementaria,
	#superclass : #WAComponent,
	#instVars : [
		'admiteSustitutiva',
		'complementaria',
		'activosSiComplementaria'
	],
	#category : #'Signo-Common-Web'
}

{ #category : #accessing }
SgGroupComplementaria >> admiteSustitutiva [

	admiteSustitutiva := true
]

{ #category : #'as yet unclassified' }
SgGroupComplementaria >> callbackComplementaria: aBoolean [
	self datosDeclaracionComplementaria complementaria: aBoolean.
	self datosDeclaracionComplementaria complementaria 
		ifFalse: [ self datosDeclaracionComplementaria nroJustificanteAnterior: nil ]
]

{ #category : #'as yet unclassified' }
SgGroupComplementaria >> callbackNroJustificanteAnterior: unNroJustificante [

	self datosDeclaracionComplementaria nroJustificanteAnterior: unNroJustificante 
]

{ #category : #'as yet unclassified' }
SgGroupComplementaria >> datosDeclaracionComplementaria [
	
	complementaria
		ifNil: [ complementaria := SgDatosDeclaracionComplementaria new ].
	^ complementaria
]

{ #category : #'as yet unclassified' }
SgGroupComplementaria >> habilitaCampo: unId on: jQuery [
	| item |
	
	item := (jQuery id: unId)
		propertyAt: 'disabled'
		put: ((jQuery id: 'es-complementaria') propertyAt: 'checked') not.
	^ item
]

{ #category : #initialization }
SgGroupComplementaria >> initialize [
	super initialize.
	admiteSustitutiva := false.
	activosSiComplementaria := #('10' 'nro-justificante-anterior')
]

{ #category : #rendering }
SgGroupComplementaria >> renderCaptionNroJustificanteAnteriorOn: html [
	html
		tbsFormGroup: [ html label
				for: 'nro-justificante-anterior';
				with: 'Nº de justificante'.
			html textInput tbsFormControl
				id: 'nro-justificante-anterior';
				value: self datosDeclaracionComplementaria nroJustificanteAnterior;
				callback: [ :value | self callbackNroJustificanteAnterior: value ];
					disabled: self datosDeclaracionComplementaria complementaria not ]
]

{ #category : #rendering }
SgGroupComplementaria >> renderContentOn: html [
	"	s << (jq id: '10')
										propertyAt: 'disabled'
										put: ((jq id: 'es-complementaria') propertyAt: 'checked') not.
									s
										<<
											((html jQuery id: 'nro-justificante-anterior')
												propertyAt: 'disabled'
												put: ((html jQuery id: 'es-complementaria') propertyAt: 'checked') not)."

	"s
										<< ((html jQuery id: 'nro-justificante-anterior') value: '')"

	| jq |
	jq := html jQuery.
	html
		tbsRow: [ html
				tbsColumn: self textoAutoliquidacionComplementaria
				mediumSize: 8.
			html
				tbsColumn: [ html checkbox
						id: 'es-complementaria';
						callback: [ :value | self callbackComplementaria: value ];
						value: self datosDeclaracionComplementaria complementaria;
						onChange:
							(html jQuery
								script: [ :s | 
									activosSiComplementaria
										do: [ :each | 
	
											s << (self habilitaCampo: each on: jq).
											"s << (jq id: each)
												propertyAt: 'disabled'
												put: ((jq id: 'es-complementaria') propertyAt: 'checked') not."
											s << ((html jQuery id: each) value: '') ] ]).
					html space.
					html text: 'Declaración complementaria' ]
				mediumSize: 3 ].
	html break.
	html
		tbsRow: [ html
				tbsColumn:
					'En este caso, consigne a continuación el Número de justificante de la declaración anterior.'
				mediumSize: 8.
			html
				tbsColumn: [ self renderCaptionNroJustificanteAnteriorOn: html ]
				mediumSize: 3 ]
]

{ #category : #'as yet unclassified' }
SgGroupComplementaria >> textoAutoliquidacionComplementaria [

	^ 'Si esta autoliquidación es Complementaria de otra autoliquidación anterior correspondiente al mismo concepto, ejercicio y período, indíquelo marcando esta casilla.'
]
