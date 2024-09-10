<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Optional"%>

<nav class="pcoded-navbar">
    
    <div class="pcoded-inner-navbar main-menu">
        <div class="">
            <div class="main-menu-header">
                <!--  
                <img class="img-80 img-radius" src="<%= request.getContextPath() %>/imagens/FotoCapa.jpg" alt="User-Profile-Image">
                -->
                 
                <img class="img-80 img-radius" src=<% 
                
                	String fotoUser = (String) session.getAttribute("fotoUsuario"); 
                    if ( fotoUser != null ) {
						  out.print("\"" + fotoUser + "\"");
		            }else{
		            	String avatar = request.getContextPath() + "/imagens/perfil_avatar.jpg";
		            	// out.print("\"./imagens/perfil_avatar.jpg\"");
		            	out.print( avatar );
		            }
                %> alt="User-Profile-Image">
				 <!--  
                 <img class="img-80 img-radius" src="<%= session.getAttribute("fotoUsuario") %>" alt="User-Profile-Image">
                 -->
                 <div class="user-details">
                    <span id="more-details"><%= session.getAttribute("nomeUsuario") %><i class="fa fa-caret-down"></i></span>
                </div>
            </div>

            <div class="main-menu-content">
                <ul>
                    <li class="more-details">
                       <!--   <a href="user-profile.html"><i class="ti-user"></i>View Profile</a> -->
                       <!--   <a href="#!"><i class="ti-settings"></i>Settings</a>                -->
                        <a href="<%= request.getContextPath() %>/ServletLogin?acao=logout"><i class="ti-layout-sidebar-left"></i>Sair</a>
                    </li>
                </ul>
            </div>
        </div>

	        <div class="pcoded-navigation-label" data-i18n="nav.category.forms">Configuração</div>
	        <ul class="pcoded-item pcoded-left-item">
	            <li class="pcoded-hasmenu">
	            
	                <a href="javascript:void(0)" class="waves-effect waves-dark">
	                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
	                    <span class="pcoded-mtext"  data-i18n="nav.basic-components.main">Ambiente</span>
	                    <span class="pcoded-mcaret"></span>
	                </a>
	       
	                <ul class="pcoded-submenu">
	
		                    <li class=" "> <!-- manutencaoAmbiente -->
		                        <a href="<%= request.getContextPath() %>/ServletsAmbiente?acao=MontaAmbienteInicial" class="waves-effect waves-dark">
		                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
		                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Ambiente</span>
		                            <span class="pcoded-mcaret"></span>
		                        </a>
		                    </li>
	                
	                </ul>
	            </li>
	
	        </ul>
        
    </div>
</nav>