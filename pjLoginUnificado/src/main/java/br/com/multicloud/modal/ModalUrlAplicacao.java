package br.com.multicloud.modal;

public class ModalUrlAplicacao {

	private String aplicacao;
	private String login;
	private String admin;
	private String loginUnificado;
	private String url;
	private String urlDoGet;
	private String urlDoPost;
	private String urlLogin;
	private String urlTelaAplic;
	
	
	public String getUrlLogin() {
		return urlLogin;
	}
	public void setUrlLogin(String urlLogin) {
		this.urlLogin = urlLogin;
	}
	public String getUrlDoGet() {
		return urlDoGet;
	}
	public void setUrlDoGet(String urlDoGet) {
		this.urlDoGet = urlDoGet;
	}
	public String getUrlDoPost() {
		return urlDoPost;
	}
	public void setUrlDoPost(String urlDoPost) {
		this.urlDoPost = urlDoPost;
	}
	public String getUrlTelaAplic() {
		return urlTelaAplic;
	}
	public void setUrlTelaAplic(String urlTelaAplic) {
		this.urlTelaAplic = urlTelaAplic;
	}
	public String getAplicacao() {
		return aplicacao;
	}
	public void setAplicacao(String aplicacao) {
		this.aplicacao = aplicacao;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getLoginUnificado() {
		return loginUnificado;
	}
	public void setLoginUnificado(String loginUnificado) {
		this.loginUnificado = loginUnificado;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "ModalUrlAplicacao [aplicacao=" + aplicacao + ", login=" + login + ", admin=" + admin
				+ ", loginUnificado=" + loginUnificado + ", url=" + url + ", urlDoGet=" + urlDoGet + ", urlDoPost="
				+ urlDoPost + ", urlTelaAplic=" + urlTelaAplic + "]";
	}

	
}
