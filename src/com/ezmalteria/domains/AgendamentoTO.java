package com.ezmalteria.domains;

public class AgendamentoTO {

private String idAgendamento="";
private String data = "";
private String hora = "";
private String cliente = "";
private String funcionario = "";
private String servico = "";

public String getServico() {
	return servico;
}

public void setServico(String servico) {
	this.servico = servico;
}

public String getFuncionario() {
	return funcionario;
}

public void setFuncionario(String funcionario) {
	this.funcionario = funcionario;
}

public String getCliente() {
	return cliente;
}

public void setCliente(String cliente) {
	this.cliente = cliente;
}

public String getHora() {
	return hora;
}

public void setHora(String hora) {
	this.hora = hora;
}

public String getData() {
	return data;
}

public void setData(String data) {
	this.data = data;
}

public String getIdAgendamento() {
	return idAgendamento;
}

public void setIdAgendamento(String idAgendamento) {
	this.idAgendamento = idAgendamento;
}
}