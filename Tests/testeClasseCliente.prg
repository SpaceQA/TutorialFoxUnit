**********************************************************************
DEFINE CLASS TesteClasseCliente as FxuTestCase OF FxuTestCase.prg
**********************************************************************

	#IF .f.
	LOCAL THIS AS TesteClasseCliente OF TesteClasseCliente.PRG
	#ENDIF
	
	ioCliente = .NULL.
*!*		icTestPrefix = 'Teste'
	
	********************************************************************
	FUNCTION Setup
	********************************************************************
	
		THIS.ioCliente = NEWOBJECT('cliente', 'cliente.vcx')
		
	********************************************************************
	ENDFUNC
	********************************************************************
	
	********************************************************************
	FUNCTION TearDown
	********************************************************************
	
		this.ioCliente = .NULL.   
		
	********************************************************************
	ENDFUNC
	********************************************************************	
    	
    *********************************************************************
	FUNCTION VerificaSeObjetoClienteFoiCriado
	*********************************************************************
	
		* Verifica se a instancia da classe Cliente foi criada
		bResultado = THIS.AssertNotNull(THIS.ioCliente, ;
			"Objeto n�o foi instanciado na fun��o Setup()")
			
	*********************************************************************
	ENDFUNC
	*********************************************************************
	
	*********************************************************************
	FUNCTION TesteFuncaoRetornaClientes
	*********************************************************************
	
		* Teste unit�rio para fun��o retorna_clientes.
		* Caso os clientes sejam obtidos os mesmos
		* s�o listados na aba Messages
		LOCAL aClientes AS ARRAY
		THIS.ioCliente.retorna_clientes(@aClientes)
		
		bResultado = THIS.AssertNotNull(aClientes)
		
		IF bResultado THEN
			FOR i = 1 TO ALEN(aClientes)
				THIS.MessageOut(aClientes[i])
			ENDFOR		
		ENDIF
		
			
	*********************************************************************
	ENDFUNC
	*********************************************************************	
	
	*********************************************************************
	FUNCTION TesteFuncaoBuscaCliente
	*********************************************************************

		* Teste unit�rio para fun��o busca_cliente.
		sResultado = THIS.ioCliente.busca_cliente('Cliente5')		
		THIS.AssertEquals('Cliente5', sResultado)		

	*********************************************************************
	ENDFUNC
	*********************************************************************
	
	*********************************************************************
	FUNCTION VerificaSeInstanciaDaClasseEObjeto
	*********************************************************************

		bResultado = THIS.AssertIsObject(THIS.ioCliente)
		
		IF bResultado THEN
			THIS.MessageOut('A instancia � um objeto')
		ENDIF
			
	*********************************************************************
	ENDFUNC
	*********************************************************************
	
	*********************************************************************
	FUNCTION ObtemValoresDoBancoDeDados
	*********************************************************************

		this.AssertNotImplemented('Teste n�o implementado!')
			
	*********************************************************************
	ENDFUNC
	*********************************************************************	

**********************************************************************
ENDDEFINE
**********************************************************************
