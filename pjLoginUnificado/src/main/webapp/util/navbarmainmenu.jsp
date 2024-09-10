<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>

<nav class="pcoded-navbar">
    <div class="pcoded-inner-navbar main-menu">
         
        <ul class="pcoded-item pcoded-left-item">
 
  	            <li class="pcoded-hasmenu" id="secaoCadastroPrincipal">
	                <a href="javascript:void(0)" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
	                    <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Cadastro</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	                
	                <ul class="pcoded-submenu">
		                       <li class=" "> 
		                           <a href="<%= request.getContextPath() %>/ServletUsuarioController?acao=listarUser" class="waves-effect waves-dark">
		                               <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
		                               <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Usuário</span>
		                               <span class="pcoded-mcaret"></span>
		                           </a>
		                       </li>
	                </ul>
	            </li> 
        </ul>
		             
    </div>
</nav>