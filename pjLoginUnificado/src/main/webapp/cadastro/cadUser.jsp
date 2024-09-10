<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <jsp:include page="/util/head.jsp"></jsp:include>

   <style>
       .mesmo-tamanho-botao {
           width: 15%;
           white-space: normal;
       }
       
       .t-modal .modal-content{
           border-top-left-radius: 10px;
           border-top-right-radius: 10px;
           
           border-bottom-left-radius: 10px;
           border-bottom-right-radius: 10px;
           
           border-bottom: 3px solid transparent;
       }
       
       
       .t-modal .modal-header{
          padding: 30px 15px;
       }
       
        .t-modal .modal-title{
          text-transform: uppercase;
          font-size: 20px;
       }
       
       .t-modal .modal-title,
       .t-modal .close{
          color: #fff;
       }
       
       .t-modal.primary .modal-content{
          border-color: #4a69bd; 
       }
       .t-modal.primary .modal-header{
          background-color: #4a69bd;
       }

        hr {
            height: 3px;
            background-color: #B0C4DE;
            border: none;
        }
        
		.tooltip-inner {
		  background-color: #5A72FE !important;
		  /*!important is not necessary if you place custom.css at the end of your css calls. For the purpose of this demo, it seems to be required in SO snippet*/
		  color: #fff;
		}
		
		.tooltip.top .tooltip-arrow {
		  border-top-color: #00acd6;
		}
		
		.tooltip.right .tooltip-arrow {
		  border-right-color: #00acd6;
		}
		
		.tooltip.bottom .tooltip-arrow {
		  border-bottom-color: #00acd6;
		}
		
		.tooltip.left .tooltip-arrow {
		  border-left-color: #00acd6;
		}
		
		input[type="file"]{
			display: none;
		}

       .pequeno {
           width: 20%;
       }

       .medio {
           width: 30%;
       }
       .error-text{
         font-size:12px;
         color: red;
       }
       
       .center{
          text-align: center;
       }
 
   </style>

  <body>
  <!-- Pre-loader start -->
  <jsp:include page="/util/theme-loader.jsp"></jsp:include>
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          
          <!-- Chamada para o Menu de Barras -->
          <jsp:include page="/util/navbarheader.jsp"></jsp:include>
          
          <div class="pcoded-main-container">
             <div class="pcoded-wrapper">
                  <!-- Page-header start -->
				   <div class="page-header">
				       <div class="page-block">
				           <div class="row align-items-center">
				               <div class="col-md-10">
				                   <div class="page-header-title">
				                       <h5 class="m-b-1">Portal Login Unificado - Cadastro de Usuários</h5>
				                       <p class="m-b-0"></p>
				                       <a class="btn btn-outline-primary float-right" href="<%= request.getContextPath() %>/principal/PagPrincipal.jsp" role="button" style="color: white;">Voltar</a>
				                   </div>
				               </div>
				       
				           </div>
				       </div>
				   </div>
                  <!-- Page-header end -->
                  <div class="pcoded-inner-content">
                     <!-- Main-body start -->
                     <div class="main-body">
                        <div class="page-wrapper">
                           <!-- Page-body start -->
                           <div class="page-body">
                              <div class="row">
                                 <div class="col-sm-12">
								    <!-- Basic Form Inputs card start -->
								    <h3 class="text-muted">Cadastro de Mudança Padrão - Passo <samp id="passo"></samp></h3>
								    <br>
                                    <form class="form-material formCadUserValidacao" action="" method="post" id="formCadUser" enctype="multipart/form-data">
                                            <!-- ##################################################################################### -->
                                            <!--          Etapa Dados de Identificação da Mudança!                                     -->
                                            <!-- ##################################################################################### -->                                    
                                            <div id="step_1" class="step">
                                                 <div class="row">
													<div class="col-sm-12">
														<div class="card">
															<div class="card-block">
					                                            <div class="form-row">
						                                            <!-- URL da base da API Base TST ou PRD  -->
						                                            <input type="hidden"  name="urlAPILogin" id="urlAPILogin" value="<%=session.getAttribute("urlAPI")%>">
						                                            <input type="hidden"  name="loginCadastro" id="loginCadastro" value="<%=session.getAttribute("usuario")%>">
						                                            
																	<div class="form-group form-default form-static-label col-md-4 mb-6">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >ID Login</span>
																	     <input style="color: #000000" type="text" name="idLogin" id="idLogin" class="form-control" readonly="readonly" placeholder="ID Login" value="">
																	</div>

																	<div class="form-group form-default form-static-label col-md-4 mb-6">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Data Cadastro</span>
																	     <input style="color: #000000" type="password" name="DtCadastro" id="DtCadastro" class="form-control" readonly="readonly" placeholder="Data Cadastro" autocomplete="off">
																	</div>
																	 
																	  
															    </div>
																<hr>  
																<br>
																<div class="form-row">
																	<div class="form-group form-default form-static-label col-md-4 mb-6">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Login</span>
																	     <input style="color: #000000" type="text" name="login" id="login" class="form-control step_1_validar" placeholder="Login" value="">
																	</div>
																	
			                                                        <!-- Campo Senha Colaborador -->
		                                                            <div class="form-group form-default form-static-label col-md-3 mb-3">
		                                                                 <span  class="font-weight-bold font-italic" style="color: #708090" >Senha</span>
			                                                             <input type="password" name="senha" id="senha" class="form-control step_1_validar" placeholder="Informe a Senha" autocomplete="off" >
			                                                                                                                                 
		                                                            </div>
	
			                                                        <!-- Campo Senha Colaborador -->
		                                                            <div class="form-group form-default form-static-label col-md-3 mb-3">
		                                                                 <span  class="font-weight-bold font-italic" style="color: #708090" >Confirme Senha</span> 
			                                                             <input type="password" name="confirm_password" id="confirm_password" class="form-control step_1_validar step_1_validar_senha" placeholder="Confirme Senha" autocomplete="off" >
			                                                                                                                               
		                                                            </div>

																	<div class="form-group form-default form-static-label col-md-4 mb-6">
																	    <span  class="font-weight-bold font-italic" style="color: #708090">Perfil User</span>
																		<select name="rule" id="rule" class="form-control step_1_validar" required="required">
																			<option value="" disabled selected>[-Selecione-]</option>
																			<option value="ADMIN">Admin</option>
																			<option value="USER">User</option>
																		</select> 
																	</div>		
																	
																</div>	
												            </div>
												        </div>
												    </div>
												 </div>
                                            </div>
                                            <!-- ##################################################################################### -->
                                            <!--          Etapa Plano de execução da Mudança                                           -->
                                            <!-- ##################################################################################### -->                                                                                
                                            <div id="step_2" class="step">
                                                 <div class="row">
													<div class="col-sm-12">
														<div class="card">
															<div class="card-block">

				                                                <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-3 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >ID Pessoa</span>
																	     <input style="color: #000000" type="text" name="idPessoa" id="idPessoa" placeholder="ID Pessoa" readonly="readonly" class="form-control" value="">
																    </div>

																	<div class="form-group form-default form-static-label col-md-3 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Nome Pessoa</span>
																	     <input style="color: #000000" type="text" name="nomePessoa" id="nomePessoa" placeholder="Informe o Nome da Pessoa" class="form-control step_2_validar" value="">
																    </div>

																	<div class="form-group form-default form-static-label col-md-3 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >E-mail</span>
																	     <input style="color: #000000" type="text" name="email" id="email" placeholder="Informe o E-Mail" class="form-control step_2_validar" value="">
																    </div>
		                                                            
		                                                            <!-- Campo CPF Colaborador -->                                                            
		                                                            <div class="form-group form-default form-static-label col-md-3 mb-6">
		                                                               <span  class="font-weight-bold font-italic" style="color: #708090" >CPF</span>
		                                                               <input style="color: #000000" type="text" name="cpf" id="cpf" onkeyup="handleCpfCnpj(event)" class="form-control step_2_validar" maxlength="14" placeholder="Informe o CPF" value="">
		                                                            </div>

															    </div>
															    <br>
				
		                                                        <div class="form-row">
			                                                         <!-- Campo CEP Colaborador -->
			                                                         <div class="form-group form-default form-static-label col-md-3 mb-6">
			                                                             <span  class="font-weight-bold font-italic" style="color: #708090" >CEP</span>
			                                                             <input style="color: #000000" type="text" name="cep" id="cep" onkeyup="handleZipCode(event)" onblur="pesquisa();" class="form-control step_2_validar" maxlength="10" placeholder="Informe o CEP" value="">
			                                                         </div>
			                                                          <!-- Campo Endereço Colaborador -->                                                            
			                                                         <div class="form-group form-default form-static-label col-md-3 mb-6">
			                                                             <span  class="font-weight-bold font-italic" style="color: #708090" >Endereço</span>
			                                                             <input style="color: #000000" type="text" name="endereco" id="endereco" class="form-control step_2_validar" maxlength="150" placeholder="Informe o Endereço" value="">
			                                                         </div>                                                             
			                                                          <!-- Campo Número Colaborador -->                                                            
			                                                         <div class="form-group form-default form-static-label col-md-3 mb-6">
			                                                             <span  class="font-weight-bold font-italic" style="color: #708090" >Número</span>
			                                                             <input style="color: #000000" type="text" name="numero" id="numero" class="form-control" maxlength="5" placeholder="Informe o Número" value="">
			                                                         </div>                                                             
			                                                          <!-- Campo Complemento Colaborador -->                                                            
			                                                         <div class="form-group form-default form-static-label col-md-3 mb-6">
			                                                             <span  class="font-weight-bold font-italic" style="color: #708090" >Complemento</span>
			                                                             <input style="color: #000000" type="text" name="complemento" id="complemento" class="form-control" maxlength="45" placeholder="Informe o Complemento" value="">
			                                                         </div>                                                              
		                                                        </div>
	                                                            <br>
	                                                         
		                                                        <div class="form-row">
			                                                         <div class="form-group form-default form-static-label col-md-3 mb-6">
			                                                             <span  class="font-weight-bold font-italic" style="color: #708090" >Bairro</span>
			                                                             <input style="color: #000000" type="text" name="bairro" id="bairro" class="form-control step_2_validar" maxlength="80" placeholder="Informe o Bairro" value="">
			                                                         </div>                                                             
			                                                         <div class="form-group form-default form-static-label col-md-3 mb-6">
			                                                             <span  class="font-weight-bold font-italic" style="color: #708090" >Cidade</span>
			                                                             <input style="color: #000000" type="text" name="cidade" id="cidade" class="form-control step_2_validar" maxlength="45" placeholder="Informe a Cidade" value="">
			                                                         </div>  
		                                                        </div>
											                </div>
													    </div>
											        </div>
											     </div>
                                            </div>
                                            
                                            <!-- ##################################################################################### -->
                                            <!--          Etapa Plano de execução da Mudança                                           -->
                                            <!-- ##################################################################################### -->                                                                                                                            
                                            <div id="step_3" class="step">
                                                 <div class="row">
												    <div class="col-sm-12">
												        <div class="card">
														    <div class="card-block">
														    
				                                                <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-4 mb-4">
																		<span  class="font-weight-bold font-italic" style="color: #708090">Aplicações</span>
																		<select style="color: #000000" name="selectAplicacao" id="selectAplicacao" class="form-control"  >
																			<option value="" disabled selected>[-Selecione-]</option>
																		</select> 
																    </div>
															    </div>
															    
															    <div class="form-row">
																	<div class="form-group form-default form-static-label col-md-3 mb-6">
																	    <span  class="font-weight-bold font-italic" style="color: #708090">User Administrador</span>
																		<select name="selectAdmin" id="selectAdmin" class="form-control" required="required">
																			<option value="" disabled selected>[-Selecione-]</option>
																			<option value="1">Sim</option>
																			<option value="0">Não</option>
																		</select> 
																	</div>		
															    
																	<div class="form-group form-default form-static-label col-md-3 mb-6">
																	    <span  class="font-weight-bold font-italic" style="color: #708090">Aprovador GMUD</span>
																		<select name="selectAprovador" id="selectAprovador" class="form-control" required="required">
																			<option value="" disabled selected>[-Selecione-]</option>
																			<option value="1">Sim</option>
																			<option value="0">Não</option>
																		</select> 
																	</div>		
															    
																	<div class="form-group form-default form-static-label col-md-3 mb-6">
																	    <span  class="font-weight-bold font-italic" style="color: #708090">Executor GMUD</span>
																		<select name="selectExecutor" id="selectExecutor" class="form-control" required="required">
																			<option value="" disabled selected>[-Selecione-]</option>
																			<option value="1">Sim</option>
																			<option value="0">Não</option>
																		</select> 
																	</div>	
																		
																	<div class="form-group form-default form-static-label col-md-3 mb-6">
																	    <span  class="font-weight-bold font-italic" style="color: #708090">Owner GMUD</span>
																		<select name="selectOwner" id="selectOwner" class="form-control" required="required">
																			<option value="" disabled selected>[-Selecione-]</option>
																			<option value="1">Sim</option>
																			<option value="0">Não</option>
																		</select> 
																	</div>		
															    </div>
																<hr>  
																<br>
																<div class="form-row">
																	<div class="form-group form-default form-static-label col-md-3 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >ID Aplicação</span>
																	     <input style="color: #000000" type="text" name="idAplicacao" id="idAplicacao" readonly="readonly" class="form-control" value="">
																	</div>
				
																	<div class="form-group form-default form-static-label col-md-3 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Aplicação</span>
																	     <input style="color: #000000" type="text" name="nomeAplicacao" id="nomeAplicacao" readonly="readonly" class="form-control" value="">
																	</div>
				
																	<div class="form-group form-default form-static-label col-md-3 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >Departamento</span>
																	     <input style="color: #000000" type="text" name="departamentoAplicacao" id="departamentoAplicacao" readonly="readonly" class="form-control" value="">
																	</div>
																	
																	<div class="form-group form-default form-static-label col-md-3 mb-4">
																	     <span  class="font-weight-bold font-italic" style="color: #708090" >URL</span>
																	     <input style="color: #000000" type="text" name="urlAplicacao" id="urlAplicacao" readonly="readonly" class="form-control" value="">
																	</div>
															    </div>
															    
															    <div class="from-row">
																	<div class="form-group form-default form-static-label col-md-12 mb-12">
																	     <span class="font-weight-bold font-italic" style="color: #708090">Descrição</span>
																	     <textarea style="color: #000000" class="form-control" id="descricaoAplicacao" name="descricaoAplicacao" readonly="readonly" placeholder="Descrição Aplicação" rows="100" ></textarea>
																	</div>											    
											                    </div>
																<hr>  
																<br>
																<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" name="btAddAplicativo" id="btAddAplicativo" onclick="cadastroUser.salvarUserAplicativos()">Add</button>
														    </div>
													    </div>
												    </div>
					                           </div>
												<!-- Tabela com as informacoes do Recursos a serem cadastrasdos -->                       
												<div class="row">
													<div class="col-sm-12">
														<!-- Basic Form Inputs card start -->
														<div class="card">
															<div class="card-block">
									
																<div style="height: 150px; overflow: scroll;">
																	<table class="table table-striped table-hover table-sm table-bordered table-responsive-sm" id="tabelaAplicativo">
																		  <thead>
																		    <tr>
																				<th scope="col">Aplicação    </th>
																				<th scope="col">Departamento </th>
																				<th scope="col">URL          </th>
																				<th scope="col">Admin        </th>
																				<th scope="col">Aprovador    </th>
																				<th scope="col">Owner        </th>
																				<th scope="col">URL          </th>
																		        <th scope="col" style="text-align: center;">Delete</th>
																		    </tr>
																		  </thead>
																		<tbody id="tbAplicativo">
									
																		</tbody>
																	</table>
																</div>
									
															</div>
														</div>
													</div>
												</div>
                                            </div>
                                            
                                           <div id="step_4" class="step">
                                           
												<div class="card">
												  <h5 class="card-header border-primary">Dados Novo Login</h5>
												  <div class="card-body ">
												       <h5 class="card-title">Info. Login</h5><hr>
                                                       <div style="height: 80px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr >
															      <th class="font-weight-bold font-italic " style="color: #708090">Login         </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">Senha         </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">Confirme Senha</th>
															      <th class="font-weight-bold font-italic " style="color: #708090">Perfil User   </th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowDadosLogin">
															  
															  </tbody>
															</table>
													   </div>
													</div>
											    </div>
												<!--  

												-->                                           
												<div class="card">
												  <h5 class="card-header border-primary">Dados da Pessoa</h5>
												  <div class="card-body ">
												       <h5 class="card-title">Dados Pessoais</h5><hr>
                                                       <div style="height: 150px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr >
															      <th class="font-weight-bold font-italic " style="color: #708090">Nome Pessoa</th>
															      <th class="font-weight-bold font-italic " style="color: #708090">E-mail     </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">CPF        </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">CEP        </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">Endereço   </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">Número     </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">Complemento</th>
															      <th class="font-weight-bold font-italic " style="color: #708090">Bairro     </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">Cidade     </th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowPessoa">
															  
															  </tbody>
															</table>
													   </div>
													  </div>
												</div>
												<!--  

												-->
                                           
                                           
                                           
												<div class="card">
												  <h5 class="card-header border-primary">Lista das Aplicações</h5>
												  <div class="card-body ">
												       <h5 class="card-title">Aplicação</h5><hr>
                                                       <div style="height: 150px; overflow: scroll;">
															<table class="table table-borderless table-striped table-hover table-sm table-bordered table-responsive-sm" style="line-height:0px;">
															  <thead >
															    <tr >
															      <th class="font-weight-bold font-italic " style="color: #708090">ID Aplicação      </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">Aplicação         </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">Departamento      </th>
															      <th class="font-weight-bold font-italic " style="color: #708090">URL               </th>
															      <th class="font-weight-bold font-italic " style="text-align: center;color: #708090">User Administrador</th>
															      <th class="font-weight-bold font-italic " style="text-align: center;color: #708090">Aprovador GMUD    </th>
															      <th class="font-weight-bold font-italic " style="text-align: center;color: #708090">Executor GMUD     </th>
															      <th class="font-weight-bold font-italic " style="text-align: center;color: #708090">Owner GMUD        </th>
															    </tr>
															  </thead>
															  <tbody id="TbodyShowAplicacao">
															  
															  </tbody>
															</table>
													   </div>
													  </div>
												</div>
												<button type="button" class="btn waves-effect waves-light btn-outline-success float-right pequeno" name="btSalvarUser" id="btSalvarUser" onclick="desabilitaBotaoSalvar();cadastroUser.salvarUser();">Salvar</button>
												<a class="btn btn-outline-primary waves-effect waves-light float-right pequeno" href="<%= request.getContextPath() %>/principal/PagPrincipal.jsp" role="button" >Início</a>                                            
                                             </div> 
                                     </form>
                                 </div>
                              </div>
                              <br>
                              <br>
                              
							  <div class="row">
								  <div class="col-sm-12">
								 	  <!-- Basic Form Inputs card start -->
									  <div class="card">
										  <div class="card-block">
											  <div class="row">
												  <div class="col-lg-6">
												  	<button type="button" class="btn btn-block btn-outline-primary" id="prev">Anterior</button>
												  </div>
												  <div class="col-lg-6">
												  	<button type="button" class="btn btn-block btn-outline-primary" id="next">Próximo</button>
												  </div>
											  </div>
										  </div>
									  </div>
								  </div>
							  </div>
                        
                           </div>
                            <!-- Page-body end -->
                        </div>
                        <div id="styleSelector"> </div>
                     </div>
                  </div>
             </div>
          </div>
      </div>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    
  <jsp:include page="/util/javascriptfile.jsp"></jsp:include>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/core.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/md5.js"></script>
   
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/cadUserController.js"></script>
  <script type="text/javascript" src="<%= request.getContextPath() %>/js/cadUserClass.js"></script>
    
</body>

</html>
