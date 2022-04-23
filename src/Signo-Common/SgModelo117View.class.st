Class {
	#name : #SgModelo117View,
	#superclass : #WAComponent,
	#instVars : [
		'panels'
	],
	#category : #'Signo-Common-Web'
}

{ #category : #'as yet unclassified' }
SgModelo117View >> chldren [
	^ panels values
]

{ #category : #'as yet unclassified' }
SgModelo117View >> continuar [
	
]

{ #category : #'as yet unclassified' }
SgModelo117View >> esComplementaria [

	^ (panels at: #declaracionComplementaria) datosDeclaracionComplementaria complementaria 
]

{ #category : #'as yet unclassified' }
SgModelo117View >> esSustitutiva [
	^ (panels at: #declaracionComplementaria) sustitutiva
]

{ #category : #initialization }
SgModelo117View >> initialize [
	super initialize.
	panels := Dictionary new.
	panels
		at: #datosIdentificativos
		put: (SgGroupIdentificacion new setTipo: #pJuridica).
	panels
		at: #devengo
		put:
			SgGroupDevengo new activaInicioPeriodoImpositivo
				activaFinPeriodoImpositivo.
	panels at: #declaracionComplementaria put: SgGroupComplementaria new.
	panels at: #liquidacion put: (SgGroup117Liquidacion new base: self)
]

{ #category : #rendering }
SgModelo117View >> renderCabeceraDelModeloOn: html [
	html tbsWell
		with: self tituloDelModelo 
]

{ #category : #rendering }
SgModelo117View >> renderContentOn: html [
	html
		tbsContainer: [ self renderCabeceraDelModeloOn: html.
			html
				form: [ self renderDatosIdentificativosPanelOn: html.
					self renderPanelDevengoOn: html.
					self renderPanelLiquidacionOn: html.
					self renderPanelComplementariaOn: html.
					
					html tbsButton on: #continuar of: self ] ]
]

{ #category : #rendering }
SgModelo117View >> renderDatosIdentificativosPanelOn: html [
	html tbsPanel beInfo
		with: [ html tbsPanelHeading: 'Datos identificativos'.
			html
				tbsPanelBody: [ html render: (panels at: #datosIdentificativos) ] ]
]

{ #category : #rendering }
SgModelo117View >> renderPanelComplementariaOn: html [
	html tbsPanel beInfo
		with: [ html tbsPanelHeading: 'Declaración complementaria'.
			html tbsPanelBody: [ html render: (panels at: #declaracionComplementaria) ] ]
]

{ #category : #rendering }
SgModelo117View >> renderPanelDevengoOn: html [
	| grupoDevengo |
	grupoDevengo := panels at: #devengo.
	html tbsPanel beInfo
		with: [ html tbsPanelHeading: 'Devengo'.
			html tbsPanelBody: [ html render: grupoDevengo ] ]
]

{ #category : #rendering }
SgModelo117View >> renderPanelLiquidacionOn: html [
	html tbsPanel beInfo
		with: [ html tbsPanelHeading: 'Liquidación'.
			html tbsPanelBody: [ html render: (panels at: #liquidacion) ] ]
]

{ #category : #'as yet unclassified' }
SgModelo117View >> tituloDelModelo [

	^ 'Impuesto sobre la Renta de las Personas Físicas. IRPF e Impuesto sobre Sociedades e Impuestos sobre la Renta de no residentes. Retenciones e ingresos a cuenta/pago a cuenta sobre rentas o ganancias patrimoniales obtenidas como consecuencia de las transmisiones o reembolsos de acciones y participaciones representativas del capital o del patrimonio de las instituciones de inversión colectiva y de las transmisiones de derechos de suscripción. Modelo 117 - Autoliquidación.'
]

{ #category : #updating }
SgModelo117View >> updateRoot: aHtmlRoot [

	aHtmlRoot title: '117-M'.
	aHtmlRoot beHtml5 
]
