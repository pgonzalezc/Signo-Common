Class {
	#name : #SgLiquidacion,
	#superclass : #SgTipoNrc,
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Signo-Common-Common'
}

{ #category : #accessing }
SgLiquidacion class >> instance [ 

	UniqueInstance ifNil: [ UniqueInstance := SgAutoliquidacion basicNew inicializaCodigo: 'AUT' descripcion: 'AutoLiquidación' ].
	^ UniqueInstance
]

{ #category : #'as yet unclassified' }
SgLiquidacion >> tieneIngreso [

	^ true
]
