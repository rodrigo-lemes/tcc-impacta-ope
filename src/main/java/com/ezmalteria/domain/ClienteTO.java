package com.ezmalteria.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="cliente")
public class ClienteTO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="idcliente",unique=true, nullable = false)
	private String idCliente;
	@Column(name="nome")
	private String nome;
	@Column(name="telres")
	private String telRes;
	@Column(name="telcel")
	private String telCel;
	@Column(name="email")
	private String email;
	@Column(name="nascimento")
	private String nascimento;
	@Column(name="sexo")
	private String sexo;
	@Column(name="cpf")
	private String cpf;
	@Column(name="datainclusao")
	private String dataInclusao;
	@Column(name="dataalteracao")
	private String dataAlteracao;
	@Column(name="dataexclusao")
	private String dataExclusao;
	
	@Transient
	private String dataPesquisaInicio;
	@Transient
	private String dataPesquisaFim;

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getCpf() {
		return cpf;
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

	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(String dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
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

	public String getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(String idCliente) {
		this.idCliente = idCliente;
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
