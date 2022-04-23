Class {
	#name : #SgGroup117Liquidacion,
	#superclass : #WAComponent,
	#instVars : [
		'liquidacion',
		'base'
	],
	#category : #'Signo-Common-Web'
}

{ #category : #accessing }
SgGroup117Liquidacion >> base: aBaseComponent [

	base := aBaseComponent
]

{ #category : #'as yet unclassified' }
SgGroup117Liquidacion >> esImporteValido: unImporte [

	^ true
]

{ #category : #initialization }
SgGroup117Liquidacion >> initialize [
	super initialize.
	liquidacion := #(0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0).

]

{ #category : #rendering }
SgGroup117Liquidacion >> renderCabecerasOn: html [ 
	html
		tbsRow: [ html tbsColumn
				mediumOffset: 6;
				mediumSize: 3;
				with:
					'	Transmisiones o reembolsos acciones y participaciones representativas del capital o del patrimonio de las instituciones de inversión colectiva'.
			html
				tbsColumn: 'Transmisiones derechos de suscripción'
				mediumSize: 3 ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderContentOn: html [
	self renderCabecerasOn: html.
	self renderRICNumeroPerceptoresOn: html.
	self renderRICBaseRetencionesEIngresosACuentaOn: html.
	self renderRICRetencionesEIngresosACuentaOn: html.
	self renderPCBaseRetencionesEIngresosACuentaOn: html.
	self renderPCRetencioesEIngresosACuentaOn: html.
	self renderTLSumaOn: html.
	self renderTLADeducir: html.
	self renderResultadoAIngresarOn: html
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida01On: html [
	html
		tbsInputGroup: [ html tbsInputGroupAddOn: '01'.
			html textInput tbsFormControl
				id: '01';
				value: ((liquidacion at: 1) ifNil: [ 0 ]);
				callback: [ :value | liquidacion at: 1 put: value ] ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida02On: html [

	html tbsInputGroup: [ 
		html tbsInputGroupAddOn: '02'.
		html textInput tbsFormControl id: '02'
		 ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida03On: html [
	| ajax |
	ajax := html jQuery ajax.
	html
		tbsInputGroup: [ html tbsInputGroupAddOn: '03'.
			html textInput tbsFormControl
				id: '03';
				value: ((liquidacion at: 3) ifNil: [ 0.0 ]);
				onChange:
					(ajax
						callback: [ :unImporte | 
							(self esImporteValido: unImporte)
								ifTrue: [ liquidacion at: 3 put: unImporte asNumber.
									liquidacion at: 9 put: unImporte ] ]
							value: (html jQuery id: '03') value;
						script: [ :s | s << (s jQuery id: '09') value: (liquidacion at: 3) ]);
				callback: [ :value | liquidacion at: 3 put: value ] ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida04On: html [
	html
		tbsInputGroup: [ html tbsInputGroupAddOn: '04'.
			html textInput tbsFormControl id: '04' ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida05On: html [
	html
		tbsInputGroup: [ html tbsInputGroupAddOn: '05'.
			html textInput tbsFormControl id: '05' ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida06On: html [
	html
		tbsInputGroup: [ html tbsInputGroupAddOn: '06'.
			html textInput tbsFormControl id: '06' ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida07On: html [
	html
		tbsInputGroup: [ html tbsInputGroupAddOn: '07'.
			html textInput tbsFormControl id: '07' ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida08On: html [
		html
		tbsInputGroup: [ html tbsInputGroupAddOn: '08'.
			html textInput tbsFormControl id: '08' ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida09On: html [
	html
		tbsInputGroup: [ html tbsInputGroupAddOn: '09'.
			html textInput tbsFormControl
				id: '09';
				value: ((liquidacion at: 3) + (liquidacion at: 6) + (liquidacion at: 8));
				disabled: true ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida10On: html [
	
	html
		tbsInputGroup: [ html tbsInputGroupAddOn: '10'.
			html textInput tbsFormControl
				id: '10';
				disabled: base esComplementaria not ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderGroupPartida11On: html [
	html
		tbsInputGroup: [ html tbsInputGroupAddOn: '11'.
			html textInput tbsFormControl
				id: '11';
				disabled: true ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderPCBaseRetencionesEIngresosACuentaOn: html [
	html
		tbsRow: [ html space.
			html strong: 'B) Pago a cuenta ' ].
	html
		tbsRow: [ html
				tbsColumn: 'Base de las retenciones e ingresos a cuenta'
				mediumSize: 6.
			html tbsColumn: [ self renderGroupPartida07On: html ] mediumSize: 3 ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderPCRetencioesEIngresosACuentaOn: html [
	html
		tbsRow: [ html tbsColumn: 'Retenciones e ingresos a cuenta' mediumSize: 6.
			html tbsColumn: [ self renderGroupPartida08On: html ] mediumSize: 3 ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderRICBaseRetencionesEIngresosACuentaOn: html [
	html
		tbsRow: [ html
				tbsColumn: 'Base de las retenciones e ingresos a cuenta'
				mediumSize: 6.
			html tbsColumn: [ self renderGroupPartida02On: html ] mediumSize: 3.
			html tbsColumn: [ self renderGroupPartida05On: html ] mediumSize: 3 ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderRICNumeroPerceptoresOn: html [
	html
		tbsRow: [ html space.
			html strong: 'A) Retenciones e ingresos a cuenta ' ].
	html
		tbsRow: [ html tbsColumn: 'Número de perceptores' mediumSize: 6.
			html tbsColumn: [ self renderGroupPartida01On: html ] mediumSize: 3.
			html tbsColumn: [ self renderGroupPartida04On: html ] mediumSize: 3 ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderRICRetencionesEIngresosACuentaOn: html [
	html
		tbsRow: [ html tbsColumn: 'Retenciones e ingresos a cuenta' mediumSize: 6.
			html tbsColumn: [ self renderGroupPartida03On: html ] mediumSize: 3.
			html tbsColumn: [ self renderGroupPartida06On: html ] mediumSize: 3 ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderResultadoAIngresarOn: html [
	html
		tbsRow: [ html
				tbsColumn: [ html strong: 'Resultado a ingresar ([09] - [10])' ]
				mediumSize: 9.
			html tbsColumn: [ self renderGroupPartida11On: html ] mediumSize: 3 ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderTLADeducir: html [
	html
		tbsRow: [ html
				tbsColumn:
					'A deducir (exclusivamente en caso de declaración complementaria). Resultados a ingresar de anteriores declaraciones por el mismo concepto, ejercicio y periodo'
				mediumSize: 9.
			html tbsColumn: [ self renderGroupPartida10On: html ] mediumSize: 3 ]
]

{ #category : #rendering }
SgGroup117Liquidacion >> renderTLSumaOn: html [
	html
		tbsRow: [ html space.
			html strong: 'Total liquidación ' ].
	html
		tbsRow: [ html
				tbsColumn:
					'Suma de retenciones e ingresos a cuenta y regularización, en su caso ([03] + [06] + [08])'
				mediumSize: 9.
			html tbsColumn: [ self renderGroupPartida09On: html ] mediumSize: 3 ]
]
