package com.ezmalteria.domain;
//aguardando jsp
public class ProdutoTO {
	
	String idProduto="";
	String tipo="";
	String nomeProduto="";
	String marca="";
	String identificacaoProduto="";
	String cor="";
	String quantidade="";
	String valor="";
	String codigoProduto="";
	String dataInclusao="";
	String dataAlteracao="";
	String dataExclusao="";
	private String dataPesquisaInicio = "";
	private String dataPesquisaFim = "";
	
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
	public String getIdProduto() {
		return idProduto;
	}
	public void setIdProduto(String idProduto) {
		this.idProduto = idProduto;
	}
	public String getTipo() {
		
		if (tipo.equals("depilacao")) {
			tipo = "1";
		} else {
			if (tipo.equals("manicure")) {
				tipo = "2";
			} else {
				tipo = "3";
			}
		}

		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public String getIdentificacaoProduto() {
		return identificacaoProduto;
	}
	public void setIdentificacaoProduto(String identificacaoProduto) {
		this.identificacaoProduto = identificacaoProduto;
	}
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
	public String getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
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
	public String getDataExclusao() {
		return dataExclusao;
	}
	public void setDataExclusao(String dataExclusao) {
		this.dataExclusao = dataExclusao;
	}
	public String getNomeProduto() {
		return nomeProduto;
	}
	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getCodigoProduto() {
		return codigoProduto;
	}
	public void setCodigoProduto(String codigoProduto) {
		this.codigoProduto = codigoProduto;
	}

}
