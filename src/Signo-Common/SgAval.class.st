Class {
	#name : #SgAval,
	#superclass : #SgTipoNrc,
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Signo-Common-Common'
}

{ #category : #accessing }
SgAval class >> instance [

	UniqueInstance ifNil: [ UniqueInstance := SgAutoliquidacion basicNew inicializaCodigo: 'AUT' descripcion: 'AutoLiquidación' ].
	^ UniqueInstance
]

{ #category : #'as yet unclassified' }
SgAval >> tieneIngreso [

	^ false
]
