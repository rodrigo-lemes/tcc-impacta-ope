<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Cadastro de Cliente - EZmalteria</title>

<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<!--EZmalteria CSS-->
<link href="<c:url value="/resources/css/styletest.css" />"
	rel="stylesheet">
<!-- Bootstrap 3.3.2 -->
<link href="<c:url value="/resources/css/bootstrap_style.css" />"
	rel="stylesheet">
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- ICON -->
<link rel="shortcut icon"
	href="<c:url value="/resources/img/favicon.ico"/>">

</head>

<body class="skin-blue">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="<c:url value="/index"/>" class="logo"> <img
				src="<c:url value="/resources/img/EZmalteria_logo-2.png" />" /></a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<table>
					<tr>
						<td width="15%">
							<!-- Sidebar toggle button--> <a href="#" class="sidebar-toggle"
							data-toggle="offcanvas" role="button"> <span class="sr-only">Toggle
									navigation</span>
						</a>
						</td>
						<td id="logout" width="84%"><a href="<c:url value="/"/>">Logout</a>
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
					<li class="treeview"><a href="<c:url value="/index"/>"> <i
							class="fa fa-home"></i> <span>Painel principal</span>
					</a></li>
					<li class="treeview active"><a href="#"> <i
							class="fa fa-plus"></i> <span>Cadastro</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="#top" class="current"><i
									class="fa fa-users"></i> Cliente</a></li>
							<li><a href="<c:url value="/gerenciarFuncionarios"/>"><i
									class="fa fa-user-plus"></i> Funcionário</a></li>
							<li><a href="<c:url value="/gerenciarProdutos"/>"><i
									class="fa fa-dropbox"></i> Estoque</a></li>
							<li><a href="<c:url value="/gerenciarDespesas"/>"><i
									class="fa fa-sort-amount-asc"></i> Despesas</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span>Relatório</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="<c:url value="/relatorioFinanceiro"/>"><i
									class="fa fa-money"></i> Financeiro</a></li>
							<li><a href="<c:url value="/relatorioClientes"/>"><i
									class="fa fa-users"></i> Cliente</a></li>
							<li><a href="<c:url value="/relatorioFuncionarios"/>"><i
									class="fa fa-user-plus"></i> Funcionário</a></li>
							<li><a href="<c:url value="/relatorioProdutos"/>"><i
									class="fa fa-dropbox"></i> Estoque</a></li>
							<li><a href="<c:url value="/relatorioServicosRealizados"/>"><i
									class="fa fa-briefcase"></i> Serviço</a></li>
							<li><a href="<c:url value="/relatorioDespesas"/>"><i
									class="fa fa-sort-amount-asc"></i> Despesas</a></li>
						</ul></li>
					<li class="treeview"><a
						href="<c:url value="/gerenciarServicosRealizados"/>"> <i
							class="fa fa-briefcase"></i> <span>Serviço Realizado</span>
					</a></li>
					<li class="treeview"><a
						href="<c:url value="/gerenciarAgendamentos"/>"> <i
							class="fa fa-calendar"></i> <span>Agendamento</span>
					</a></li>
					<li class="treeview"><a href="#"> <i class="fa fa-search"></i>
							<span>Pesquisa</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="<c:url value="/editarDeletarCliente"/>"><i
									class="fa fa-users"></i> Cliente</a></li>
							<li><a href="<c:url value="/editarDeletarFuncionario"/>"><i
									class="fa fa-sort-amount-asc"></i>Funcionário</a></li>
							<li><a href="<c:url value="/editarDeletarProduto"/>"><i
									class="fa fa-dropbox"></i> Estoque</a></li>
							<li><a
								href="<c:url value="/editarDeletarServicoRealizado"/>"><i
									class="fa fa-briefcase"></i> Serviço</a></li>
							<li><a href="<c:url value="/editarDeletarDespesa"/>"><i
									class="fa fa-sort-amount-asc"></i> Despesas</a></li>
						</ul></li>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Cadastro de Cliente</h1>
				<ol class="breadcrumb">
					<li><a href="/"><i class="fa fa-home"></i>Home</a></li>
					<li class="active">Cadastro de Cliente</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-6">
						<!-- general form elements -->
						<div class="box box-primary">
							<h3 class="box-title">Dados Pessoais</h3>
							<!-- form start -->


							<script>
								function submitForm(clickedButton) {
									if (clickedButton.name == "deletarCliente") {

										form.action = "deletarCliente";

									}
									if(confirm("Deseja deletar este cliente?")){
										form.submit();
									}
								}
							</script>


							<form:form name="form" method="POST"
								action="salvarClienteEditado" id="cform">
								<table>
									<tr>
										<table>
											<tr>
												<td id="pad"><form:label path="nome">Nome <font class="ast">*</font></form:label>
													<form:input path="nome" class="form-control" id="inputNome"
														required="required" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone"><form:label path="nascimento">Data de nascimento <font class="ast">*</font></form:label>
													<form:input path="nascimento" class="form-control"
														id="inputNasc" required="required" /></td>
												<td id="tdone"><form:label path="cpf">CPF</form:label>
													<form:input path="cpf" class="form-control" id="inputCPF" /></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone"><form:label path="sexo">Sexo</form:label>
													<form:select path="sexo" class="form-control">
														<form:option value="masculino">Masculino</form:option>
														<form:option value="feminino">Feminino</form:option>
													</form:select></td>
												<td id="tdone"><form:label path="email">E-mail <font class="ast">*</font></form:label>
													<form:input path="email" class="form-control"
														id="inputEmail" required="required"/></td>
											</tr>
										</table>
									</tr>
									<tr>
										<table>
											<tr>
												<td id="tdone"><form:label path="telRes">Telefone Residencial</form:label>
													<form:input path="telRes" class="form-control"
														id="inputTelRes" /></td>
												<td id="tdone"><form:label path="telCel">Telefone Celular <font class="ast">*</font></form:label>
													<form:input path="telCel" class="form-control"
														id="inputTelCel" required="required" /></td>
											</tr>
										</table>
									</tr>
								</table>
								<div class="box-footer">
									<input type="submit" class="btn btn-primary"
										value="Salvar Edição" /> <input type="button"
										class="btn btn-primary" name="deletarCliente"
										value="Deletar Cliente" onClick=submitForm(this) />
								</div>
							</form:form>
							<script type="text/javascript">
							
							if(${insertResult}==""){
								if(document.getElementByid("inputNome").value==""){
									
									window.location.href="/formularioDeEdicaoCliente";
								}
							}else{
								
								if(${insertResult=="0"}){
									alert("Dados inválidos!\nCliente não editado!");
									window.location.href="/editarDeletarCliente";
								}else if(${insertResult=="1"}){
										alert("Editado com sucesso!");
										window.location.href="/index";
									}else if(${insertResult=="2"}){
										alert("Email ou CPF duplicado!");
										window.location.href="/editarDeletarCliente";
									}else if(${insertResult=="4"}){
										alert("Falha de comunicacao com banco de dados");
										window.location.href="/editarDeletarCliente";
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
			<strong>Copyright &copy; 2015 <a>EZmalteria</a>.
			</strong> All rights reserved.
		</footer>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.1.3 -->
	<script
		src="<c:url value="/resources/plugins/jQuery/jQuery-2.1.3.min.js"/>"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script
		src="<c:url value="/resources/plugins/fastclick/fastclick.min.js"/>"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value="/resources/dist/js/app.min.js"/>"
		type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value="/resources/dist/js/demo.js"/>"
		type="text/javascript"></script>

	<!--Máscaras-->
	<script type="text/javascript"
		src="<c:url value="/resources/plugins/jquery.maskedinput.js"/>" /></script>
	<script type="text/javascript">
		jQuery(function($) {
			$("#inputCPF").mask("999.999.999-99");
			$("#inputTelCel").mask("(99) 99999-9999");
			$("#inputTelRes").mask("(99) 9999-9999");
			$("#inputNasc").mask("99/99/9999");
		});
	</script>
	<script type="text/javascript">
		$('#cform').submit(function(event){
			var cpf = $("#inputCPF").val();
			cpf = cpf.replace(/[^\d]+/g,'');
			var data = $("#inputNasc").val();
			var email = $("#inputEmail").val();
			var dia = data.substring(0, 2);
			var mes = data.substring(3, 5);
			var ano = data.substring(6, 10);
			var dataval = false;
			var cpfval = false;
			var emailval = false;
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
			if (cpf == "00000000000" || cpf == "11111111111" || cpf == "22222222222" || cpf == "33333333333" || 
			        cpf == "44444444444" || cpf == "55555555555" || cpf == "66666666666" || 
			        cpf == "77777777777" || cpf == "88888888888" || cpf == "99999999999"){
				//event.preventDefault();
				alert("CPF inválido!");
				return false;
			}
			soma = 0;
			for(i = 0; i < 9; i++)
			{
				soma += parseInt(cpf.charAt(i)) * (10 - i);
			}
			resto = 11 - (soma % 11);
			if(resto == 10 || resto == 11)
			{
				resto = 0;
			}
			if(resto != parseInt(cpf.charAt(9))){
				alert("CPF inválido!");
				return false;
			}
			
			soma = 0;
			for(i = 0; i < 10; i ++)
			{
				soma += parseInt(cpf.charAt(i)) * (11 - i);
			}
			resto = 11 - (soma % 11);
			if(resto == 10 || resto == 11)
			{
				resto = 0;
			}
			
			if(resto != parseInt(cpf.charAt(10))){
				alert("CPF inválido!");
				return false;
			}
			else{
				cpfval = true;
		    }
			if(email.indexOf("@") > -1){
				emailval = true;
			}
			else{
				alert("Insira um e-mail válido.");
				return false;
			}
			if(cpfval == true && dataval == true && emailval == true){
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
