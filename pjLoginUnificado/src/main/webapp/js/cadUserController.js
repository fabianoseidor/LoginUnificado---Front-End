
listAplicacao( 0 );	



  function desabilitaBotaoSalvar(){
	document.getElementById("btSalvarUser").disabled = true;
  }

 window.onload=function(){
	 document.getElementById("selectAdmin"    ).disabled=true;
	 document.getElementById("selectAprovador").disabled=true;
	 document.getElementById("selectExecutor" ).disabled=true;
	 document.getElementById("selectOwner"    ).disabled=true;
	
	 document.getElementById("selectAplicacao").onchange=function(){
		
		funcSelectAplicacao();
		
		let indexSelect = document.getElementById   ( "selectAplicacao" ).value; 
		let conteudo    = $('#selectAplicacao').find ( ":selected").text( );
	    
		if( indexSelect === 2 || conteudo.trim() == 'Gestao de GMUD' ){
			$('#selectAdmin').get(0).selectedIndex = 0;
			document.getElementById("selectAdmin"    ).disabled = true;
			document.getElementById("selectAprovador").disabled = false;
			document.getElementById("selectExecutor" ).disabled = false;
			document.getElementById("selectOwner"    ).disabled = false;
		}else if( indexSelect === 1 || conteudo.trim() == 'Gestao de Contratos' ){
			document.getElementById("selectAdmin"    ).disabled = false;
			document.getElementById("selectAprovador").disabled = true;
			document.getElementById("selectExecutor" ).disabled = true;
			document.getElementById("selectOwner"    ).disabled = true;	
			$('#selectAprovador').get(0).selectedIndex = 0;
			$('#selectExecutor' ).get(0).selectedIndex = 0;
			$('#selectOwner'    ).get(0).selectedIndex = 0;			
		}
	 }

  }
    $(document).ready(function(){
        //Esconde todos os passos e exibe o primeiro ao carregar a página 
        $('.step').hide();
        $('.step').first().show();

        //Exibe no topo em qual passo estamos pela ordem da div que esta visivel
        var passoexibido = function(){
            var index = parseInt($(".step:visible").index());
            // alert("index: " + index + " - Total: " + $(".step").length );
            let legendaPasso = '';
            
            if(index == 0){
                //Se for o primeiro passo desabilita o botão de voltar
                $("#prev").prop('disabled',true);
            }else if(index == (parseInt($(".step").length)-1)){
                //Se for o ultimo passo desabilita o botão de avançar
                $("#next").prop('disabled',true);
            }else{
                //Em outras situações os dois serão habilitados
                $("#next").prop('disabled',false);            
                $("#prev").prop('disabled',false);
            }
            if( index === 0 ){
    			legendaPasso = index + 1 + ' ( Informações de Login )';
    		}else if( index === 1 ){
    			legendaPasso = index + 1 + ' ( Informações do Usuário )';
    		}else if( index === 2 ){
    			legendaPasso = index + 1 + ' ( Aplicação Associada ao Login )';
    		}else if( index === 3 ){
				legendaPasso = index + 1 + ' ( Revisão )';
			}
            
            $("#passo").html( legendaPasso );

        };
        
        //Executa a função ao carregar a página
        passoexibido();

        /* avança para o próximo passo ( Verssao original! )
        $("#next").click(function(){
            $(".step:visible").hide().next().show();
            passoexibido();
        });
        */
        
    //avança para o próximo passo
    $("#next").click(function(){
		
		var index = parseInt($(".step:visible").index()) ;
//		alert('index: ' + index);
        if( index === 0 ){
			if( validaStep('.step_1_validar', 0 ) ){
			    if( verifica() ){
			        cadastroUser.salvarUsers();
                    $(".step:visible").hide().next().show();
                    passoexibido();
			   }
            }
		}else if( index === 1 ){
			if(validaStep('.step_2_validar', 0 )){
				cadastroUser.salvarPessoa();
               $(".step:visible").hide().next().show();
               passoexibido();
			}
			
		}else if( index === 2 ){
			   if( cadastroUser.validacaoAplicativos() ){
			       MensagemConfimacao( "warning", "Validação de Campos", "Favor Selecionar uma Aplicação" );
			   }else{
				  cadastroUser.mostraResumoTela();
			      $(".step:visible").hide().next().show();
			      passoexibido();
			   }
		}else{
		   if( index === 3 ) cadastroUser.mostraResumoTela();		
		   $(".step:visible").hide().next().show();
           passoexibido();	
		}
		
    });
               

        //retrocede para o passo anterior
        $("#prev").click(function(){
            $(".step:visible").hide().prev().show();
            passoexibido();
        });

     });

 
 function validaStep( stepValidate, tipoValidacao ){
	let valid = true;                         
	let formulario = document.querySelector('.formCadUserValidacao');

	for( let errorText of formulario.querySelectorAll('.error-text') ){
		 errorText.remove();
	}
	
	if( tipoValidacao === 0 ){
		for( let campo of formulario.querySelectorAll(stepValidate) ){
			 const label = campo.previousElementSibling.innerText;
			 if(!campo.value){
				criaErro(campo, `O campo "${label}" não pode esta vazio!`);
				valid = false;
			 }
		}
	}else{
		for( let campo of formulario.querySelectorAll(stepValidate) ){
			 const label = campo.previousElementSibling.innerText;
			 criaErro(campo, `Verifique o "${label}", As senhas são diferentes!`);
			 valid = false;
		}
	}
	return valid;
 }


 function criaErro(campo, msg){
	const div = document.createElement('div');
	div.innerHTML = msg;
	div.classList.add('error-text');
	campo.insertAdjacentElement("afterend", div);
 }

function MensagemConfimacaoModal( iconi, tituloPrincipal, textoPrincipal, nomeModal ) {
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
function MensagemConfimacao( iconi, tituloPrincipal, textoPrincipal ) {
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

/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
function listAplicacao(idImpactoMudanca){

	let urlBase = document.getElementById('urlAPILogin').value;
	let urlAPI  = urlBase + 'listarAplicacao';
	
	$.ajax({
		method : "GET",
//		url : "http://localhost:8090/loginUnificado/listarAplicacao",
		url : urlAPI,
		contentType : "application/json; charset=utf-8",
		success : function(json) {
		    var option = '<option value="" disabled selected>[-Selecione-]</option>';

			for(var p = 0; p < json.length; p++){
				if( json[p].id_impacto_mudanca === idImpactoMudanca  )
			  	     selected = 'selected';
				 else selected = '';
				
				option += '<option value=' + json[p].id_aplicacao + ' ' + selected + '>' + json[p].aplicacao + '</option>';
			}
			$("#selectAplicacao").html(option).show();  
			
		}
	}).fail(function(xhr) {
		// alert("Erro ao Listar informacoes de Impacto Mudanca: " + xhr.responseText);
		MensagemConfimacao( "error", "Lista Aplicações", "Erro ao Listar as Aplicações: " + xhr.responseText) ; 
	});	

	
	
		
}



/******************************************************************/
/*                                                                */
/*                                                                */
/******************************************************************/
function funcSelectAplicacao() {
	 var idAplicacao = selectAplicacao.options[selectAplicacao.selectedIndex].value;
	 let urlBase = document.getElementById('urlAPILogin').value;
	 let urlAPI  = urlBase + 'obterAplicacao/' + idAplicacao;
	 
	 $.ajax({ 			
		method      : "GET",
//		url         : "http://localhost:8090/PortalMudanca/obterClientesAfetadosPorId/" + idClientesAfetados,
		url         : urlAPI ,
		contentType : "application/json; charset=utf-8",
		success     : function(response) {
						$("#idAplicacao"          ).val( response.id_aplicacao );
						$("#nomeAplicacao"        ).val( response.aplicacao    );
						$("#departamentoAplicacao").val( response.departamento );
						$("#urlAplicacao"         ).val( response.url          );
						$("#descricaoAplicacao"   ).val( response.descricao    );
   	   }
  	 }).fail(function( xhr ){
 			// alert("Erro ao Listar Mudanças: " + xhr.responseText); 
			MensagemConfimacao( "error", "Clientes Afetados", "Erro ao Selecionar Clientes Afetados: " + xhr.responseText);
  	 }); 
}

function verifica(){
   var csenha = document.getElementById("senha").value;
   var csenha2 = document.getElementById("confirm_password").value;
   let retVald = true;
   if(csenha != csenha2){
	  validaStep('.step_1_validar_senha', 1 );
	  retVald = false;
   }

   return retVald;
}

document.getElementById("confirm_password").oninput = function(){
   document.getElementById("confirm_password").setCustomValidity('');
}

function pesquisa() {
	var cep = $("#cep").val();
    //Consulta o webservice viacep.com.br/
    $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

        if (!("erro" in dados)) {
            //Atualiza os campos com os valores da consulta.
            $("#cep").val(dados.cep);
            $("#endereco").val(dados.logradouro);
            $("#bairro").val(dados.bairro);
            $("#cidade").val(dados.localidade);
            
        } //end if.
        else {
            //CEP pesquisado não foi encontrado.
            alert("CEP não encontrado.");
        }
    });
}

	