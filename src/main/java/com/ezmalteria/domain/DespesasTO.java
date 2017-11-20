package com.ezmalteria.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="despesa")
public class DespesasTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="iddespesa",unique=true, nullable = false)
	private String idDespesa;
	@Column(name="")
	private String codigo;
	@Column(name="tipodespesa")
	private String tipoDespesa;
	@Column(name="dsdespesa")
	private String dsDespesa;
	@Column(name="valor")
	private String valor;
	@Column(name="datainclusao")
	private String dataInclusao;
	@Column(name="dataalteracao")
	private String dataAlteracao;
	@Column(name="databaixa")
	private String dataBaixa;
	
	@Transient
	private String dataPesquisaInicio;
	@Transient
	private String dataPesquisaFim;
	
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getTipoDespesa() {
		return tipoDespesa;
	}
	public void setTipoDespesa(String tipoDespesa) {
		this.tipoDespesa = tipoDespesa;
	}
	public String getDsDespesa() {
		return dsDespesa;
	}
	public void setDsDespesa(String dsDespesa) {
		this.dsDespesa = dsDespesa;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
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
	public String getDataBaixa() {
		return dataBaixa;
	}
	public void setDataBaixa(String dataBaixa) {
		this.dataBaixa = dataBaixa;
	}
	public String getIdDespesa() {
		return idDespesa;
	}
	public void setIdDespesa(String idDespesa) {
		this.idDespesa = idDespesa;
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
