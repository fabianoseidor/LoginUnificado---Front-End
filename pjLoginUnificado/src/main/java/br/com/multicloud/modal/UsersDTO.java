package br.com.multicloud.modal;

import java.util.Objects;

public class UsersDTO {
	private Long id_users;
	private String login;
	private String passoword;
	private String role;
	
	public UsersDTO( Long id_users, String login, String passoword, String role) {
		this.id_users = id_users;
		this.login = login;
		this.passoword = passoword;
		this.role = role;
	}
	
	
	public Long getId_users() {
		return id_users;
	}
	public void setId_users(Long id_users) {
		this.id_users = id_users;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassoword() {
		return passoword;
	}
	public void setPassoword(String passoword) {
		this.passoword = passoword;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public int hashCode() {
		return Objects.hash(id_users);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UsersDTO other = (UsersDTO) obj;
		return Objects.equals(id_users, other.id_users);
	}
	@Override
	public String toString() {
		return "UsersDTO [id_users=" + id_users + ", login=" + login + ", passoword=" + passoword + ", role=" + role
				+ "]";
	}

}
