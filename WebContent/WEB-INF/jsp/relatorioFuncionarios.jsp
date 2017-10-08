<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Relatório de Funcionários - EZmalteria</title>

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
			<a href="<c:url value="/index" />" class="logo">
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
            <li class="treeview active">
              <a href="#">
                <i class="fa fa-pie-chart"></i> <span>Relatório</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
				<li><a href="<c:url value="/relatorioFinanceiro"/>"><i class="fa fa-money"></i> Financeiro</a></li>
				<li><a href="<c:url value="/relatorioClientes"/>"><i class="fa fa-users"></i> Cliente</a></li>
				<li><a href="#top" class="current"><i class="fa fa-user-plus"></i> Funcionário</a></li>
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
        </section>
        <!-- /.sidebar -->
      </aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Relatório de Funcionários</h1>
				<ol class="breadcrumb">
					<li><a href="/index"><i class="fa fa-home"></i>Home</a></li>
					<li class="active">Relatório de Funcionários</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-6">
						<!-- general form elements -->
						<div class="box box-primary">
							<!-- form start -->

							<form:form action="relatorioFuncionarios">
								<table>
								  <tr>
								  	<td id="tdone">
										<form:label path="dataPesquisaInicio">Data Inicial <font class="ast">*</font></form:label>
										<form:input path="dataPesquisaInicio" class="form-control" id="inputDataInicio" required="required"/>
									</td>
									<td id="tdone">							
										<form:label path="dataPesquisaFim">Data Final <font class="ast">*</font></form:label>
										<form:input path="dataPesquisaFim" class="form-control" id="inputDataFim" required="required"/>
									</td>
								  </tr>
								</table>
							<div class="box-footer">
								<input type="submit" class="btn btn-primary"  value="Gerar Relatório">
							</div>
							</form:form>
							<c:if test="${not empty listaFuncionarios}">
								<c:set var="counter" value="0"/>
								<h3>&nbsp;Funcionários - ${dataPesquisaInicio} à ${dataPesquisaFim}</h3>
								<br>
								<table class="bdtable">
								  <tr>
									<td class="topbording fontdb"><b>Nome</b></td>
									<td class="topbording fontdb"><b>RG</b></td>
									<td class="topbording fontdb"><b>CPF</b></td>
									<td class="topbording fontdb"><b>Telefone<br/>Residencial</b></td>
									<td class="topbording fontdb"><b>Telefone<br/>Celular</b></td>
									<td class="topbording fontdb"><b>Tipo de<br/>Funcionário</b></td>
									<td class="topbording fontdb"><b>Código de<br/>Funcionário</b></td>
									<td class="topbording fontdb"><b>Status</b></td>
									<td class="fontdb"><b>Cadastro</b></td>
								  </tr>
									<!--Popular a lista de objetos no view-->
									<c:forEach var="listValue" items="${listaFuncionarios}">
										<tr class="hovering" style="border: 1px solid black;">
										<!--Converter a String do objeto para Date--> 								
										<fmt:parseDate value="${listValue.dataInclusao}" type="date" pattern="dd/MM/yyyy" var="data"/> 
										<!--Converter o filtro de inicio digitado para Date-->  			
										<fmt:parseDate value="${dataPesquisaInicio}" type="date" pattern="dd/MM/yyyy" var="dataFiltroInicio"/>	
										<!--Converter o filtro de fim digitado para Date-->	
										<fmt:parseDate value="${dataPesquisaFim}" type="date" pattern="dd/MM/yyyy" var="dataFiltroFim"/> 						
										<c:if test="${data>=dataFiltroInicio && data<=dataFiltroFim}">
											<td class="topbording" id="pad"><p align="center"> ${listValue.nome}</p></td>
											<c:if test="${not empty listValue.nome}">
												<c:set var="counter" value="${counter + 1}"/>
											</c:if>
											<td class="topbording" id="pad"><p align="center"> ${listValue.rg}</p></td>
											<td class="topbording" id="pad"><p align="center"> ${listValue.cpf}</p></td>
											<td class="topbording" id="pad"><p align="center"> ${listValue.telRes}</p></td>
											<td class="topbording" id="pad"><p align="center"> ${listValue.telCel}</p></td>
											<td class="topbording" id="pad"><p align="center"> ${listValue.tipoFuncionario}</p></td>
											<td class="topbording" id="pad"><p align="center"> ${listValue.codFunc}</p></td>
											<td class="topbording" id="pad"><p align="center"> ${listValue.estado}</p></td>
											<td class="" id="pad"><p align="center"> ${listValue.dataInclusao}</p></td>
										</c:if>
										</tr>
									</c:forEach>
									<c:if test="${counter == 0}">
										<tr>
											<td colspan="9" id="pad" class="nodata"><p align="center"> <font color="gray">Não existem dados</font></p>
											</td>
										</tr>
									</c:if>
								</table>
							</c:if>
							<br/>
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
	<script type="text/javascript" src="<c:url value="/resources/plugins/jquery.maskedinput.js"/>"/></script>
	<script type="text/javascript">
	jQuery(function($){
		$("#inputDataInicio").mask("99/99/9999");
		$("#inputDataFim").mask("99/99/9999");
	});
	</script>
	
</body>
</html>
