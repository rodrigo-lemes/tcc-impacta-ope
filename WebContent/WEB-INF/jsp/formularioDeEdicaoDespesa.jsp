<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Cadastro de Despesa - EZmalteria</title>

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
			<a href="<c:url value="index"/>" class="logo">
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
              <a href="<c:url value="index"/>">
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
				<li><a href="<c:url value="/gerenciarFuncionarios"/>"><i class="fa fa-user-plus"></i> Funcion�rio</a></li>
				<li><a href="<c:url value="/gerenciarProdutos"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
				<li><a href="#top" class="current"><i class="fa fa-sort-amount-asc"></i> Despesas</a></li>
			  </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i> <span>Relat�rio</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
				<li><a href="<c:url value="/relatorioFinanceiro"/>"><i class="fa fa-money"></i> Financeiro</a></li>
				<li><a href="<c:url value="/relatorioClientes"/>"><i class="fa fa-users"></i> Cliente</a></li>
				<li><a href="<c:url value="/relatorioFuncionarios"/>"><i class="fa fa-user-plus"></i> Funcion�rio</a></li>
				<li><a href="<c:url value="/relatorioProdutos"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
				<li><a href="<c:url value="/relatorioServicosRealizados"/>"><i class="fa fa-briefcase"></i> Servi�o</a></li>
				<li><a href="<c:url value="/relatorioDespesas"/>"><i class="fa fa-sort-amount-asc"></i> Despesas</a></li>
			  </ul>
            </li>
            <li class="treeview">
              <a href="<c:url value="/gerenciarServicosRealizados"/>">
                <i class="fa fa-briefcase"></i> <span>Servi�o Realizado</span>
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
					<li><a href="<c:url value="/editarDeletarFuncionario"/>"><i class="fa fa-sort-amount-asc"></i>Funcion�rio</a></li>
					<li><a href="<c:url value="/editarDeletarProduto"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
					<li><a href="<c:url value="/editarDeletarServicoRealizado"/>"><i class="fa fa-briefcase"></i> Servi�o</a></li>
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
				<h1>Cadastro de Despesa</h1>
				<ol class="breadcrumb">
					<li><a href="/"><i class="fa fa-home"></i>Home</a></li>
					<li class="active">Cadastro de Despesa</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-6">
						<!-- general form elements -->
						<div class="box box-primary">
							<span id="status">Status: ${insertResult}</span>
							<!-- form start -->
								<script>
								function submitForm(clickedButton) {
									if (clickedButton.name == "deletarDespesa") {
										form.action = "deletarDespesa";
									}
									if(confirm("Deseja deletar esta despesa?")){
										form.submit();
									}
								}
							</script>
							<form:form name="form" method="POST" action="salvarDespesaEditada" id="dform">
								<table>
								  <tr>
									<table><tr>
									<td id="tdone"><form:label path="codigo">C�digo <font class="ast">*</font></form:label>
										<form:input path="codigo" class="form-control" id="inputCodigo" required="required"/>
									</td>
									<td id="tdone"><form:label path="tipoDespesa">Grupo</form:label>
										<form:select class="form-control" path="tipoDespesa" id="inputGrupo">
											<form:option value="deposito">Dep�sito</form:option>
											<form:option value="variaveis">Despesas Vari�veis</form:option>
											<form:option value="equipamento">Equipamento</form:option>
											<form:option value="imovel">Im�vel</form:option>
											<form:option value="imposto">Imposto</form:option>
											<form:option value="maodeobra">M�o de Obra</form:option>
											<form:option value="materiaprima">Mat�ria Prima</form:option>
										</form:select></td>
									</td>
									</tr></table>
								  </tr>
								  <tr>
									<table><tr>
									<td id="tdone"><form:label path="dsDespesa">Despesa <font class="ast">*</font></form:label>
										<form:input path="dsDespesa" class="form-control" id="inputDespesa" required="required"/>
									</td>
									</tr></table>
								  </tr>
								  <tr>
									<table><tr>
									<td id="tdone"><form:label path="valor">Pre�o <font class="ast">*</font></form:label>
										<form:input path="valor" class="form-control" id="inputPreco" required="required"/>
									</td>
									<td id="tdone"><form:label path="dataInclusao">Data de Inclus�o <font class="ast">*</font></form:label>
										<form:input path="dataInclusao" class="form-control" id="inputData" required="required"/>
									</td>
									</tr></table>
								  </tr>
								</table>
							<div class="box-footer">
							 
							  <input type="submit" class="btn btn-primary"
										value="Salvar Edi��o" /> <input type="button"
										class="btn btn-primary" name="deletarDespesa"
										value="Deletar Despesa" onClick=submitForm(this) />
							</div>
							</form:form>
									<script type="text/javascript">
							
							if(${insertResult}==""){
								if(document.getElementByid("inputDespesa").value==""){
									
									window.location.href="/editarDeletarDespesa";
								}
							}else{
								
								if(${insertResult=="0"}){
									alert("Dados inv�lidos!\nCliente n�o editado!");
									window.location.href="/editarDeletarDespesa";
								}else if(${insertResult=="1"}){
										alert("Editado com sucesso!");
										window.location.href="/index";
									}else if(${insertResult=="2"}){
										alert("Codigo de despesa duplicado!");
										window.location.href="/editarDeletarDespesa";
									}else if(${insertResult=="4"}){
										alert("Falha de comunicacao com banco de dados");
										window.location.href="/editarDeletarDespesa";
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
	<!--M�scaras-->
	<script src="<c:url value="/resources/plugins/jquery.maskMoney.js"/>" type="text/javascript"/></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#inputPreco").maskMoney({prefix:'R$ ', allowNegative: true, thousands:'.', decimal:',', affixesStay: false});
	});
	</script>
	<!--M�scaras-->
	<script type="text/javascript" src="<c:url value="/resources/plugins/jquery.maskedinput.js"/>"/></script>
	<script type="text/javascript">
	jQuery(function($){
		$("#inputData").mask("99/99/9999");
	});
	</script>
	
	<script type="text/javascript">
		$('#dform').submit(function(event){
			var data = $("#inputData").val();
			var dia = data.substring(0, 2);
			var mes = data.substring(3, 5);
			var ano = data.substring(6, 10);
			var dataval = false;
			if(mes == 2){
				if(((ano % 4) == 0) && ((ano % 100) != 0) || ((ano % 400) == 0)){
					if(dia > 0 && dia <= 29){
						dataval = true;
					}
					else{
						alert("Data inv�lida!");
						return false;
					}
				}
				else{	
					if(dia > 0 && dia <= 28){
						dataval = true;
					}
					else{
						alert("Data inv�lida!");
						return false;
					}
				}
			}
			else if (mes == 1 || mes == 3 || mes == 5 || mes == 7 || mes == 8 || mes == 10 || mes == 12){
				if(dia > 0 && dia <= 31){
					dataval = true;
				}
				else{
					alert("Data inv�lida!");
					return false;
				}
			}
			else if (mes == 4 || mes == 6 || mes == 9 || mes == 11){
				if(dia > 0 && dia <= 30){
					dataval = true;
				}
				else{
					alert("Data inv�lida!");
					return false;
				}
			}
			else{
				alert("Data inv�lida!");
				return false;
			}
			if(dataval == true){
				if(confirm("Deseja enviar o formul�rio?")){
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
