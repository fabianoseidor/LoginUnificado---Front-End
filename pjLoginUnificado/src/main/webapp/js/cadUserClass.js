/**
 * Class de Cadastro de Mudanca Padrao
 */
class CadastroUser{
	
	constructor(){
		this.users                = {}; 
		this.pessoa               = {};
		this.idUserAplic          = 1;
		this.listaUserAplicativos = [];
	}
	
	/*************************************/
	/* funcoes de validadoes para osStep */
	/*************************************/
	validacaoAplicativos(){
		if(this.listaUserAplicativos.length < 1 ) return true;
		return false;
	}
	
	salvarUserAplicativos(){
		let userAplicativo = this.lerUserAplicativos();
		if( this.validaAplicativo( userAplicativo) ){
			this.adicionarUserAplicativos( userAplicativo );
			this.listaTabelaUserAplicativos( this.listaUserAplicativos );
			this.LimparTelaUserAplicativos();
		}
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	adicionarUserAplicativos( aplicativo ){
		this.listaUserAplicativos.push( aplicativo );
	    this.idUserAplic++;
	}
	
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	lerUserAplicativos(){
		let userAplicativo = {};
		userAplicativo.idUserAplic = this.idUserAplic;
		userAplicativo.admin       = document.getElementById( 'selectAdmin'    ).value;
		userAplicativo.aprovador   = document.getElementById( 'selectAprovador').value;
		userAplicativo.executor    = document.getElementById( 'selectExecutor' ).value;
		userAplicativo.owner       = document.getElementById( 'selectOwner'    ).value;
		/// Informacoes do aplicativo
		userAplicativo.idAplicacao           = document.getElementById( 'idAplicacao'           ).value;
		userAplicativo.nomeAplicacao         = document.getElementById( 'nomeAplicacao'         ).value;
		userAplicativo.departamentoAplicacao = document.getElementById( 'departamentoAplicacao' ).value;
		userAplicativo.urlAplicacao          = document.getElementById( 'urlAplicacao'          ).value;

        return userAplicativo;
	}

	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	listaTabelaUserAplicativos( aplicativo ){
		let tbody = document.getElementById('tbAplicativo');
		tbody.innerText = '';
		
		for(let i = 0; i < aplicativo.length; i++){
			
			let tr = tbody.insertRow();
			
	        let td_nomeAplicacaoShow   = tr.insertCell();
	        let td_departAplicacaoShow = tr.insertCell();
	        let td_urlAplicacaoShow    = tr.insertCell();
	        let td_adminShow           = tr.insertCell();
			let td_aprovadorShow       = tr.insertCell();
			let td_executorShow        = tr.insertCell();
			let td_ownerShow           = tr.insertCell();
	        let td_delete              = tr.insertCell();
	        
	         // Inseri os valores do objeto nas celulas
	        td_nomeAplicacaoShow.innerText   = ( aplicativo[i].nomeAplicacao         !== undefined ? aplicativo[i].nomeAplicacao         : '' );
	        td_departAplicacaoShow.innerText = ( aplicativo[i].departamentoAplicacao !== undefined ? aplicativo[i].departamentoAplicacao : '' );
	        td_urlAplicacaoShow.innerText    = ( aplicativo[i].urlAplicacao          !== undefined ? aplicativo[i].urlAplicacao          : '' );
	        td_adminShow.innerText           = ( aplicativo[i].admin                 === "1"         ? 'X'                               : '' );
			td_aprovadorShow.innerText       = ( aplicativo[i].aprovador             === "1"         ? 'X'                               : '' );
			td_executorShow.innerText        = ( aplicativo[i].executor              === "1"         ? 'X'                               : '' );
			td_ownerShow.innerText           = ( aplicativo[i].owner                 === "1"         ? 'X'                               : '' );

				        
	        let imgDelete = document.createElement('img');
	        imgDelete.src = this.getContextPath() +'/imagens/delete-40.png';
			imgDelete.setAttribute('style', 'cursor:pointer;' );
	        imgDelete.setAttribute('onclick','cadastroUser.deleteAplicativo( ' +  aplicativo[i].idUserAplic + ' )');
	        td_delete.appendChild(imgDelete);
				        
	        td_delete.classList.add       ('center');
			td_adminShow.classList.add    ('center');
			td_aprovadorShow.classList.add('center');
			td_executorShow.classList.add ('center');
			td_ownerShow.classList.add    ('center');
	    }
	}
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	LimparTelaUserAplicativos() {

		$('#selectAplicacao'      ).get(0).selectedIndex = 0;
		$('#selectAdmin'          ).get(0).selectedIndex = 0;
		$('#selectAprovador'      ).get(0).selectedIndex = 0;
		$('#selectExecutor'       ).get(0).selectedIndex = 0;
		$('#selectOwner'          ).get(0).selectedIndex = 0;
		$("#idAplicacao"          ).val("");
		$("#nomeAplicacao"        ).val("");
		$("#departamentoAplicacao").val("");
		$("#urlAplicacao"         ).val("");
		$("#descricaoAplicacao"   ).val("");
	}
	
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	deleteAplicativo ( id ){

	    Swal.fire({
		     title: "Deletar",
		     text: "Deseja realmente excluir o Recurso da lista de Cadastro?",
		     icon: "warning",
		     showCancelButton   : true,
		     confirmButtonColor : "#3085d6",
		     cancelButtonColor  : "#d33",
		     cancelButtonText   : "Cancelar",
		     confirmButtonText  : "Exclui"
		}).then((result) => {
		  if (result.isConfirmed) {
			  let tbody = document.getElementById('tbAplicativo');
			  			  
			  for(let i = 0; i < this.listaUserAplicativos.length; i++){
				  if( this.listaUserAplicativos[i].idUserAplic === id ){
					  this.listaUserAplicativos.splice(i, 1);
					  tbody.deleteRow(i);
					  break;
				  }
			  }
			  
		  }
		});
	}
		
	/******************************************************************/
	/*                                                                */
	/******************************************************************/
	validaAplicativo( aplicativo ){
		let msg = null;
		if( aplicativo.idAplicacao == ''){
		   msg = 'Favor Selecionar um Aplicativo!';
		}

		for(let i = 0; i < this.listaUserAplicativos.length; i++){
		  if( this.listaUserAplicativos[i].idAplicacao === aplicativo.idAplicacao ){
		      msg = 'Esta Aplicação já foi selecionado!';
		      break;
		  }
		}
		        
	    if(msg != null){
		   // alert(msg);
		   this.MensagemConfimacao( "warning", "validação Aplicação", msg ); 
	       return false;
	    }
		
		 return true;
	}
	
	
	/*************************************/
	/*                                   */
	/*************************************/
	/*************************************************************************************************************************/
	/*                                                                                                                       */
	/* Trata as informacoes de "Clientes afetados" no Step 3, para Adicionar, Editar e Deletar dentro do Arrey               */
	/*                                                                                                                       */
	/*************************************************************************************************************************/
	
	// Chama a API para salvar a Mudança Padrao na base de Dados.
	salvarUsers(){
		this.adicionarUsers();
	}
	
	// Adiciona as informacoes da tela no Objeto
	adicionarUsers(){
		this.users = this.lerDadosUser();
	}
	
	// Adiciona as informacoes do STEP 1 nos atributos do objeto;
	lerDadosUser(){
		let user = {};
		/* Dados de Identificação da Mudança */
        user.login         = document.getElementById( 'login' ).value;
		user.loginCadastro = document.getElementById( 'loginCadastro' ).value;
        user.passoword     = CryptoJS.MD5( document.getElementById   ( 'senha' ).value );
        user.role          = document.getElementById( 'rule'  ).value;
		  
        return user;
	}

    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /* Trata as informacoes de "Clientes afetados" no Step 3, para Adicionar, Editar e Deletar dentro do Arrey               */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
	// Chama a API para salvar a Mudança Padrao na base de Dados.
	salvarPessoa(){
		this.adicionarPessoa();
	}

	// Adiciona as informacoes da tela no Objeto
	adicionarPessoa(){
		this.pessoa = this.lerPessoa();
	}

	// Adiciona as informacoes do STEP 1 nos atributos do objeto;
	lerPessoa(){
		let pessoa = {};
		/* Dados de Identificação da Mudança */
	    pessoa.nome_pessoa    = document.getElementById( 'nomePessoa'  ).value;
	    pessoa.email          = document.getElementById( 'email'       ).value;
	    pessoa.primeiroAcesso = true;
		pessoa.cpf            = document.getElementById( 'cpf'         ).value;
		pessoa.logradouro     = document.getElementById( 'endereco'    ).value;
		pessoa.complemento    = document.getElementById( 'complemento' ).value;		
		pessoa.numero         = document.getElementById( 'numero'      ).value;
		pessoa.bairro         = document.getElementById( 'bairro'      ).value;
		pessoa.cidade         = document.getElementById( 'cidade'      ).value;
		pessoa.cep            = document.getElementById( 'cep'         ).value;
					      
	    return pessoa;
	}
 
    /*************************************************************************************************************************/
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*                                                                                                                       */
    /*************************************************************************************************************************/
    mostraResumoTela(){
		this.montaResumoDadosLogin();
		this.montaResumoDadosPessoa();
		this.montaResumoDadosAplicacao();
	}
	montaResumoDadosLogin(){
		let tbody       = document.getElementById('TbodyShowDadosLogin');
		tbody.innerText = '';
		let tr          = tbody.insertRow();

		let td_login         = tr.insertCell();
		let td_senha         = tr.insertCell();
		let td_confirmeSenha = tr.insertCell();
		let td_perfilUser    = tr.insertCell();
		
		td_login.innerText         = ( this.users.login !== undefined ? this.users.login : '' );
		td_senha.innerText         = '*******';
		td_confirmeSenha.innerText = '*******';
		td_perfilUser.innerText    = ( this.users.role  !== undefined ? this.users.role  : '' );
	}

	montaResumoDadosPessoa(){
		let tbody       = document.getElementById('TbodyShowPessoa');
		tbody.innerText = '';
		let tr          = tbody.insertRow();

		let td_nomePessoa  = tr.insertCell();
		let td_email       = tr.insertCell();
		let td_cpf         = tr.insertCell();
		let td_cep         = tr.insertCell();
		let td_endereco    = tr.insertCell();
		let td_numero      = tr.insertCell();
		let td_complemento = tr.insertCell();
		let td_bairro      = tr.insertCell();
		let td_cidade      = tr.insertCell();
		
		td_nomePessoa.innerText  = ( this.pessoa.nome_pessoa !== undefined ? this.pessoa.nome_pessoa : '' );
		td_email.innerText       = ( this.pessoa.email       !== undefined ? this.pessoa.email       : '' );
		td_cpf.innerText         = ( this.pessoa.cpf         !== undefined ? this.pessoa.cpf         : '' );
		td_cep.innerText         = ( this.pessoa.cep         !== undefined ? this.pessoa.cep         : '' );
		td_endereco.innerText    = ( this.pessoa.logradouro  !== undefined ? this.pessoa.logradouro  : '' );
		td_numero.innerText      = ( this.pessoa.numero      !== undefined ? this.pessoa.numero      : '' );
		td_complemento.innerText = ( this.pessoa.complemento !== undefined ? this.pessoa.complemento : '' );
		td_bairro.innerText      = ( this.pessoa.bairro      !== undefined ? this.pessoa.bairro      : '' );
		td_cidade.innerText      = ( this.pessoa.cidade      !== undefined ? this.pessoa.cidade      : '' );
	}

   	montaResumoDadosAplicacao(){
		let tbody = document.getElementById('TbodyShowAplicacao');
		tbody.innerText = '';
		for(let i = 0; i < this.listaUserAplicativos.length; i++){
			// Cria as linhas
		    let tr = tbody.insertRow();
		    
		    // Crias as celulas
		    let td_idAplicacao   = tr.insertCell();
		    let td_nomeAplicacao = tr.insertCell();
		    let td_departAplic   = tr.insertCell();
		    let td_urlAplicacao  = tr.insertCell();
			let td_admin         = tr.insertCell();
			let td_aprovador     = tr.insertCell();
			let td_executor      = tr.insertCell();
			let td_owner         = tr.insertCell();

		    // Inseri os valores do objeto nas celulas
		    td_idAplicacao.innerText   = ( this.listaUserAplicativos[i].idAplicacao           !== undefined ? this.listaUserAplicativos[i].idAplicacao           : '' );
		    td_nomeAplicacao.innerText = ( this.listaUserAplicativos[i].nomeAplicacao         !== undefined ? this.listaUserAplicativos[i].nomeAplicacao         : '' );
		    td_departAplic.innerText   = ( this.listaUserAplicativos[i].departamentoAplicacao !== undefined ? this.listaUserAplicativos[i].departamentoAplicacao : '' );
		    td_urlAplicacao.innerText  = ( this.listaUserAplicativos[i].urlAplicacao          !== undefined ? this.listaUserAplicativos[i].urlAplicacao          : '' );
		    td_admin.innerText         = ( this.listaUserAplicativos[i].admin                 === "1"         ? 'X'                                              : '' );
		    td_aprovador.innerText     = ( this.listaUserAplicativos[i].aprovador             === "1"         ? 'X'                                              : '' );
		    td_executor.innerText      = ( this.listaUserAplicativos[i].executor              === "1"         ? 'X'                                              : '' );
		    td_owner.innerText         = ( this.listaUserAplicativos[i].owner                 === "1"         ? 'X'                                              : '' );
			
			td_admin.classList.add    ('center');
			td_aprovador.classList.add('center');
			td_executor.classList.add ('center');
			td_owner.classList.add    ('center');

		}
	}

	/******************************************************************/
	/*                                                                */
	/*                                                                */
	/******************************************************************/
	getDadosApi(){
		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let list_UserAplicativos = [];
		for(let i = 0; i < this.listaUserAplicativos.length; i++){
		    let l_UserAplicativos = { admin     : (this.listaUserAplicativos[i].admin     === "1" ? true : false ) 
				                    , aprovador : (this.listaUserAplicativos[i].aprovador === "1" ? true : false ) 
									, executor  : (this.listaUserAplicativos[i].executor  === "1" ? true : false )
									, owner     : (this.listaUserAplicativos[i].owner     === "1" ? true : false )
				                    , aplicacao : {id_aplicacao: this.listaUserAplicativos[i].idAplicacao        } 
		                            };
            list_UserAplicativos.push(l_UserAplicativos);
		}
		
		////////////////////////////////////////////////////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////////////////
		let dadostUser =     {
		    login           :   this.users.login                      ,
 	   	    passoword       :   this.users.passoword.toString()       ,
			login_cadastro  :   this.users.loginCadastro              ,
			role            :   this.users.role                       ,
			pessoa          : { nome_pessoa: this.pessoa.nome_pessoa
				              , email      : this.pessoa.email
							  , cpf        : this.pessoa.cpf
							  , logradouro : this.pessoa.logradouro
							  , complemento: this.pessoa.complemento
                              , numero     : this.pessoa.numero
							  , bairro     : this.pessoa.bairro
							  , cidade     : this.pessoa.cidade
							  , cep        : this.pessoa.cep
				              }                                       ,
			userAplicativos : list_UserAplicativos                    ,
 	   	};  


 	   	return dadostUser;     

	}

    salvarUser(){
	let dados = this.getDadosApi();

    let urlBase = document.getElementById('urlAPILogin').value;
    let urlAPI  = urlBase + 'salvarUsers';

		
	// console.log(  JSON.stringify( dados ) );
	
		$.ajax({
			method : "POST",
//			url    : "http://localhost:8090/loginUnificado/salvarUsers",
			url    : urlAPI,
			data   : JSON.stringify(dados),
			contentType : "application/json; charset=utf-8",
			success : function(response) {

			    Swal.fire({
				    icon  : "success"                             ,
				    title : "Cadastro User"                        ,
				    text  : "Usuário( "+ response.pessoa.nome_pessoa + " )cadastrada com sucesso!" ,
				    }
				);				
			}	
		}).fail(function(xhr) {
			if (xhr.status == 500){
			            var answer = xhr.responseText; //adiciona o que foi carregado a uma variável
			            var patients = JSON.parse(answer); //converte o que foi carregado para um objeto javascript
//						alert(  patients.status + ' - '+ patients.message + ' - '+ patients.path + ' - '+ patients.error )
						let msnErro = 'Codego Erro: ' + patients.status + ' / Mensagem erro: ' + patients.message;
						
						Swal.fire({
									icon  : "error"        ,
									title : patients.error ,
									text  : msnErro        ,
								  });
		  }else{ 
			Swal.fire({
			    icon  : "error"                             ,
			    title : "Cadastro User"                        ,
			    text  : "Erro ao salvar User: " + xhr.responseText ,
			    }
			);				
          }
			document.getElementById("btSalvarUser").disabled = false; 
		});
		
	}
	 
    getContextPath() {
       return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    }
    
    MensagemConfimacaoModal( iconi, tituloPrincipal, textoPrincipal, nomeModal ) {  
// icon
//  	"warning"
//  	"error"
//  	"success"
//  	"info"

	  Swal.fire({
		    icon  : iconi                             ,
		    title : tituloPrincipal                   ,
		    text  : textoPrincipal                    ,
		    target: document.getElementById(nomeModal),
		    }
		);
	
   }
   
   MensagemConfimacao( iconi, tituloPrincipal, textoPrincipal ) {
// icon
//	  	"warning"
//	  	"error"
//	  	"success"
//	  	"info"

		  Swal.fire({
			    icon  : iconi                             ,
			    title : tituloPrincipal                   ,
			    text  : textoPrincipal                    ,
			    }
			);
		
   }
   FormataStringData(data) {
       var dia  = data.split("/")[0];
       var mes  = data.split("/")[1];
       var ano  = data.split("/")[2];

      return ano + '-' + ("0"+mes).slice(-2) + '-' + ("0"+dia).slice(-2);
     // Utilizo o .slice(-2) para garantir o formato com 2 digitos.
   }	
}


var cadastroUser = new CadastroUser() 