
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>      
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="br.com.multicloud.modal.Aplicacao"%>   
<%@page import="br.com.multicloud.modal.UserAplicativo"%> 
<%@page import="br.com.multicloud.modal.ModalUrlAplicacao"%> 
 
<%@page import="java.util.List"%>
<%@page import="java.util.Optional"%>
    
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>
   <style>

	.wrimagecard{	
		margin-top: 100;
	    margin-bottom: 1.0rem;
	    text-align: center;
	    position: relative;
	    background: #fff;
	  --  box-shadow: 12px 15px 20px 0px rgba(46,61,73,0.15);
	    border-radius: 10px;
	    transition: all 0.3s ease;
	}
	.wrimagecard .fa{
		position: relative;
	    font-size: 35px;
	}
	.wrimagecard-topimage_header{
	padding: 100px;
	}
		
	
    a.wrimagecard:hover, .wrimagecard-topimage:hover, i.wrimagecard:hover{
	     box-shadow: 2px 4px 8px 0px rgba(46,61,73,0.2);
	     background: #FAFAFA;
	    transform: scale(1.01);
	    
	}	
	
	.wrimagecard-topimage a {
	    width: 100%;
	    height: 100%;
	    display: block;
	}
	.wrimagecard-topimage_title {
	    padding: 2px 2px;
	    height: 8px;
	    padding-bottom: 01.0rem;
	    position: relative;
	    text-align: center;
	}
	.wrimagecard-topimage a {
	    border-bottom: none;
	    text-decoration: none;
	    color: #525c65;
	    transition: color 0.3s ease;
	}

   </style>
   
  <body>
  <!-- Pre-loader start -->
  <jsp:include page="theme-loader.jsp"></jsp:include>
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
    <div class="pcoded-overlay-box"></div>
    <div class="pcoded-container navbar-wrapper">
      <jsp:include page="navbarheader.jsp"></jsp:include>
      <div class="pcoded-main-container">
          <div class="pcoded-wrapper">
              <div class="pcoded-inner-content">
                  <div class="main-body">
                      <div class="page-wrapper">
                          <div class="page-body">
                          
 <form class="form-material" action="#" method="post" id="formLoginUniversal" >    
                  
                              <input type="hidden"  value=<%= session.getAttribute("urlApliParametros")%> id="idUrlAplicacao">
                              
                              <p class="h5"><strong>Sistemas</strong></p>
							  <div class="row my-12 text-primary">
                          <% 
//                             List<Aplicacao> aplicacoes           = (List<Aplicacao>) session.getAttribute("vg_aplicacoes");  
                             List<UserAplicativo> userAplicativos = (List<UserAplicativo>)session.getAttribute("vg_userAplicativo");  
                             String aplicGestaoContrato           = null;
                             Boolean aplicGestaoContratoView      = false;
                             String aplicGMUD                     = null;
                             Boolean aplicGMUDView                = false;

                             if( userAplicativos != null ){
                            	 
                            	 
                                 for (UserAplicativo userAplicativo : userAplicativos) {
                                	 if( userAplicativo.getAplicacao().getAplicacao().equals("Gestao de Contratos") ){
                                         aplicGestaoContrato     = userAplicativo.getAplicacao().getAplicacao().toString();
                                         aplicGestaoContratoView = userAplicativo.getAplicativoView();
                                	 }else{
                                		 aplicGMUD = userAplicativo.getAplicacao().getAplicacao();
                                		 aplicGMUDView = userAplicativo.getAplicativoView();
                                	 }
                            	 }
                            	 
                                 if( aplicGestaoContratoView ){
                                    if( aplicGestaoContrato != null && aplicGestaoContrato.equals("Gestao de Contratos") ){	 
                            		  String urlPortalMultiCloud = (String) session.getAttribute("urlPortalMultiCloud");  
                          %>
                                     <div class="col-md-4" style="max-width: 15rem;">
					                   <div class="card text-center h-10 wrimagecard wrimagecard-topimage" style="max-width: 15rem;">
					                      <div class="card-block">
							                 <div class="text-c-purple text-right" data-toggle="tooltip" data-placement="top" title="Sistema de Gest�o de Contrato">
                                               <i class="fa fa-lock f-1" style="font-size: 22px; color: white;"></i>
                                             </div>
							                 <!-- <a href="<%= urlPortalMultiCloud %>" class="waves-effect waves-dark">  -->
							                 <a href="javascript:DoPost('PortalMultiCloud')"   class="waves-effect waves-dark">  
							                    <h6><i class="fa fa-handshake-o fa-3x text-primary" ></i></h6>
							                    <h6 class="card-title text-dark">Portal MultiCloud</h6>
							                 </a>
					                      </div>								                
					                   </div>
                                     </div>
                          <% 		 
                            	    }else{
                          %>
								       <div class="col-md-4" style="max-width: 15rem;">
								         <div class="card text-center h-10 wrimagecard wrimagecard-topimage" style="max-width: 15rem;">
								            <div class="card-block">
								                <div class="text-c-purple text-right" data-toggle="tooltip" data-placement="top" title="Voc� n�o tem acesso a esta �rea!">
		                                            <i class="fa fa-lock f-1" style="font-size: 22px; color: black;"></i>
		                                       </div>
		                                       <a href="#" style="pointer-events: none;" >
								                  <h6><i class="fa fa-handshake-o fa-3x text-primary"></i></h6>
								                  <h6 class="card-title text-dark">Portal MultiCloud</h6>
								               </a> 
								            </div>
								         </div>
								       </div>								
                         <%  		 
                            	    }
                            	 
                                 }
                                 if( aplicGMUDView ){
                                 
                            	   if( aplicGMUD != null && aplicGMUD.equals("Gestao de GMUD") ){	
                            		 String urlPortalGmud = (String) session.getAttribute("urlPortalGmud");  
                          %>
							           <div class="col-md-6" style="max-width: 15rem;">
							             <div class="card text-center h-10 wrimagecard wrimagecard-topimage" style="max-width: 15rem;">
							                <div class="card-block">
									           <div class="text-c-purple text-right" data-toggle="tooltip" data-placement="top" title="Porta de Mudan�a">
	                                               <i class="fa fa-lock f-1" style="font-size: 22px; color: white;"></i>
	                                           </div>
									           <!--  <a href="<%= urlPortalGmud %>" class="waves-effect waves-dark"> -->
	                                                <a href="javascript:DoPost('PortalGmud')"   class="waves-effect waves-dark"> 
									                <h6><i class="fa fa-cogs fa-3x text-primary" ></i></h6>
									                <h6 class="card-title text-dark">Portal GMUD</h6>
									           </a>
							                </div>								                
							             </div>
                                       </div>
                          <%  
                            	 }else{
                          %>
							           <div class="col-md-6" style="max-width: 15rem;">
							             <div class="card text-center h-10 wrimagecard wrimagecard-topimage" style="max-width: 15rem;">
							                <div class="card-block">
									           <div class="text-c-purple text-right" data-toggle="tooltip" data-placement="top" title="Voc� n�o tem acesso a esta �rea!">
	                                               <i class="fa fa-lock f-1" style="font-size: 22px; color: black;"></i>
	                                           </div>
									           <a href="#" style="pointer-events: none;" > 
									                <h6><i class="fa fa-cogs fa-3x text-primary" ></i></h6>
									                <h6 class="card-title text-dark">Portal GMUD</h6>
									           </a>
							                </div>								                
							             </div>
                                       </div>
                          <%  		 
                            	 }
                                } 	   
                             }                             	 
                          %>
                              
                              
                          
                              <!-- ===================================== -->
                              <!--  XWiki MultCloud Visivel para todos   -->
                              <!-- ===================================== -->
					          <div class="col-md-4" style="max-width: 15rem;">
				                <div class="card text-center h-10 wrimagecard wrimagecard-topimage" style="max-width: 15rem;">
				                   <div class="card-block">
				                      <div class="text-c-purple text-right">
	                                      <i class="fa fa-lock f-1" style="font-size: 22px; color: white;"></i>
	                                  </div>
	                                  <a href="https://xwiki.seidorcloud.com.br:9090/bin/view/Main/" class="waves-effect waves-dark" target="_blank">
				                         <h6><i class="fa fa-external-link fa-3x text-primary"></i></h6>								                        
				                         <h6 class="card-title text-dark">XWiki MultCloud</h6>
				                      </a>
				                 </div>
				                </div>
				              </div>
                           </div>
                           <!-- ============================= -->
                           <!--   Fecha DIV das aplicacoes    -->
                           <!-- ============================= -->
                           <% 
                              String userRole = (String) session.getAttribute("userRole"); 
                              if(userRole.trim().equals("ADMIN")){
                           %>

                           <p class="h5"><strong>Usu�rios</strong></p>
                           <div class="row my-12 text-primary">
					           <div class="col-md-4" style="max-width: 15rem;">
					             <div class="card text-center h-10 wrimagecard wrimagecard-topimage" style="max-width: 15rem;">
					                <div class="card-block">
							           <div class="text-c-purple text-right" data-toggle="tooltip" data-placement="top" title="Cadastro de novo usu�rio">
                                           <i class="fa fa-lock f-1" style="font-size: 22px; color: white;"></i>
                                       </div>
							           <a href="<%= request.getContextPath() %>/cadastro/cadUser.jsp" class="waves-effect waves-dark"> 
							              <h6><i class="fa fa-user-plus fa-3x text-primary" ></i></h6>
							              <h6 class="card-title text-dark">Cad. Usu�rios</h6>
							           </a>
					                </div>								                
					             </div>
                               </div>
                           <%                           	  
                              } //else{
                           %>
<!--  
						        <div class="col-md-4" style="max-width: 15rem;">
					             <div class="card text-center h-10 wrimagecard wrimagecard-topimage" style="max-width: 15rem;">
					                <div class="card-block">
							           <div class="text-c-purple text-right" data-toggle="tooltip" data-placement="top" title="Voc� n�o tem acesso a esta �rea!">
                                               <i class="fa fa-lock f-1" style="font-size: 22px; color: black;"></i>
                                          </div>
							           <a href="#" style="pointer-events: none;" > 
							                <h6><i class="fa fa-user-plus fa-3x text-primary" ></i></h6>
							                <h6 class="card-title text-dark">Cad. Usu�rios</h6>
							           </a>
					                </div>								                
					             </div>
                                </div>
-->
                           
                           <% 	  
                            	  
       //                       }
                           %>
                           </div>
                              
  </form>
  
                        </div>
                    </div>
                </div>
              </div>
          </div>   
      </div>
    </div>
  </div> 
  
  <jsp:include page="javascriptfile.jsp"></jsp:include>
 <script type="text/javascript">
 
 async function DoPost( aplic ){
	 try {
		 var urlAplicacao = document.getElementById("idUrlAplicacao").value;
		 var login;
		 var admin;
		 var loginUnificado;
		 var url;
		 var urlDoGet;
		 var urlDoPost;
		 var urlLogin;
		 var urlTelaAplic;
	     var json = JSON.parse(urlAplicacao);  
			
	     for(var p = 0; p < json.length; p++){
	         if( aplic === json[p].aplicacao ){
	        	 login          = json[p].login;
	        	 admin          = json[p].admin;
	        	 loginUnificado = json[p].loginUnificado;
	        	 url            = json[p].url;
	        	 urlDoGet       = json[p].urlDoGet;
	        	 urlDoPost      = json[p].urlDoPost;
	        	 urlLogin       = json[p].urlLogin;
	        	 urlTelaAplic   = ( json[p].urlTelaAplic !== undefined ? json[p].urlTelaAplic : null );
	        	 break;
	         }
     	}
	    var parametros = "?login=" + login +"&admin=" + admin + "&loginUnificado=" + loginUnificado + "&urlDoGet=" + urlDoGet + "&urlLogin=" + urlLogin + "&StatusSessao=PrimeiroAcesso"
        document.getElementById('formLoginUniversal').action = urlDoPost + parametros;	 
        document.getElementById('formLoginUniversal').submit();

//	     document.getElementById('formLoginUniversal').action = 'http://localhost:8083/PortalMultiCloud/ServletLogin?urlAplicacao=' + urlAplicacao;	 
//	     document.getElementById('formLoginUniversal').submit();
//	     alert(aplic);
		} catch (error) {
		     
		     alert( "Erro Acesso Portal MultiCloud",  error );
		}

  }

 </script>
</body>

</html>



