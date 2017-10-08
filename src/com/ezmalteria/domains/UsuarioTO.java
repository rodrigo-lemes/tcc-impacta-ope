package com.ezmalteria.domains;

public class UsuarioTO {

	//testado com tela de login
	
	private String usuario;
	private String senha;

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getUsuario() {
		return usuario;
	}

	// ===========================

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getSenha() {
		return senha;
	}
}