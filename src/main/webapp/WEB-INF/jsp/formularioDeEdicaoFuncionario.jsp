<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Cadastro de Funcionário - EZmalteria</title>

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
			<li class="treeview active">
              <a href="#">
                <i class="fa fa-plus"></i>
                <span>Cadastro</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
				<li><a href="<c:url value="/gerenciarClientes"/>"><i class="fa fa-users"></i> Cliente</a></li>
				<li><a href="#" class="current"><i class="fa fa-user-plus"></i> Funcionário</a></li>
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
              <a href="<c:url value="/gerenciarServicosRealizados"/>">
                <i class="fa fa-briefcase"></i> <span>Serviço Realizado</span>
              </a>
            </li>
            <li class="treeview">
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
				<h1>Cadastro de Funcionário</h1>
				<ol class="breadcrumb">
					<li><a href="index"><i class="fa fa-home"></i>Home</a></li>
					<li class="active">Cadastro de Funcionário</li>
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
									if (clickedButton.name == "deletarFuncionario") {
										form.action = "deletarFuncionario";
									}
									if(confirm("Deseja deletar este funcionário?")){
										form.submit();
									}
								}
							</script>
							<span id="status">Status: ${insertResult}</span>
							<!-- form start -->
							<form:form name="form" method="POST" action="salvarFuncionarioEditado" id="fform">
								<table>
									<tr>
										<table>
											<tr>
												<td id="tdtwo"><form:label path="codFunc">Código do Funcionário <font class="ast">*</font></form:label>
													<form:input path="codFunc" class="form-control"
														id="inputCodFunc" required="required" /></td>
												<td id="tdtwo"><form:label path="estado">Estado</form:label>
													<form:select path="estado" class="form-control">
														<form:option value="${estado}">${estado}</form:option>
														<form:option value="ativo">Ativo</form:option>
														<form:option value="inativo">Inativo</form:option>
													</form:select></td>
											</tr>
										</table>
									</tr>
								</table>
								<h3 class="box-title">Dados Pessoais</h3>
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
												<td id="tdtwo"><form:label path="estadoCivil">Estado Civil</form:label>
													<form:select path="estadoCivil" class="form-control">
														<form:option value="solteiro">Solteiro/a</form:option>
														<form:option value="casado">Casado/a</form:option>
														<form:option value="viuvo">Viúvo/a</form:option>
														<form:option value="outro">Outro</form:option>
													</form:select></td>
												<td id="tdtwo"><form:label path="cpf">CPF <font class="ast">*</font></form:label>
													<form:input path="cpf" class="form-control" id="inputCPF"
														required="required" /></td>
												<td id="tdtwo"><form:label path="rg">RG <font class="ast">*</font></form:label> <form:input
														path="rg" class="form-control" id="inputRG"
														required="required" /></td>
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
											<tr>
												<table>
													<tr>
														<td id="tdtwo"><form:label path="nascimento">Data de Nascimento <font class="ast">*</font></form:label>
															<form:input path="nascimento" class="form-control"
																id="inputNasc" required="required" /></td>
														<td id="tdtwo"><form:label path="sexo">Sexo</form:label>
															<form:select path="sexo" class="form-control">
																<form:option value="masculino">Masculino</form:option>
																<form:option value="feminino">Feminino</form:option>
															</form:select></td>
													</tr>
												</table>
											</tr>
										</table>
										<h3 class="box-title">Endereço</h3>
										<table>
											<tr>
												<table>
													<tr>
														<td width="75%" id="pad"><form:label
																path="logradouro">Logradouro <font class="ast">*</font></form:label> <form:input
																path="logradouro" class="form-control"
																id="inputLogradouro" required="required" /></td>
														<td width="25%" id="pad"><form:label path="numero">Número <font class="ast">*</font></form:label>
															<form:input path="numero" class="form-control"
																id="inputLogradouro" required="required" /></td>
													</tr>
												</table>
											</tr>
											<tr>
												<table>
													<tr>
														<td width="37%" id="pad"><form:label path="bairro">Bairro <font class="ast">*</font></form:label>
															<form:input path="cidade" class="form-control"
																id="inputBairro" required="required" /></td>
														<td width="37%" id="pad"><form:label path="cidade">Cidade <font class="ast">*</font></form:label>
															<form:input path="bairro" class="form-control"
																id="inputCidade" required="required" /></td>
														<td width="26%" id="pad"><form:label path="uf">UF</form:label>
															<form:select class="form-control" path="uf">
																<form:option value="SP">SP</form:option>
																<form:option value="AC">AC</form:option>
																<form:option value="AL">AL</form:option>
																<form:option value="AP">AP</form:option>
																<form:option value="AM">AM</form:option>
																<form:option value="BA">BA</form:option>
																<form:option value="CE">CE</form:option>
																<form:option value="DF">DF</form:option>
																<form:option value="ES">ES</form:option>
																<form:option value="GO">GO</form:option>
																<form:option value="MA">MA</form:option>
																<form:option value="MT">MT</form:option>
																<form:option value="MS">MS</form:option>
																<form:option value="MG">MG</form:option>
																<form:option value="PA">PA</form:option>
																<form:option value="PB">PB</form:option>
																<form:option value="PR">PR</form:option>
																<form:option value="PE">PE</form:option>
																<form:option value="PI">PI</form:option>
																<form:option value="RJ">RJ</form:option>
																<form:option value="RN">RN</form:option>
																<form:option value="RS">RS</form:option>
																<form:option value="RO">RO</form:option>
																<form:option value="RR">RR</form:option>
																<form:option value="SC">SC</form:option>
																<form:option value="SE">SE</form:option>
																<form:option value="TO">TO</form:option>
															</form:select>
													</tr>
												</table>
											</tr>
											<tr>
												<table>
													<tr>
														<td width="35%" id="pad"><form:label path="cep">CEP <font class="ast">*</font></form:label>
															<form:input path="cep" class="form-control" id="inputCEP"
																required="required" /></td>
														<td width="65%" id="pad"><form:label
																path="complemento">Complemento</form:label> <form:input
																path="complemento" class="form-control"
																id="inputComplemento" /></td>
													</tr>
												</table>
											</tr>
										</table>
										<h3 class="box-title">Dados Trabalhistas</h3>
										<table>
											<tr>
												<table>
													<tr>
														<td id="tdone"><form:label path="tipoFuncionario">Tipo do Funcionário</form:label>
															<form:select path="tipoFuncionario" class="form-control">
																<form:option value="registrado">Registrado</form:option>
																<form:option value="freelancer">Freelancer</form:option>
															</form:select></td>
														<td id="tdone"><form:label path="carteiraTrabalho">Carteira de Trabalho</form:label>
															<form:input path="carteiraTrabalho" class="form-control"
																id="inputCarteiraTrabalho" /></td>
													</tr>
												</table>
											</tr>
											<tr>
												<table>
													<tr>
														<td id="tdone"><form:label path="dataInclusao">Funcionário desde <font class="ast">*</font></form:label>
															<form:input path="dataInclusao" class="form-control"
																id="inputFuncDesde" required="required" /></td>
														<td id="tdone"><form:label path="salarioFixo">Salário Fixo</form:label>
															<form:input path="salarioFixo" class="form-control"
																id="inputSalario" /></td>
													</tr>
												</table>
											</tr>
										</table>
										<h3 class="box-title">Perfil de Usuário</h3>
										<table>
											<tr>
												<table>
													<tr>
														<td id="tdtwo"><form:label path="email">E-mail/Usuário</form:label>
															<form:input path="email" class="form-control"
																id="inputEmail" required="required" /></td>
														<td id="tdtwo"><form:label path="senha">Senha</form:label>
															<form:input path="senha" class="form-control"
																id="inputSenha" required="required" /></td>
														<td id="tdtwo"><form:label path="perfil">Perfil</form:label>
															<form:select path="perfil" class="form-control">
																<form:option value="adm">Administrador</form:option>
																<form:option value="ger">Gerente</form:option>
																<form:option value="func">Funcionário</form:option>
															</form:select></td>
													</tr>
												</table>
											</tr>
										</table>
										<div class="box-footer">
											<input type="submit" class="btn btn-primary"
												value="Salvar Edição" />
											<input type="button"
												class="btn btn-primary" name="deletarFuncionario"
												value="Deletar Funcionario" onClick=submitForm(this) />
										</div>
									</form:form>
											<script type="text/javascript">
							
							if(${insertResult}==""){
								if(document.getElementByid("inputNome").value==""){
									
									window.location.href="/editarDeletarFuncionario";
								}
							}else{
								
								if(${insertResult=="0"}){
									alert("Dados inválidos!\nFuncionario não editado!");
									window.location.href="/editarDeletarFuncionario";
								}else if(${insertResult=="1"}){
										alert("Editado com sucesso!");
										window.location.href="/index";
									}else if(${insertResult=="2"}){
										alert("Email ou CPF duplicado!");
										window.location.href="/editarDeletarFuncionario";
									}else if(${insertResult=="4"}){
										alert("Falha de comunicacao com banco de dados");
										window.location.href="/editarDeletarFuncionario";
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
			</div>
			<!-- ./wrapper -->
		</div>
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
	<script src="<c:url value="/resources/plugins/jquery.maskMoney.js"/>" type="text/javascript" /></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#inputSalario").maskMoney({prefix : 'R$ ', allowNegative : true, thousands : '.', decimal : ',', affixesStay : false});
	});
	</script>
	<!--Máscaras-->
	<script type="text/javascript" src="<c:url value="/resources/plugins/jquery.maskedinput.js"/>" /></script>
	<script type="text/javascript">
	jQuery(function($) {
		$("#inputRG").mask("99.999.999-*");
		$("#inputCPF").mask("999.999.999-99");
		$("#inputTelCel").mask("(99) 99999-9999");
		$("#inputTelRes").mask("(99) 9999-9999");
		$("#inputCEP").mask("99999-999");
		$("#inputNasc").mask("99/99/9999");
		$("#inputFuncDesde").mask("99/99/9999");
	});
	</script>
	
	<script type="text/javascript">
		$('#fform').submit(function(event){
			var cpf = $("#inputCPF").val();
			cpf = cpf.replace(/[^\d]+/g,'');
			var data = $("#inputNasc").val();
			var registro = $("#inputFuncDesde").val();
			var email = $("#inputEmail").val();
			var dia = data.substring(0, 2);
			var mes = data.substring(3, 5);
			var ano = data.substring(6, 10);
			var dia2 = registro.substring(0, 2);
			var mes2 = registro.substring(3, 5);
			var ano2 = registro.substring(6, 10);
			var dataval = false;
			var registroval = false;
			var cpfval = false;
			var emailval = false;
			if(mes == 2){
				if((ano % 4 == 0)){
					if(dia > 0 && dia <= 29){
						dataval = true;
					}
					else{
						alert("Data de Nascimento inválida!");
						return false;
					}
				}
				else{	
					if(dia > 0 && dia <= 28){
						dataval = true;
					}
					else{
						alert("Data de Nascimento inválida!");
						return false;
					}
				}
			}
			else if (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12){
				if(dia > 0 && dia <= 31){
					dataval = true;
				}
				else{
					alert("Data de Nascimento inválida!");
					return false;
				}
			}
			else if (mes == 4 || mes == 6 || mes == 9 || mes == 11){
				if(dia > 0 && dia <= 30){
					dataval = true;
				}
				else{
					alert("Data de Nascimento inválida!");
					return false;
				}
			}
			else{
				alert("Data de Nascimento inválida!");
				return false;
			}
			if(mes2 == 2){
				if((ano2 % 4 == 0)){
					if(dia2 > 0 && dia2 <= 29){
						registroval = true;
					}
					else{
						alert("Data de Registro inválida!");
						return false;
					}
				}
				else{	
					if(dia2 > 0 && dia2 <= 28){
						registroval = true;
					}
					else{
						alert("Data de Registro inválida!");
						return false;
					}
				}
			}
			else if (mes2 == 1 || mes2 == 3 || mes2 == 5 || mes2 == 7 || mes2 == 8 || mes2 == 10 || mes2 == 12){
				if(dia2 > 0 && dia2 <= 31){
					registroval = true;
				}
				else{
					alert("Data de Registro inválida!");
					return false;
				}
			}
			else if (mes2 == 4 || mes2 == 6 || mes2 == 9 || mes2 == 11){
				if(dia2 > 0 && dia2 <= 30){
					registroval = true;
				}
				else{
					alert("Data de Registro inválida!");
					return false;
				}
			}
			else{
				alert("Data de Registro inválida!");
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
			if(cpfval == true && dataval == true && emailval == true || registroval == true){
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
