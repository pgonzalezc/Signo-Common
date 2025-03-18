Class {
	#name : #SgSimpleServlet,
	#superclass : #WARequestHandler,
	#category : #'Signo-Common-Web'
}

{ #category : #'as yet unclassified' }
SgSimpleServlet class >> initialize [

	<script>
	WAAdmin register: self at: 'SimpleServlet' 
]

{ #category : #'error handling' }
SgSimpleServlet >> error: anError [

	^ WAHtmlCanvas builder fullDocument: true; 
		rootBlock: [ :aRoot | 
			aRoot beHtml5.
			aRoot meta charset: 'utf-8'.
			aRoot title: 'Lenguajes'.
			aRoot meta name: 'viewport'; content: 'width=device-width, initial-scale=1.0'.
			aRoot javascript url: '/static-files/js/jquery/jquery.min.js'.
			aRoot stylesheet url: '/static-files/css/materialize/materialize.min.css'
			 ];
		render: [ :html | 
			html div class: 'container'; with: [ 
				html heading level: 3; with: 'Error procesando los lenguajes'.
				html text: (String streamContents: [ :s | 
					s << ('Error: {1} descripcion: {2}' format: { anError class name . anError messageText }) ])
				 ]
		]
]

{ #category : #'as yet unclassified' }
SgSimpleServlet >> generaListaLenguajes [

	| tr |
	tr := '<tr><td>{1}</td><td>{2}</td></tr>'.
	^ String streamContents: [ :s |
		s << '<html><head><meta charset="utf-8"/><title>iso2 Languages</title></head><body>'.
		s << '<h2>Iso2 Languages</h2>'.
		s << '<table><thead><tr><th>Código</th><th>Lenguaje</th></tr></thead><tbody>'.
		WALocale iso2Languages associationsDo: [ :each | 
			s << (tr format: { each key . each value })
			 ].
		s << '</tbody></table></body></html>'
		]
	
]

{ #category : #handling }
SgSimpleServlet >> handleFiltered: aRequestContext [ 
	
	| lenguajes |
	[ lenguajes := self listaLenguajes. ]
		on: Error do: [ :ex | 
			^ aRequestContext respond: [ :response |
				response 
					status: WAResponse statusInternalServerError;
					contentType: WAMimeType textHtml ;
					nextPutAll: (self error: ex) ]
	 ].
	aRequestContext respond: [ :response |
		response  
			status: WAResponse statusOk;
			contentType: WAMimeType textHtml;
			nextPutAll: lenguajes ] 
]

{ #category : #'as yet unclassified' }
SgSimpleServlet >> listaLenguajes [

	1/0.
	^ WAHtmlCanvas builder fullDocument: true; 
		rootBlock: [ :aRoot | 
			aRoot beHtml5.
			aRoot meta charset: 'utf-8'.
			aRoot title: 'Lenguajes'.
			aRoot meta name: 'viewport'; content: 'width=device-width, initial-scale=1.0'.
			aRoot javascript url: '/static-files/js/jquery/jquery.min.js'.
			aRoot stylesheet url: '/static-files/css/materialize/materialize.min.css'
			 ];
		render: [ :html | 
			html heading level: 3; with: 'Listado de lenguajes'.
			html table: [ 
				html tableHead: [ html tableHeading: 'Código';tableHeading: 'Descripción'	 ].
				html tableBody:  [ 
					WALocale iso2Languages associationsDo: [ :each |  
						html tableRow: [ 
							html tableData: each key.
							html tableData: each value
						] ] ] ] ]
]
