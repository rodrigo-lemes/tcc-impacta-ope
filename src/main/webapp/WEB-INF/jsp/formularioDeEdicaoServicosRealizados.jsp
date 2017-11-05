<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Serviço Realizado - EZmalteria</title>

<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>

<!--EZmalteria CSS-->
<link href="<c:url value="/resources/css/styletest.css" />"rel="stylesheet">
<!-- Bootstrap 3.3.2 -->
<link href="<c:url value="/resources/css/bootstrap_style.css" />" rel="stylesheet">
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- ICON -->
<link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico"/>">

</head>

<body class="skin-blue">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="<c:url value="/index"/>" class="logo">
			<img src="<c:url value="/resources/img/EZmalteria_logo-2.png" />" /></a>
			<!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
		  <table>
		    <tr>
		      <td width="15%">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                  <span class="sr-only">Toggle navigation</span>
                </a>
		      </td>
		      <td id="logout" width="84%">
		        <a href="<c:url value="/"/>">Logout</a>
		      </td>
		    </tr>
		  </table>
        </nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="treeview">
              <a href="<c:url value="/index"/>">
                <i class="fa fa-home"></i> <span>Painel principal</span>
              </a>
            </li>
			<li class="treeview">
              <a href="#">
                <i class="fa fa-plus"></i>
                <span>Cadastro</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
				<li><a href="<c:url value="/gerenciarClientes"/>"><i class="fa fa-users"></i> Cliente</a></li>
				<li><a href="<c:url value="/gerenciarFuncionarios"/>"><i class="fa fa-user-plus"></i> Funcionário</a></li>
				<li><a href="<c:url value="/gerenciarProdutos"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
				<li><a href="<c:url value="/gerenciarDespesas"/>"><i class="fa fa-sort-amount-asc"></i> Despesas</a></li>
			  </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i> <span>Relatório</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
				<li><a href="<c:url value="/relatorioFinanceiro"/>"><i class="fa fa-money"></i> Financeiro</a></li>
				<li><a href="<c:url value="/relatorioClientes"/>"><i class="fa fa-users"></i> Cliente</a></li>
				<li><a href="<c:url value="/relatorioFuncionarios"/>"><i class="fa fa-user-plus"></i> Funcionário</a></li>
				<li><a href="<c:url value="/relatorioProdutos"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
				<li><a href="<c:url value="/relatorioServicosRealizados"/>"><i class="fa fa-briefcase"></i> Serviço</a></li>
				<li><a href="<c:url value="/relatorioDespesas"/>"><i class="fa fa-sort-amount-asc"></i> Despesas</a></li>
			  </ul>
            </li>
            <li class="treeview">
              <a href="#" class="current">
                <i class="fa fa-briefcase"></i> <span>Serviço Realizado</span>
              </a>
            </li>
            <li class="treeview active">
              <a href="<c:url value="/gerenciarAgendamentos"/>">
                <i class="fa fa-calendar"></i> <span>Agendamento</span>
              </a>
            </li>
			<li class="treeview">
              <a href="#">
                <i class="fa fa-search"></i>
                 <span>Pesquisa</span>
				<i class="fa fa-angle-left pull-right"></i>
              </a>
				<ul class="treeview-menu">
					<li><a href="<c:url value="/editarDeletarCliente"/>"><i class="fa fa-users"></i> Cliente</a></li>
					<li><a href="<c:url value="/editarDeletarFuncionario"/>"><i class="fa fa-sort-amount-asc"></i>Funcionário</a></li>
					<li><a href="<c:url value="/editarDeletarProduto"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
					<li><a href="<c:url value="/editarDeletarServicoRealizado"/>"><i class="fa fa-briefcase"></i> Serviço</a></li>
					<li><a href="<c:url value="/editarDeletarDespesa"/>"><i class="fa fa-sort-amount-asc"></i> Despesas</a></li>
                </ul>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Serviço Realizado</h1>
				<ol class="breadcrumb">
					<li><a href="/"><i class="fa fa-home"></i>Home</a></li>
					<li class="active">Serviço Realizado</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-6">
						<!-- general form elements -->
						<div class="box box-primary">
							<script>
								function submitForm(clickedButton) {
									sumPrice();
									if (clickedButton.name == "deletarServicoRealizado") {
										form.action = "deletarServicoRealizado";
									}
									if(confirm("Deseja excluir este serviço?")){
										form.submit();
									}
								}
							</script>
							<span id="status">Status: ${insertResult}</span>
							
							<script type="text/javascript">
								function sumPrice() {
									var total = 0;

									if (document
											.getElementById("inputManicurePreco").value == "") {
										document
												.getElementById("inputManicurePreco").value = "0";
									}
									if (document
											.getElementById("inputPedicurePreco").value == "") {
										document
												.getElementById("inputPedicurePreco").value = "0";
									}
									if (document
											.getElementById("inputFrancesinhaPreco").value == "") {
										document
												.getElementById("inputFrancesinhaPreco").value = "0";
									}
									if (document
											.getElementById("inputEsmaltarPreco").value == "") {
										document
												.getElementById("inputEsmaltarPreco").value = "0";
									}
									if (document
											.getElementById("inputPernaIntPreco").value == "") {
										document
												.getElementById("inputPernaIntPreco").value = "0";
									}
									if (document
											.getElementById("inputPerna12Preco").value == "") {
										document
												.getElementById("inputPerna12Preco").value = "0";
									}
									if (document
											.getElementById("inputVirilhaPreco").value == "") {
										document
												.getElementById("inputVirilhaPreco").value = "0";
									}
									if (document
											.getElementById("inputIntimaPreco").value == "") {
										document
												.getElementById("inputIntimaPreco").value = "0";
									}
									if (document
											.getElementById("inputAxilaPreco").value == "") {
										document
												.getElementById("inputAxilaPreco").value = "0";
									}
									if (document
											.getElementById("inputSobrancelhaPreco").value == "") {
										document
												.getElementById("inputSobrancelhaPreco").value = "0";
									}
									if (document
											.getElementById("inputBucoPreco").value == "") {
										document
												.getElementById("inputBucoPreco").value = "0";
									}

									total = parseFloat(document
											.getElementById("inputManicurePreco").value
											.replace(",", "."))
											+ parseFloat(document
													.getElementById("inputPedicurePreco").value
													.replace(",", "."))
											+ parseFloat(document
													.getElementById("inputFrancesinhaPreco").value
													.replace(",", "."))
											+ parseFloat(document
													.getElementById("inputEsmaltarPreco").value
													.replace(",", "."))
											+ parseFloat(document
													.getElementById("inputPernaIntPreco").value
													.replace(",", "."))
											+ parseFloat(document
													.getElementById("inputPerna12Preco").value
													.replace(",", "."))
											+ parseFloat(document
													.getElementById("inputVirilhaPreco").value
													.replace(",", "."))
											+ parseFloat(document
													.getElementById("inputIntimaPreco").value
													.replace(",", "."))
											+ parseFloat(document
													.getElementById("inputAxilaPreco").value
													.replace(",", "."))
											+ parseFloat(document
													.getElementById("inputSobrancelhaPreco").value
													.replace(",", "."))
											+ parseFloat(document
													.getElementById("inputBucoPreco").value
													.replace(",", "."));

									var valorTotal = document
											.getElementById("inputPrecoTotal");
									total = total.toFixed(2);
									var sTotal = total.toString();
									sTotal = sTotal.replace(".", ",")
									valorTotal.value = sTotal;

								}
							</script>
							<!-- form start -->
							<form:form name = "form" method="POST" action="salvarEdicaoServicoRealizado" id="sform">
								<table>
									<tr>
									<table><tr>
										<td id="pad"><form:label path="nomeCliente">Nome do Cliente</form:label>
										<form:input path="nomeCliente" class="form-control" id="inputCliente" required="required"/>
										</td>
									</tr></table>
									</tr>
									<tr>
									<tr>
									<table><tr>
										<td width="65%" id="pad"><form:label path="nomeFuncionario">Nome do Funcionário</form:label>
										<form:input path="nomeFuncionario" class="form-control" id="inputFuncionario" required="required"/>
										</td>
										<td width="35%" id="pad"><form:label path="tipoFuncionario">Tipo</form:label>
										<form:select class="form-control" path="tipoFuncionario">
										  <form:option value="registrado" path="tipoFuncionario">Registrado</form:option>
										  <form:option value="freelancer" path="tipoFuncionario">Freelancer</form:option>
										</form:select>
										</td>
									</tr></table>
									</tr>
									<tr>
									<table><tr>
										<td width="40%" id="pad"><form:label path="dataInclusao">Data <font class="ast">*</font></form:label>
										<form:input path="dataInclusao" class="form-control" id="inputData" required="required"/>
										</td>
										<td width="40%" id="pad"><form:label path="comanda">Número de Comanda <font class="ast">*</font></form:label>
										<form:input path="comanda" class="form-control" id="inputComanda" required="required"/>
										</td>
										<td width="20%" id="pad"><form:label path="alicate">Alicate</form:label>
										<form:select class="form-control" path="alicate">
										  <form:option value="sim" path="alicate">Sim</form:option>
										  <form:option value="nao" path="alicate">Não</form:option>
										</form:select>
										</td>
									</tr></table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Manicure</font>
												</td>
												<td width="25%" id="pad"><form:label
														path="manicurePreco">Preço</form:label> <form:input
														path="manicurePreco" name="manic" class="form-control"
														id="inputManicurePreco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Pedicure</font>
												</td>
												<td width="25%" id="pad"><form:label
														path="pedicurePreco">Preço</form:label> <form:input
														path="pedicurePreco" class="form-control"
														id="inputPedicurePreco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Francesinha</font>
												</td>
												<td width="25%" id="pad"><form:label
														path="pedicurePreco">Preço</form:label> <form:input
														path="francesinhaPreco" class="form-control"
														id="inputFrancesinhaPreco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Esmaltar</font>
												</td>
												<td width="25%" id="pad"><form:label
														path="esmaltarPreco">Preço</form:label> <form:input
														path="esmaltarPreco" class="form-control"
														id="inputEsmaltarPreco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Perna
														Int.</font>
												</td>
												<td width="25%" id="pad"><form:label
														path="pernaintPreco">Preço</form:label> <form:input
														path="pernaintPreco" class="form-control"
														id="inputPernaIntPreco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Perna
														1/2</font>
												</td>
												<td width="25%" id="pad"><form:label
														path="perna12Preco">Preço</form:label> <form:input
														path="perna12Preco" class="form-control"
														id="inputPerna12Preco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Virilha</font>
												</td>
												<td width="25%" id="pad"><form:label
														path="virilhaPreco">Preço</form:label> <form:input
														path="virilhaPreco" class="form-control"
														id="inputVirilhaPreco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Íntima
														Completa</font>
												</td>
												<td width="25%" id="pad"><form:label path="intimaPreco">Preço</form:label>
													<form:input path="intimaPreco" class="form-control"
														id="inputIntimaPreco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Axila</font>
												</td>
												<td width="25%" id="pad"><form:label path="axilaPreco">Preço</form:label>
													<form:input path="axilaPreco" class="form-control"
														id="inputAxilaPreco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Sobrancelha</font>
												</td>
												<td width="25%" id="pad"><form:label
														path="sobrancelhaPreco">Preço</form:label> <form:input
														path="sobrancelhaPreco" class="form-control"
														id="inputSobrancelhaPreco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <font class="check-font">Buço</font>
												</td>
												<td width="25%" id="pad"><form:label path="bucoPreco">Preço</form:label>
													<form:input path="bucoPreco" class="form-control"
														id="inputBucoPreco" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone">
													<div id="BRBR">&nbsp;</div> <span><font
														class="check-font">Total</font></span>
												<td width="25%" id="pad"><form:label path="preco">Preço</form:label>
													<form:input path="preco" class="form-control"
														id="inputPrecoTotal" readonly="true" /></td>
											</tr>
										</table>
									</tr>
									<tr>
									<table><tr>
										
										<td id="tdone"><form:label path="formaPagamento">Forma de Pagamento</form:label>
										<form:select path="formaPagamento" class="form-control">
											<form:option value="credito">Crédito</form:option>
											<form:option value="debito">Débito</form:option>
											<form:option value="dinheiro">Dinheiro</form:option>
										</form:select></td>
									</tr></table>
									</tr>
								</table>
							<div class="box-footer">
							 <input type="submit" class="btn btn-primary"
										value="Salvar Edição" /> <input type="button"
										class="btn btn-primary" name="deletarServicoRealizado"
										value="Deletar Serviço Realizado" onClick=submitForm(this) />
							</div>
							</form:form>
									<script type="text/javascript">
							
							if(${insertResult}==""){
								if(document.getElementByid("inputCliente").value==""){
									
									window.location.href="/editarDeletarServicoRealizado";
								}
							}else{
								
								if(${insertResult=="0"}){
									alert("Dados inválidos!\nCliente não editado!");
									window.location.href="/editarDeletarServicoRealizado";
								}else if(${insertResult=="1"}){
										alert("Editado com sucesso!");
										window.location.href="/index";
									}else if(${insertResult=="2"}){
										
										
									}else if(${insertResult=="4"}){
										alert("Falha de comunicacao com banco de dados");
										window.location.href="/editarDeletarServicoRealizado";
										}else if(${insertResult=="5"}){
											alert("Deletado com sucesso");
											window.location.href="/index";
											}
								
							}
							
							</script>
			            </div>
					</div>
					<!--/.col (right) -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2015 <a>EZmalteria</a>.</strong> All rights reserved.
      </footer>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="<c:url value="/resources/plugins/jQuery/jQuery-2.1.3.min.js"/>"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <!-- FastClick -->
    <script src="<c:url value="/resources/plugins/fastclick/fastclick.min.js"/>"></script>
    <!-- AdminLTE App -->
    <script src="<c:url value="/resources/dist/js/app.min.js"/>" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<c:url value="/resources/dist/js/demo.js"/>" type="text/javascript"></script>
	
	<!--Máscaras-->
	<script src="<c:url value="/resources/plugins/jquery.maskMoney.js"/>" type="text/javascript"/></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#inputManicurePreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputPedicurePreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputFrancesinhaPreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputEsmaltarPreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputPernaIntPreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputPerna12Preco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputVirilhaPreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputIntimaPreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputSobrancelhaPreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputBucoPreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputAxilaPreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
		$("#inputPrecoTotal").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
	});
	</script>

	<!--Máscaras-->
	<script type="text/javascript" src="<c:url value="/resources/plugins/jquery.maskedinput.js"/>"/></script>
	<script type="text/javascript">
	jQuery(function($){
		$("#inputData").mask("99/99/9999");
	});
	</script>
		<script type="text/javascript">
		$('#sform').submit(function(event){
			var data = $("#inputData").val();
			var dia = data.substring(0, 2);
			var mes = data.substring(3, 5);
			var ano = data.substring(6, 10);
			var dataval = false;
			if(mes == 2){
				if((ano % 4 == 0)){
					if(dia > 0 && dia <= 29){
						dataval = true;
					}
					else{
						alert("Data inválida!");
						return false;
					}
				}
				else{	
					if(dia > 0 && dia <= 28){
						dataval = true;
					}
					else{
						alert("Data inválida!");
						return false;
					}
				}
			}
			else if (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12){
				if(dia > 0 && dia <= 31){
					dataval = true;
				}
				else{
					alert("Data inválida!");
					return false;
				}
			}
			else if (mes == 4 || mes == 6 || mes == 9 || mes == 11){
				if(dia > 0 && dia <= 30){
					dataval = true;
				}
				else{
					alert("Data inválida!");
					return false;
				}
			}
			else{
				alert("Data inválida!");
				return false;
			}
			if(dataval == true){
				if(confirm("Deseja enviar o formulário?")){
					document.form.submit;
					return true;
				}
				else{
					event.preventDefault();
					return false;
				}
			}

		});
	</script>
</body>
</html>
