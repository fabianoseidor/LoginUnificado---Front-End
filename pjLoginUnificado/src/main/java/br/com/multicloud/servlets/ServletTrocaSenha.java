package br.com.multicloud.servlets;

import java.io.IOException;
import java.net.InetAddress;

import br.com.multicloud.services.UserService;
import br.com.multicloud.util.Md5Criptografia;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletTrocaSenha
 */
public class ServletTrocaSenha extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletTrocaSenha() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

	   		String senha1 = request.getParameter("senha1");
	   		String senha2 = request.getParameter("senha2");

			String urlAPI = "";
	        InetAddress ia = InetAddress.getLocalHost();
	        String node = ia.getHostName();
	        if(node.equals("PIBASTIANDEV")) urlAPI = "http://localhost:8091/loginUnificado/";
	        else urlAPI = "http://10.154.20.134:8091/loginUnificado/";

//			String urlBuscaLogin = urlAPI + "loginPassAPP/";
//			Users user = UserService.buscaUserLogin(login, senha, urlBuscaLogin); 
	   		
	   		
	   		if( ( senha1 != null && !senha1.isEmpty() ) && ( senha2 != null && !senha2.isEmpty() ) ) {

				if( senha1.equals(senha2) ) {
					
					String novasenha = Md5Criptografia.convertPasswordToMD5( senha1 );
				    HttpServletRequest req = (HttpServletRequest) request;
					HttpSession session    = req.getSession();
				    String usuarioLogado   = (String) session.getAttribute("usuario");
				    Long idPessoa          = (Long) session.getAttribute("idPessoa");
				    				    
				    String resultAPI = UserService.updatePassoword(usuarioLogado, novasenha, idPessoa, urlAPI );
				    
				    if(resultAPI.trim().equals("OK")) {
					   RequestDispatcher requestDispatcher = request.getRequestDispatcher("principal/PagPrincipal.jsp");
					   requestDispatcher.forward(request, response);
				    }else {
						RequestDispatcher requestDispatcher = request.getRequestDispatcher("cadastro/trocaSenhaPrimeiroAcesso.jsp");
						request.setAttribute("msg", "As sehas não são iguais, favor ajustar!");
						requestDispatcher.forward(request, response);
				    }
				}else {
					RequestDispatcher requestDispatcher = request.getRequestDispatcher("cadastro/trocaSenhaPrimeiroAcesso.jsp");
					request.setAttribute("msg", "Erro ao atualizar a Senha!");
					requestDispatcher.forward(request, response);
				}
	   		}
				
			}catch(Exception e){
				e.printStackTrace();
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("erro.jsp");
				request.setAttribute("msg", e.getMessage());
				requestDispatcher.forward(request, response);			
			}
	}

}
