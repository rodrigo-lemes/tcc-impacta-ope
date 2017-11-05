<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Pesquisa de Serviços Realizados - EZmalteria</title>

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
							<!-- Sidebar toggle button-->
							<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
							  <span class="sr-only">Toggle navigation</span>
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
              <a href="<c:url value="/gerenciarServicosRealizados"/>">
                <i class="fa fa-briefcase"></i> <span>Serviço Realizado</span>
              </a>
            </li>
            <li class="treeview">
              <a href="<c:url value="/gerenciarAgendamentos"/>">
                <i class="fa fa-calendar"></i> <span>Agendamento</span>
              </a>
            </li>
			<li class="treeview active">
              <a href="#">
                <i class="fa fa-search"></i>
                 <span>Pesquisa</span>
				<i class="fa fa-angle-left pull-right"></i>
              </a>
				<ul class="treeview-menu">
					<li><a href="<c:url value="/editarDeletarCliente"/>"><i class="fa fa-users"></i> Cliente</a></li>
					<li><a href="<c:url value="/editarDeletarFuncionario"/>"><i class="fa fa-sort-amount-asc"></i>Funcionário</a></li>
					<li><a href="<c:url value="/editarDeletarProduto"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
					<li><a href="#" class="current"><i class="fa fa-briefcase"></i> Serviço</a></li>
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
				<h1>Pesquisa de Serviços Realizados</h1>
				<ol class="breadcrumb">
					<li><a href="/index"><i class="fa fa-home"></i>Home</a></li>
					<li class="active">Pesquisa de Serviços</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-6">
						<!-- general form elements -->
						<div class="box box-primary">
							<h3 class="box-title">Lista de Serviços Realizados</h3>
							<!-- form start -->
							<script>
								function submitForm(clickedButton) {
									var idLancamento = clickedButton.id;
									form.idLancamento.value = idLancamento;
									form.submit();
								}
							</script>
							<form:form name="form" method="POST"
								action="formularioDeEdicaoServicoRealizado"
								modelAttribute="command">
								<table>
									<tr>
										<td id="tdone">
											<form:label path="idLancamento"></form:label>
											<form:input type="hidden" name="idLancamento" path="idLancamento" class="form-control" id="inputIdLancamento" />
										</td>
									</tr>
								</table>
							</form:form>
							<c:if test="${not empty listaServicos}">
								<table class="bdtable">
								  <tr>
									<td class="topbording fontdb"><b>Nome do<br/>Cliente</b></td>
									<td class="topbording fontdb"><b>Nome do<br/>Funcionário</b></td>
									<td class="topbording fontdb"><b>Nº de<br/>Comanda</b></td>
									<td class="topbording fontdb"><b>Serviço</b></td>
									<td class="topbording fontdb"><b>Valor</b></td>
									<td class="topbording fontdb"><b>Data</b></td>
								</tr>
								<c:forEach var="listValue" items="${listaServicos}">
									<!-- Contador -->
											<c:if test="${not empty listValue.nomeCliente}">
													<c:set var="counter" value="${counter + 1}" />
											</c:if>
											<!-- Conversão de valores para verificação -->
											<c:if test="${not empty listValue.manicurePreco}">
												<fmt:formatNumber var="manic"
														value='${fn:replace(listValue.manicurePreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.manicurePreco}">
												<fmt:formatNumber var="manic" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValue.pedicurePreco}">
												<fmt:formatNumber var="pedic"
														value='${fn:replace(listValue.pedicurePreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.pedicurePreco}">
												<fmt:formatNumber var="pedic" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValue.francesinhaPreco}">
												<fmt:formatNumber var="franc"
														value='${fn:replace(listValue.francesinhaPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.francesinhaPreco}">
												<fmt:formatNumber var="franc" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValue.esmaltarPreco}">
												<fmt:formatNumber var="esmal"
														value='${fn:replace(listValue.esmaltarPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.esmaltarPreco}">
												<fmt:formatNumber var="esmal" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValue.pernaintPreco}">
												<fmt:formatNumber var="peint"
														value='${fn:replace(listValue.pernaintPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.pernaintPreco}">
												<fmt:formatNumber var="peint" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValue.perna12Preco}">
												<fmt:formatNumber var="pe12"
														value='${fn:replace(listValue.perna12Preco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.perna12Preco}">
												<fmt:formatNumber var="pe12" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValue.virilhaPreco}">
												<fmt:formatNumber var="viril"
														value='${fn:replace(listValue.virilhaPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.virilhaPreco}">
												<fmt:formatNumber var="viril" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValue.intimaPreco}">
												<fmt:formatNumber var="intim"
														value='${fn:replace(listValue.intimaPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.intimaPreco}">
												<fmt:formatNumber var="intim" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValue.axilaPreco}">
												<fmt:formatNumber var="axil"
														value='${fn:replace(listValue.axilaPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.axilaPreco}">
												<fmt:formatNumber var="axil" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValue.sobrancelhaPreco}">
												<fmt:formatNumber var="sobran"
														value='${fn:replace(listValue.sobrancelhaPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.sobrancelhaPreco}">
												<fmt:formatNumber var="sobran" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValue.bucoPreco}">
												<fmt:formatNumber var="bucoo"
														value='${fn:replace(listValue.bucoPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValue.bucoPreco}">
												<fmt:formatNumber var="bucoo" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${manic != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Manicure</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.manicurePreco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>
											<c:if test="${pedic != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Pedicure</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.pedicurePreco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>	
											<c:if test="${franc != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Francesinha</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.francesinhaPreco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>	
												<c:if test="${esmal != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Esmaltar</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.esmaltarPreco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>	
											<c:if test="${peint != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Perna Int.</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.pernaintPreco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>	
											<c:if test="${pe12 != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Perna 1/2</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.perna12Preco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>	
											<c:if test="${viril != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Virilha</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.virilhaPreco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>	
											<c:if test="${intim != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Íntima Completa</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.intimaPreco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>	
											<c:if test="${axil != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Axila</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.axilaPreco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>	
											<c:if test="${sobran != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Sobrancelha</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.sobrancelhaPreco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>	
											<c:if test="${bucoo != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeCliente}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.nomeFuncionario}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.comanda}</p></td>
													<td class="topbording" id="pad"><p align="center">Buço</p></td>
													<td class="topbording" id="pad"><p align="center">R$
															${listValue.bucoPreco}</p></td>
													<td class="topbording" id="pad"><p align="center">
															${listValue.dataInclusao}</p></td>
													<td id="pad" valign="top">
														<button name="${listValue.idLancamento}" id="${listValue.idLancamento}" type="submit" class="icon-search fa fa-pencil" 
															onClick=submitForm(this)>
													</button></td>
												</tr>
											</c:if>
									</c:forEach>
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

</body>
</html>
