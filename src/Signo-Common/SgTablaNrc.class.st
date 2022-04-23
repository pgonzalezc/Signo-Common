Class {
	#name : #SgTablaNrc,
	#superclass : #Object,
	#category : #'Signo-Common-Tablas'
}

{ #category : #'as yet unclassified' }
SgTablaNrc class >> columnasDetalle [

	^ #(#nrc #tipo #estado #ejercicio #importe #modelo #fecha_generacion #fecha_consolidacion #fecha_ingreso #fecha_anulacion #extra_info)
]

{ #category : #'as yet unclassified' }
SgTablaNrc class >> detalleDe: unNrc [
	| conn columns stmt resp |
	conn := self pgConn.
	columns := $, join: self columnasDetalle.
	stmt := conn
		prepare: ('SELECT {1} FROM signo.nrc WHERE nrc = $1' format: {columns}).
	resp := stmt query: {unNrc}.
	stmt close.
	conn close.
	^ self columnasDetalle with: (resp data at: 1) collect: [ :a :b | a -> b ]
]

{ #category : #'as yet unclassified' }
SgTablaNrc class >> pgConn [

	"Devuelve la conexión por defecto a la base de datos"
	
	^ P3Client new url: 'psql://ratodalua:rat0da.ua@localhost:5432/pgonzalez'
]
