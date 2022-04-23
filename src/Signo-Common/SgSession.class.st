Class {
	#name : #SgSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'announcer'
	],
	#category : #'Signo-Common-Web'
}

{ #category : #accessing }
SgSession >> announcer [ 

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #'as yet unclassified' }
SgSession >> logout [
	user := nil.
	
]

{ #category : #initialization }
SgSession >> setUser: aUser [

	user := aUser
]

{ #category : #'parent/child' }
SgSession >> unregistered [
	super unregistered.
	user := nil.
	announcer := nil
]

{ #category : #accessing }
SgSession >> user [ 

	^ user
]
