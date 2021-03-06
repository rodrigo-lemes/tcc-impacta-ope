<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>P�gina Inicial - EZmalteria</title>

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
			<a href="#top" class="logo">
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
            <li class="treeview active">
              <a href="#top" class="current">
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
				<li><a href="<c:url value="/gerenciarFuncionarios"/>"><i class="fa fa-user-plus"></i> Funcion�rio</a></li>
				<li><a href="<c:url value="/gerenciarProdutos"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
				<li><a href="<c:url value="/gerenciarDespesas"/>"><i class="fa fa-sort-amount-asc"></i> Despesas</a></li>
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
				<h1>P�gina Inicial</h1>
				<ol class="breadcrumb">
					<li class="active"><i class="fa fa-home"></i>Home</a></li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-6">
						<!-- general form elements -->
						<div class="box box-primary">
							<form:form name = "form" method="POST" action="formularioDeEdicaoAgendamento"
								modelAttribute="command">
								<table>
									<tr>
										<td id="tdone"><form:label path="idAgendamento"></form:label>
										<form:input type="hidden" name = "idAgendamento" path="idAgendamento" class="form-control" id="inputIdAgendamento" style="display:none" /></td>
									</tr>
								</table>
							<!-- form start -->
							<script>
								function submitForm(clickedButton) {
									var idAgendamento=clickedButton.name;
									form.idAgendamento.value=idAgendamento;
									form.submit();
								}
							</script>
							</form:form>
						<h3>Alerta de falta de produtos</h3>
							<c:if test="${not empty listaProdutosAcabando}">
								<table class="bdtable">
								  <tr>
									<td class="topbording fontdb"><b>&nbsp;&nbsp;Nome</b></td>
									<td class="topbording fontdb"><b>&nbsp;&nbsp;Marca</b></td>
									<td class="topbording fontdb"><b>&nbsp;&nbsp;Cor</b></td>
									<td class="topbording fontdb"><b>&nbsp;&nbsp;Quantidade</b></td>
									<td class="fontdb"><b>&nbsp;&nbsp;C�digo</b></td>
								  </tr>
									<c:forEach var="listValue" items="${listaProdutosAcabando}">
										<tr class="hovering bording">
											<td class="topbording" id="pad"><p class="" align="center"> ${listValue.nomeProduto}</p></td>
											<c:choose>
												<c:when test="${listValue.marca == null}">
													<td class="topbording" id="pad"><p align="center"> <font color="gray">N/A</font></p></td>
												</c:when>
												<c:otherwise>
													<td class="topbording" id="pad"><p align="center"> ${listValue.marca}</p></td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test='${listValue.cor == ""}'>
													<td class="topbording" id="pad"><p align="center"> <font color="gray">N/A</font></p></td>
												</c:when>
												<c:otherwise>
													<td class="topbording" id="pad"><p align="center"> ${listValue.cor}</p></td>
												</c:otherwise>
											</c:choose>
											<c:if test="${listValue.quantidade <= 2}">
												<td class="topbording" id="pad"><p align="center"> <font color="red">${listValue.quantidade}</font></p></td>
											</c:if>
											<c:if test="${listValue.quantidade > 2}">
												<c:if test="${listValue.quantidade <= 5}">
													<td class="topbording" id="pad"><p align="center"> <font color="#E6B304">${listValue.quantidade}</font></p></td>
												</c:if>
												<c:if test="${listValue.quantidade > 5}">
													<td class="topbording" id="pad"><p align="center"> <font color="green">${listValue.quantidade}</font></p></td>
												</c:if>
											</c:if>
											<td id="pad" valign="middle"><p align="center"> ${listValue.codigoProduto}</p></td>
										</tr>
									</c:forEach>
								</table>
								<br/>
							</c:if>
						</div>
						<!-- general form elements -->
						<div class="box box-primary">
							<h3>Agendamentos do dia</h3>
								<c:if test="${not empty listaAgendamentos}">
								  <table class="bdtable">
								  <tr>
									<td class="topbording fontdb"><b>&nbsp;&nbsp;Data</b></td>
									<td class="topbording fontdb"><b>&nbsp;&nbsp;Hor�rio</b></td>
									<td class="topbording fontdb"><b>&nbsp;&nbsp;Cliente</b></td>
									<td class="topbording fontdb"><b>&nbsp;&nbsp;Funcion�rio</b></td>
									<td class="topbording fontdb"><b>&nbsp;&nbsp;Servi�o</b></td>
								  </tr>
									<c:forEach var="listValue" items="${listaAgendamentos}">
										<tr class="hovering" style="border: 1px solid black;">
											<td class="topbording" id="pad"><p align="center">${listValue.data}</p></td>
											<td class="topbording" id="pad"><p align="center">${listValue.hora}</p></td>
											<td class="topbording" id="pad"><p align="center">${listValue.cliente}</p></td>
											<td class="topbording" id="pad"><p align="center">${listValue.funcionario}</p></td>
											<td class="topbording" id="pad"><p align="center">${listValue.servico}</p></td>
											<td id="pad" valign="top">
												<button name="${listValue.idAgendamento}" id="${listValue.idAgendamento}" type="submit" class="icon-search fa fa-pencil" 
													onClick=submitForm(this)>
												</button>
											</td>
										</tr>
									</c:forEach>
								  </table>
								</c:if>
								<br/>
							</div>
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
	
</body>
</html>
