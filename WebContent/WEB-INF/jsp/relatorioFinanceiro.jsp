<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Relatório de Financeiro - EZmalteria</title>

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
				src="<c:url value="/resources/img/EZmalteria_logo-2.png" />" />
			</a>
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
					<li class="treeview"><a href="#"> <i class="fa fa-plus"></i>
							<span>Cadastro</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="<c:url value="/gerenciarClientes"/>"><i
									class="fa fa-users"></i> Cliente</a></li>
							<li><a href="<c:url value="/gerenciarFuncionarios"/>"><i
									class="fa fa-user-plus"></i> Funcionário</a></li>
							<li><a href="<c:url value="/gerenciarProdutos"/>"><i
									class="fa fa-dropbox"></i> Estoque</a></li>
							<li><a href="<c:url value="/gerenciarServicos"/>"><i
									class="fa fa-briefcase"></i> Serviço</a></li>
							<li><a href="<c:url value="/gerenciarDespesas"/>"><i
									class="fa fa-sort-amount-asc"></i> Despesas</a></li>
						</ul></li>
					<li class="treeview active"><a href="#"> <i
							class="fa fa-pie-chart"></i> <span>Relatório</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="#" class="current"><i class="fa fa-money"></i>
									Financeiro</a></li>
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
				<h1>Relatório Financeiro</h1>
				<ol class="breadcrumb">
					<li><a href="/index"><i class="fa fa-home"></i>Home</a></li>
					<li class="active">Relatório Financeiro</li>
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
							<form:form action="relatorioFinanceiro">
								<table>
									<tr>
										<td id="tdone"><form:label path="dataPesquisaInicio">Data Inicial <font class="ast">*</font></form:label>
											<form:input path="dataPesquisaInicio" class="form-control"
												id="inputDataInicio" required="required" /></td>
										<td id="tdone"><form:label path="dataPesquisaFim">Data Final <font class="ast">*</font></form:label>
											<form:input path="dataPesquisaFim" class="form-control"
												id="inputDataFim" required="required" /></td>
									</tr>
								</table>
								<div class="box-footer">
									<input type="submit" class="btn btn-primary"
										value="Gerar Relatório">
								</div>
							</form:form>
							<c:if test="${not empty listaDespesas}">
								<c:set var="counterD" value="0" />
								<c:set var="counterS" value="0" />
								<h3>&nbsp;Relatório Financeiro - ${dataPesquisaInicio} à
									${dataPesquisaFim}</h3>
								<br>
								<table class="bdtable">
									<tr>
										<td class="topbording fontdb"><b><p align="center">Data</p></b></td>
										<td class="topbording fontdb"><b><p align="center">Despesa</p></b></td>
										<td class="fontdb"><b><p align="center">Valor</p></b></td>
									</tr>
									<!--Popular a lista de objetos no view-->
									<c:forEach var="listValueDespesas" items="${listaDespesas}">
										<!--Converter a String do objeto para Date-->
										<fmt:parseDate value="${listValueDespesas.dataInclusao}"
											type="date" pattern="dd/MM/yyyy" var="data" />
										<!--Converter o filtro de inicio digitado para Date-->
										<fmt:parseDate value="${dataPesquisaInicio}" type="date"
											pattern="dd/MM/yyyy" var="dataFiltroInicio" />
										<!--Converter o filtro de fim digitado para Date-->
										<fmt:parseDate value="${dataPesquisaFim}" type="date"
											pattern="dd/MM/yyyy" var="dataFiltroFim" />
										<c:if test="${data>=dataFiltroInicio && data<=dataFiltroFim}">
											<tr class="hovering">
												<td class="topbording" id="pad"><p align="center">${listValueDespesas.dataInclusao}</p>
													<c:if test="${not empty listValueDespesas.dataInclusao}">
														<c:set var="counterD" value="${counterD + 1}" />
													</c:if></td>
												<td class="topbording" id="pad"><p align="center">${listValueDespesas.dsDespesa}</p>
												</td>
												<td class="" id="pad"><p align="center">
														<fmt:formatNumber
															value='${fn:replace(fn:replace(listValueDespesas.valor, ".", ""), ",", ".")}'
															type="currency" groupingUsed='true' />
													</p></td>
											</tr>
											<c:set var="despesasTotal"
												value="${despesasTotal + fn:replace(fn:replace(listValueDespesas.valor, '.', ''), ',', '.')}" />
										</c:if>
									</c:forEach>
									<c:if test="${counterD == 0}">
										<tr>
											<td colspan="8" id="pad" class="nodata"><p
													align="center">
													<font color="gray">Não existem despesas nesta data.</font>
												</p></td>
										</tr>
									</c:if>
									<tr>
										<td class="financ nodata topbording fontdb" colspan="2"><b><p
													align="center">Total de Despesas
														</p></b></td>
												<td class="financ nodata fontdb"><b><p
															align="center">
															<fmt:formatNumber value='${despesasTotal}'
																type="currency" groupingUsed='true' />
														</p></b></td>
									</tr>
									<tr>
										<td class="topbording fontdb"><b><p align="center">Data</p></b></td>
										<td class="topbording fontdb"><b><p align="center">Serviço</p></b></td>
										<td class="fontdb"><b><p align="center">Valor</p></b></td>
									</tr>
									<c:forEach var="listValueServicosRealizados"
										items="${listaServicosRealizados}">
										<!--Converter a String do objeto para Date-->
										<fmt:parseDate
											value="${listValueServicosRealizados.dataInclusao}"
											type="date" pattern="dd/MM/yyyy" var="data" />
										<!--Converter o filtro de inicio digitado para Date-->
										<fmt:parseDate value="${dataPesquisaInicio}" type="date"
											pattern="dd/MM/yyyy" var="dataFiltroInicio" />
										<!--Converter o filtro de fim digitado para Date-->
										<fmt:parseDate value="${dataPesquisaFim}" type="date"
											pattern="dd/MM/yyyy" var="dataFiltroFim" />
										<c:if test="${data>=dataFiltroInicio && data<=dataFiltroFim}">
											<!-- Conversão de valores para verificação -->
											<c:if test="${not empty listValueServicosRealizados.manicurePreco}">
												<fmt:formatNumber var="manic"
														value='${fn:replace(listValueServicosRealizados.manicurePreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.manicurePreco}">
												<fmt:formatNumber var="manic" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValueServicosRealizados.pedicurePreco}">
												<fmt:formatNumber var="pedic"
														value='${fn:replace(listValueServicosRealizados.pedicurePreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.pedicurePreco}">
												<fmt:formatNumber var="pedic" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValueServicosRealizados.francesinhaPreco}">
												<fmt:formatNumber var="franc"
														value='${fn:replace(listValueServicosRealizados.francesinhaPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.francesinhaPreco}">
												<fmt:formatNumber var="franc" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValueServicosRealizados.esmaltarPreco}">
												<fmt:formatNumber var="esmal"
														value='${fn:replace(listValueServicosRealizados.esmaltarPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.esmaltarPreco}">
												<fmt:formatNumber var="esmal" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValueServicosRealizados.pernaintPreco}">
												<fmt:formatNumber var="peint"
														value='${fn:replace(listValueServicosRealizados.pernaintPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.pernaintPreco}">
												<fmt:formatNumber var="peint" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValueServicosRealizados.perna12Preco}">
												<fmt:formatNumber var="pe12"
														value='${fn:replace(listValueServicosRealizados.perna12Preco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.perna12Preco}">
												<fmt:formatNumber var="pe12" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValueServicosRealizados.virilhaPreco}">
												<fmt:formatNumber var="viril"
														value='${fn:replace(listValueServicosRealizados.virilhaPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.virilhaPreco}">
												<fmt:formatNumber var="viril" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValueServicosRealizados.intimaPreco}">
												<fmt:formatNumber var="intim"
														value='${fn:replace(listValueServicosRealizados.intimaPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.intimaPreco}">
												<fmt:formatNumber var="intim" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValueServicosRealizados.axilaPreco}">
												<fmt:formatNumber var="axil"
														value='${fn:replace(listValueServicosRealizados.axilaPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.axilaPreco}">
												<fmt:formatNumber var="axil" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValueServicosRealizados.sobrancelhaPreco}">
												<fmt:formatNumber var="sobran"
														value='${fn:replace(listValueServicosRealizados.sobrancelhaPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.sobrancelhaPreco}">
												<fmt:formatNumber var="sobran" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${not empty listValueServicosRealizados.bucoPreco}">
												<fmt:formatNumber var="bucoo"
														value='${fn:replace(listValueServicosRealizados.bucoPreco, ",", ".")}'
														type="number" maxFractionDigits="2"/>
											</c:if>
											<c:if test="${empty listValueServicosRealizados.bucoPreco}">
												<fmt:formatNumber var="bucoo" value='0' type="number"
														maxFractionDigits="2"/>
											</c:if>
											<c:if test="${manic != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Manicure</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.manicurePreco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.manicurePreco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>
											<c:if test="${pedic != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Pedicure</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.pedicurePreco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.pedicurePreco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>	
											<c:if test="${franc != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Francesinha</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.francesinhaPreco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.manicurePreco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>	
												<c:if test="${esmal != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Esmaltar</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.esmaltarPreco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.esmaltarPreco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>	
											<c:if test="${peint != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Perna Int.</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.pernaintPreco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.pernaintPreco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>	
											<c:if test="${pe12 != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Perna 1/2</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.perna12Preco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.perna12Preco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>	
											<c:if test="${viril != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Virilha</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.virilhaPreco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.virilhaPreco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>	
											<c:if test="${intim != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Íntima Completa</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.intimaPreco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.intimaPreco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>	
											<c:if test="${axil != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Axila</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.axilaPreco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.axilaPreco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>	
											<c:if test="${sobran != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Sobrancelha</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.sobrancelhaPreco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.sobrancelhaPreco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>	
											<c:if test="${bucoo != '0'}">
												<tr class="hovering" style="border: 1px solid black;">
													<td class="topbording" id="pad"><p align="center">
															${listValueServicosRealizados.dataInclusao}</p></td>
													<td class="topbording" id="pad"><p align="center">Buço</p></td>
													<td class="" id="pad"><p align="center">R$
																${listValueServicosRealizados.bucoPreco}</p></td>
														<c:set var="servicosTotal"
															value="${servicosTotal +
														fn:replace(listValueServicosRealizados.bucoPreco, ',', '.')}" />
														<c:set var="counterS" value="${counterS + 1}" />
												</tr>
											</c:if>
										</c:if>
									</c:forEach>
									<c:if test="${counterS == 0}">
										<tr>
											<td colspan="8" id="pad" class="nodata"><p
													align="center">
													<font color="gray">Não existem serviços nesta data.</font>
												</p></td>
										</tr>
									</c:if>
									<tr>
										<td class="financ nodata topbording fontdb" colspan="2"><b><p
													align="center">Total de Serviços
														</p></b></td>
												<td class="financ nodata fontdb"><b><p
															align="center">
															<fmt:formatNumber value='${servicosTotal}'
																type="currency" groupingUsed='true' />
														</p></b></td>
									</tr>
									<tr>
										<c:set var="lucroTotal"
											value='${fn:replace(fn:replace(servicosTotal, "R$ ", ""), ",", ".") - fn:replace(fn:replace(despesasTotal, "R$ ", ""), ",", ".")}' />
										<td class="topbording fontfr" colspan="2"><b><p
													align="center">Lucro Total
														</p></b></td>
												<td class="fontfr"><b><p align="center">
															<fmt:formatNumber value='${lucroTotal}' type="currency"
																groupingUsed='true' />
														</p></b></td>
									</tr>
								</table>
							</c:if>
							<br />
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
			$("#inputDataInicio").mask("99/99/9999");
			$("#inputDataFim").mask("99/99/9999");
		});
	</script>
</body>
</html>
