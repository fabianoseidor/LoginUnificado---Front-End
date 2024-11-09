package br.com.multicloud.servlets;

import java.io.IOException;
import java.net.InetAddress;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import br.com.multicloud.modal.Aplicacao;
import br.com.multicloud.modal.ModalUrlAplicacao;
import br.com.multicloud.modal.UserAplicativo;
import br.com.multicloud.modal.Users;
import br.com.multicloud.services.UserService;
import br.com.multicloud.util.Md5Criptografia;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet( urlPatterns =  {"/principal/ServletLogin"})/*Mapeamento de URL que vem da Tela*/
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
//	private DAOLoginRepository daoLoginRepository = new DAOLoginRepository(); 
	
       
    public ServletLogin() { }

    /**/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String senha = "";
		HttpSession session = request.getSession();
		String usuarioLogado = (String) session.getAttribute("usuario");

		try {
			senha = Md5Criptografia.convertPasswordToMD5( request.getParameter("senha") );
//			System.out.println("senha: " + senha);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage() + " <br> " + e.toString() + " <br> " + e.getLocalizedMessage() + " <br> " + e.getCause() + " <br> " + e.initCause(e) );
			requestDispatcher.forward(request, response);
		}
		String url      = request.getParameter("url"     );
		String aplic    = request.getParameter("aplic"   );
		String urlAplic = request.getParameter("urlAplic");		
		
		try {
			
			if( login != null && !login.isEmpty() && senha != null && !senha.isEmpty() ) {
				
				if( (usuarioLogado != null && !usuarioLogado.isEmpty()) && (!usuarioLogado.equals(login)) ) {
					 RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
					 request.getSession().invalidate();
					 request.setAttribute("msg", "Favor realizar Login com seu usuário!");
					 requestDispatcher.forward(request, response);
				}else {
					String urlAPI              = "";
					String urlPortalMultiCloud = "";
					String urlPortalGmud       = "";
			        InetAddress ia = InetAddress.getLocalHost();
			        String node = ia.getHostName();
			        
			        if(node.equals("PIBASTIANDEV")) {
			        	urlAPI = "http://localhost:8091/loginUnificado/";
			        	urlPortalMultiCloud = "http://localhost:8083/PortalMultiCloud";
			        	urlPortalGmud       = "http://localhost:8083/gestaodemudanca";
			        } else {
			        	urlAPI = "http://10.154.20.134:8091/loginUnificado/";
			        	// urlPortalMultiCloud = "https://portalmulticloud.seidorcloud.com.br/PortalMultiCloud";
			        	urlPortalMultiCloud = "http://10.154.20.134:8080/PortalMultiCloud";
			        	urlPortalGmud       = "http://10.154.20.134:8080/gestaodemudanca";
			        }
			        
					String urlBuscaLogin = urlAPI + "loginPassAPP/";
					Users user = UserService.buscaUserLogin(login, senha, urlBuscaLogin); 
	
					if( user != null ) {
						Boolean userAdminPortal = false;
						Boolean userAdminGMUD   = false;
						List<Aplicacao> aplicacoes = new ArrayList<Aplicacao>();
						
						List<ModalUrlAplicacao> listaUrlAplicacao = new ArrayList<ModalUrlAplicacao>();

						List<UserAplicativo> userAplicativo = user.getUserAplicativos();
						for(int i = 0; i < user.getUserAplicativos().size(); i++ ) {
							if( user.getUserAplicativos().get(i).getAplicacao().getId_aplicacao() == 1 )
								userAdminPortal = user.getUserAplicativos().get(i).getAdmin();
							if( user.getUserAplicativos().get(i).getAplicacao().getId_aplicacao() == 2 )
								userAdminGMUD = user.getUserAplicativos().get(i).getAdmin();
							
							Aplicacao aplicacao = user.getUserAplicativos().get(i).getAplicacao();
							aplicacoes.add(aplicacao);
						}
						
						if(aplic == null || aplic.equalsIgnoreCase("null")){
							ModalUrlAplicacao urlAplicacaoPortalMultiCloud = new ModalUrlAplicacao();
							urlAplicacaoPortalMultiCloud.setAplicacao     ( "PortalMultiCloud"                                   );
							urlAplicacaoPortalMultiCloud.setLogin         ( user.getLogin()                                      );
							urlAplicacaoPortalMultiCloud.setAdmin         ( Integer.toString((userAdminPortal == true? 1 : 0))   );
							urlAplicacaoPortalMultiCloud.setUrl           ( urlPortalMultiCloud                                  );
							urlAplicacaoPortalMultiCloud.setUrlDoPost     ( urlPortalMultiCloud  + "/ServletLogin"               );
							urlAplicacaoPortalMultiCloud.setUrlDoGet      ( urlPortalMultiCloud  + "/ServletLogin"               );
							urlAplicacaoPortalMultiCloud.setUrlLogin      ( urlAPI                                               );
							urlAplicacaoPortalMultiCloud.setLoginUnificado( "1"                                                  );
							listaUrlAplicacao.add(urlAplicacaoPortalMultiCloud);

							ModalUrlAplicacao urlAplicacaoPortalGmud = new ModalUrlAplicacao();
							urlAplicacaoPortalGmud.setAplicacao      ( "PortalGmud"                                    );
							urlAplicacaoPortalGmud.setLogin          ( user.getLogin()                                 );
							urlAplicacaoPortalGmud.setAdmin          ( Integer.toString((userAdminGMUD == true? 1 : 0)));
							urlAplicacaoPortalGmud.setUrl            ( urlPortalGmud                                   );
							urlAplicacaoPortalGmud.setUrlDoPost      ( urlPortalGmud  + "/ServletLogin"                );
							urlAplicacaoPortalGmud.setUrlDoGet       ( urlPortalGmud  + "/ServletLogin"                );
							urlAplicacaoPortalGmud.setUrlLogin       ( urlAPI                                          );
							urlAplicacaoPortalGmud.setLoginUnificado ( "1"                                             );
							listaUrlAplicacao.add(urlAplicacaoPortalGmud);
							
							urlPortalMultiCloud += "/ServletLogin?acao=MontaSecaoInicial&login=" + user.getLogin() + "&admin=" + (userAdminPortal == true? 1 : 0) + "&loginUnificado=1";	
							urlPortalGmud       += "/ServletLogin?acao=MontaSecaoInicial&login=" + user.getLogin() + "&admin=" + (userAdminGMUD   == true? 1 : 0) + "&loginUnificado=1";													
							
						} else { 

							ModalUrlAplicacao urlAplicacaoPortalMultiCloud = new ModalUrlAplicacao();
							urlAplicacaoPortalMultiCloud.setAplicacao     ( "PortalMultiCloud"                                );
							urlAplicacaoPortalMultiCloud.setLogin         ( user.getLogin()                                   );
							urlAplicacaoPortalMultiCloud.setAdmin         ( Integer.toString((userAdminPortal == true? 1 : 0)));
							urlAplicacaoPortalMultiCloud.setUrl           ( urlPortalMultiCloud                               );
							urlAplicacaoPortalMultiCloud.setUrlDoPost     ( urlPortalMultiCloud  + "/ServletLogin"            );
							urlAplicacaoPortalMultiCloud.setUrlDoGet      ( urlPortalMultiCloud  + "/ServletLogin"            );
							urlAplicacaoPortalMultiCloud.setUrlLogin      ( urlAPI                                            );
							urlAplicacaoPortalMultiCloud.setLoginUnificado( "1"                                               );
							urlAplicacaoPortalMultiCloud.setUrlTelaAplic  ( urlAplic                                          );
							listaUrlAplicacao.add(urlAplicacaoPortalMultiCloud);

							ModalUrlAplicacao urlAplicacaoPortalGmud = new ModalUrlAplicacao();
							urlAplicacaoPortalGmud.setAplicacao     ( "PortalGmud"                                    );
							urlAplicacaoPortalGmud.setLogin         ( user.getLogin()                                 );
							urlAplicacaoPortalGmud.setAdmin         ( Integer.toString((userAdminGMUD == true? 1 : 0)));
							urlAplicacaoPortalGmud.setLoginUnificado( "1"                                             );
							urlAplicacaoPortalGmud.setUrl           ( urlPortalGmud                                   );
							urlAplicacaoPortalGmud.setUrlDoPost     ( urlPortalGmud  + "/ServletLogin"                );
							urlAplicacaoPortalGmud.setUrlDoGet      ( urlPortalGmud  + "/ServletLogin"                );
							urlAplicacaoPortalGmud.setUrlLogin      ( urlAPI                                          );
							urlAplicacaoPortalGmud.setUrlTelaAplic  ( urlAplic                                        );
							listaUrlAplicacao.add(urlAplicacaoPortalGmud);

							urlPortalMultiCloud += "/ServletLogin?acao=MontaSecaoInicial&login=" + user.getLogin() + "&admin=" + (userAdminPortal == true? 1 : 0) + "&loginUnificado=1&url=" + urlAplic;
							urlPortalGmud       += "/ServletLogin?acao=MontaSecaoInicial&login=" + user.getLogin() + "&admin=" + (userAdminGMUD   == true? 1 : 0) + "&loginUnificado=1&url=" + urlAplic;
							
						}
	
						request.getSession().setAttribute( "idPessoa"           , user.getPessoa().getId_pessoa()                      );
						request.getSession().setAttribute( "usuario"            , user.getLogin()                                      );
						request.getSession().setAttribute( "nomeUsuario"        , user.getPessoa().getNome_pessoa()                    );
						request.getSession().setAttribute( "urlAPI"             , urlAPI                                               );
						request.getSession().setAttribute( "vg_aplicacoes"      , aplicacoes                                           );
						request.getSession().setAttribute( "vg_userAplicativo"  , userAplicativo                                       );
						request.getSession().setAttribute( "userRole"           , user.getRole()                                       );
						request.getSession().setAttribute( "urlPortalMultiCloud", urlPortalMultiCloud                                  );
						request.getSession().setAttribute( "urlPortalGmud"      , urlPortalGmud                                        );
						
						Gson gson = new Gson();
						String gsonUrlAplicacao = gson.toJson(listaUrlAplicacao);
						request.getSession().setAttribute( "urlApliParametros"  , gsonUrlAplicacao                                     );
						
						if( user.getPessoa().getPrimeiroAcesso() == true ) {
							url = "cadastro/trocaSenhaPrimeiroAcesso.jsp";
						}else 
						   if(aplic == null || aplic.equalsIgnoreCase("null")){
							  if(url == null || url.equalsIgnoreCase("null")) url = "principal/PagPrincipal.jsp";
						   }else {
				 			  HttpServletResponse resp = (HttpServletResponse) response;	
							  if( Integer.valueOf(aplic) == 1 ) {
								  resp.sendRedirect(urlPortalMultiCloud);
								  return;
							  }
						      else if( Integer.valueOf(aplic) == 2 ) {
						    	  resp.sendRedirect(urlPortalGmud);
						    	  return;
						      }
						   }
						
						RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
						requestDispatcher.forward(request, response);
					}else {
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
						request.setAttribute("msg", "Favor realizar Login!");
						requestDispatcher.forward(request, response);
					}
			
				}
			
			
			}else {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
				request.setAttribute("msg", "Informe Login e Senha corretos!");
				requestDispatcher.forward(request, response);
			}
		}catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage() + " <br> " + e.toString() + " <br> " + e.getLocalizedMessage() + " <br> " + e.getCause() + " <br> " + e.initCause(e) );
			requestDispatcher.forward(request, response);
		}
	}
}
