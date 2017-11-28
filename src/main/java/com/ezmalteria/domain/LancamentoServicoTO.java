package com.ezmalteria.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "lancamentoordemservico")
public class LancamentoServicoTO {

	@Id
	@Column(name = "idlancamento")
	private String idLancamento;
	@Column(name = "nomefuncionario")
	private String nomeFuncionario;
	@Column(name = "codfunc")
	private String codFunc;
	@Column(name = "nomecliente")
	private String nomeCliente;
	@Column(name = "comanda")
	private String comanda;
	@Column(name = "alicate")
	private String alicate;
	@Column(name = "idtiposervico")
	private String idTipoServico;
	@Column(name = "valor")
	private String valor;
	@Column(name = "tipofuncionario")
	private String tipoFuncionario;
	@Column(name = "datainclusao")
	private String dataInclusao;
	@Column(name = "dataalteracao")
	private String dataAlteracao;
	@Column(name = "databaixa")
	private String dataBaixa;
	@Column(name = "manicurepreco")
	private String manicurePreco;
	@Column(name = "manicure")
	private String manicure;
	@Column(name = "pedicure")
	private String pedicure;
	@Column(name = "francesinha")
	private String francesinha;
	@Column(name = "esmaltar")
	private String esmaltar;
	@Column(name = "pernaint")
	private String pernaint;
	@Column(name = "perna12")
	private String perna12;
	@Column(name = "virilha")
	private String virilha;
	@Column(name = "intima")
	private String intima;
	@Column(name = "axila")
	private String axila;
	@Column(name = "sobrancelha")
	private String sobrancelha;
	@Column(name = "buco")
	private String buco;
	@Column(name = "pedicurePreco")
	private String pedicurePreco;
	@Column(name = "francesinhaPreco")
	private String francesinhaPreco;
	@Column(name = "esmaltarpreco")
	private String esmaltarPreco;
	@Column(name = "pernaintpreco")
	private String pernaintPreco;
	@Column(name = "perna12preco")
	private String perna12Preco;
	@Column(name = "virilhapreco")
	private String virilhaPreco;
	@Column(name = "intimapreco")
	private String intimaPreco;
	@Column(name = "axilapreco")
	private String axilaPreco;
	@Column(name = "sobrancelhapreco")
	private String sobrancelhaPreco;
	@Column(name = "bucopreco")
	private String bucoPreco;
	@Column(name = "preco")
	private String preco;
	@Column(name = "formapagamento")
	private String formaPagamento;

	@Transient
	private String dataPesquisaInicio;
	@Transient
	private String dataPesquisaFim;
	@Transient
	private String nomePesquisaCliente;
	@Transient
	private String nomePesquisaFuncionario;

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

	public String getIdLancamento() {
		return idLancamento;
	}

	public void setIdLancamento(String idLancamento) {
		this.idLancamento = idLancamento;
	}

	public String getComanda() {
		return comanda;
	}

	public void setComanda(String comanda) {
		this.comanda = comanda;
	}

	public String getAlicate() {
		return alicate;
	}

	public void setAlicate(String alicate) {
		this.alicate = alicate;
	}

	public String getIdTipoServico() {
		return idTipoServico;
	}

	public void setIdTipoServico(String idTipoServico) {
		this.idTipoServico = idTipoServico;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getTipoFuncionario() {
		return tipoFuncionario;
	}

	public void setTipoFuncionario(String tipoFuncionario) {
		this.tipoFuncionario = tipoFuncionario;
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

	public String getCodFunc() {
		return codFunc;
	}

	public void setCodFunc(String codFunc) {
		this.codFunc = codFunc;
	}

	public String getNomeCliente() {
		return nomeCliente;
	}

	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}

	public String getNomeFuncionario() {
		return nomeFuncionario;
	}

	public void setNomeFuncionario(String nomeFuncionario) {
		this.nomeFuncionario = nomeFuncionario;
	}

	public String getManicurePreco() {
		return manicurePreco;
	}

	public void setManicurePreco(String manicurePreco) {
		this.manicurePreco = manicurePreco;
	}

	public String getManicure() {
		return manicure;
	}

	public void setManicure(String manicure) {
		this.manicure = manicure;
	}

	public String getPedicure() {
		return pedicure;
	}

	public void setPedicure(String pedicure) {
		this.pedicure = pedicure;
	}

	public String getFrancesinha() {
		return francesinha;
	}

	public void setFrancesinha(String francesinha) {
		this.francesinha = francesinha;
	}

	public String getEsmaltar() {
		return esmaltar;
	}

	public void setEsmaltar(String esmaltar) {
		this.esmaltar = esmaltar;
	}

	public String getPernaint() {
		return pernaint;
	}

	public void setPernaint(String pernaint) {
		this.pernaint = pernaint;
	}

	public String getPerna12() {
		return perna12;
	}

	public void setPerna12(String perna12) {
		this.perna12 = perna12;
	}

	public String getVirilha() {
		return virilha;
	}

	public void setVirilha(String virilha) {
		this.virilha = virilha;
	}

	public String getIntima() {
		return intima;
	}

	public void setIntima(String intima) {
		this.intima = intima;
	}

	public String getAxila() {
		return axila;
	}

	public void setAxila(String axila) {
		this.axila = axila;
	}

	public String getSobrancelha() {
		return sobrancelha;
	}

	public void setSobrancelha(String sobrancelha) {
		this.sobrancelha = sobrancelha;
	}

	public String getBuco() {
		return buco;
	}

	public void setBuco(String buco) {
		this.buco = buco;
	}

	public String getPedicurePreco() {
		return pedicurePreco;
	}

	public void setPedicurePreco(String pedicurePreco) {
		this.pedicurePreco = pedicurePreco;
	}

	public String getFrancesinhaPreco() {
		return francesinhaPreco;
	}

	public void setFrancesinhaPreco(String francesinhaPreco) {
		this.francesinhaPreco = francesinhaPreco;
	}

	public String getEsmaltarPreco() {
		return esmaltarPreco;
	}

	public void setEsmaltarPreco(String esmaltarPreco) {
		this.esmaltarPreco = esmaltarPreco;
	}

	public String getPernaintPreco() {
		return pernaintPreco;
	}

	public void setPernaintPreco(String pernaintPreco) {
		this.pernaintPreco = pernaintPreco;
	}

	public String getPerna12Preco() {
		return perna12Preco;
	}

	public void setPerna12Preco(String perna12Preco) {
		this.perna12Preco = perna12Preco;
	}

	public String getVirilhaPreco() {
		return virilhaPreco;
	}

	public void setVirilhaPreco(String virilhaPreco) {
		this.virilhaPreco = virilhaPreco;
	}

	public String getIntimaPreco() {
		return intimaPreco;
	}

	public void setIntimaPreco(String intimaPreco) {
		this.intimaPreco = intimaPreco;
	}

	public String getAxilaPreco() {
		return axilaPreco;
	}

	public void setAxilaPreco(String axilaPreco) {
		this.axilaPreco = axilaPreco;
	}

	public String getSobrancelhaPreco() {
		return sobrancelhaPreco;
	}

	public void setSobrancelhaPreco(String sobrancelhaPreco) {
		this.sobrancelhaPreco = sobrancelhaPreco;
	}

	public String getBucoPreco() {
		return bucoPreco;
	}

	public void setBucoPreco(String bucoPreco) {
		this.bucoPreco = bucoPreco;
	}

	public String getPreco() {
		return preco;
	}

	public void setPreco(String preco) {
		this.preco = preco;
	}

	public String getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public String getNomePesquisaCliente() {
		return nomePesquisaCliente;
	}

	public void setNomePesquisaCliente(String nomePesquisaCliente) {
		this.nomePesquisaCliente = nomePesquisaCliente;
	}

	public String getNomePesquisaFuncionario() {
		return nomePesquisaFuncionario;
	}

	public void setNomePesquisaFuncionario(String nomePesquisaFuncionario) {
		this.nomePesquisaFuncionario = nomePesquisaFuncionario;
	}

}
