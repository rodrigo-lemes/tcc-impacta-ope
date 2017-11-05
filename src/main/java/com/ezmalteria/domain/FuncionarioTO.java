package com.ezmalteria.domain;

public class FuncionarioTO {
//ok - testado falta jsp com campos adicionais
	private String idFuncionario = "";
	private String nome = "";
	private String estadoCivil = "";
	private String rg = "";
	private String cpf = "";
	private String nascimento = "";
	private String telRes = "";
	private String telCel = "";
	private String logradouro = "";
	private String numero = "";
	private String bairro = "";
	private String cidade = "";
	private String uf = "";
	private String cep = "";
	private String complemento = "";
	private String tipoFuncionario = "";
	private String carteiraTrabalho = "";
	private String dataInclusao = "";
	private String dataAlteracao = "";
	private String dataExclusao = "";
	private String sexo = "";
	private String codFunc = "";
	private String estado = "";
	private String salarioFixo = "";
	private String email = "";
	private String senha = "";
	private String perfil = "";
	private String dataPesquisaInicio = "";
	private String dataPesquisaFim = "";
	
	
	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	// ===========================

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getCpf() {
		return cpf;
	}

	// ============================

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getRg() {
		return rg;
	}

	public void setNascimento(String nascimento) {
		this.nascimento = nascimento;
	}

	public String getNascimento() {
		return nascimento;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getCodFunc() {
		return codFunc;
	}

	public void setCodFunc(String codFunc) {
		this.codFunc = codFunc;
	}

	public String getEstado() {

		System.out.println("This status will be returned: "+ estado);
		return estado;
	}

	public void setEstado(String estado) {
		
		if(estado.equals("1")){
			this.estado="Ativo";
		}else if(estado.equals("0")){
			this.estado="Inativo";
		}else if(estado.toLowerCase().equals("ativo")){
			this.estado="1";
		}else {this.estado="0";}
		
		System.out.println("Setted Status: "+this.estado);
	}

	public String getSalarioFixo() {
		return salarioFixo;
	}

	public void setSalarioFixo(String salarioFixo) {
		this.salarioFixo = salarioFixo;
	}

	

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getTipoFuncionario() {
		return tipoFuncionario;
	}

	public void setTipoFuncionario(String tipoFuncionario) {
		this.tipoFuncionario = tipoFuncionario;
	}

	public String getCarteiraTrabalho() {
		return carteiraTrabalho;
	}

	public void setCarteiraTrabalho(String carteiraTrabalho) {
		this.carteiraTrabalho = carteiraTrabalho;
	}

	

	public String getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(String dataInclusao) {
		this.dataInclusao = dataInclusao;
	}

	public String getDataExclusao() {
		return dataExclusao;
	}

	public void setDataExclusao(String dataExclusao) {
		this.dataExclusao = dataExclusao;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	public String getIdFuncionario() {
		return idFuncionario;
	}

	public void setIdFuncionario(String idFuncionario) {
		this.idFuncionario = idFuncionario;
	}

	public String getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(String dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public String getTelRes() {
		return telRes;
	}

	public void setTelRes(String telRes) {
		this.telRes = telRes;
	}

	public String getTelCel() {
		return telCel;
	}

	public void setTelCel(String telCel) {
		this.telCel = telCel;
	}

	public String getDataPesquisaInicio() {
		return dataPesquisaInicio;
	}

	public void setDataPesquisaInicio(String dataPesquisaInicio) {
		this.dataPesquisaInicio = dataPesquisaInicio;
	}

	public String getDataPesquisaFim() {
		return dataPesquisaFim;
	}

	public void setDataPesquisaFim(String dataPesquisaFim) {
		this.dataPesquisaFim = dataPesquisaFim;
	}

}
