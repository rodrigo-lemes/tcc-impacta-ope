package com.ezmalteria.domains;

public class DespesasTO {
	
	//criado insert, falta jsp
	
	private String idDespesa = "";
	private String codigo = "";
	private String tipoDespesa = "";
	private String dsDespesa = "";
	private String valor = "";
	private String dataInclusao = "";
	private String dataAlteracao = "";
	private String dataBaixa = "";
	private String dataPesquisaInicio = "";
	private String dataPesquisaFim = "";
	
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
