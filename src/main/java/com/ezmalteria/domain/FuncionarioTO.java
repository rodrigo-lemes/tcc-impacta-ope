package com.ezmalteria.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="funcionario")
public class FuncionarioTO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idfuncionario",unique=true, nullable = false)
	private String idFuncionario;
	@Column(name="nome")
	private String nome;
	@Column(name="estadocivil")
	private String estadoCivil;
	@Column(name="rg")
	private String rg;
	@Column(name="cpf")
	private String cpf;
	@Column(name="datanascimento")
	private String nascimento;
	@Column(name="telefone")
	private String telRes;
	@Column(name="celular")
	private String telCel;
	@Column(name="logradouro")
	private String logradouro;
	@Column(name="numero")
	private String numero;
	@Column(name="bairro")
	private String bairro;
	@Column(name="cidade")
	private String cidade;
	@Column(name="uf")
	private String uf;
	@Column(name="cep")
	private String cep;
	@Column(name="complemento")
	private String complemento;
	@Column(name="tipofuncionario")
	private String tipoFuncionario;
	@Column(name="carteiratrabalho")
	private String carteiraTrabalho;
	@Column(name="datainclusao")
	private String dataInclusao;
	@Column(name="dataalteracao")
	private String dataAlteracao;
	@Column(name="dataexclusao")
	private String dataExclusao;
	@Column(name="sexo")
	private String sexo;
	@Column(name="codigofuncionario")
	private String codFunc;
	@Column(name="statusfuncionario")
	private String estado;
	@Column(name="salario")
	private String salarioFixo;
	@Column(name="email")
	private String email;
	@Column(name="senha")
	private String senha;
	@Column(name="perfil")
	private String perfil;
	
	@Transient
	private String dataPesquisaInicio;
	
	@Transient
	private String dataPesquisaFim;

	public String getIdFuncionario() {
		return idFuncionario;
	}

	public void setIdFuncionario(String idFuncionario) {
		this.idFuncionario = idFuncionario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getNascimento() {
		return nascimento;
	}

	public void setNascimento(String nascimento) {
		this.nascimento = nascimento;
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

	public String getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(String dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public String getDataExclusao() {
		return dataExclusao;
	}

	public void setDataExclusao(String dataExclusao) {
		this.dataExclusao = dataExclusao;
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

	public String getSalarioFixo() {
		return salarioFixo;
	}

	public void setSalarioFixo(String salarioFixo) {
		this.salarioFixo = salarioFixo;
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

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {

		if (estado.equals("1")) {
			this.estado = "Ativo";
		} else if (estado.equals("0")) {
			this.estado = "Inativo";
		} else if (estado.toLowerCase().equals("ativo")) {
			this.estado = "1";
		} else {
			this.estado = "0";
		}

		System.out.println("Setted Status: " + this.estado);
	}

}
