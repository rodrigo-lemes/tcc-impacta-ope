<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>EZmalteria</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<!--EZmalteria CSS-->
	<link href="<c:url value="/resources/css/styletest.css" />" rel="stylesheet" type="text/css" />
	<!--Resumed CSS-->
	<link href="<c:url value="/resources/css/bootstrap_style.css" />" rel="stylesheet" type="text/css" />
	<!-- FontAwesome 4.3.0 -->
    <link href="<c:url value="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
    <!-- Ionicons 2.0.0 -->
    <link href="<c:url value="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" />" rel="stylesheet" type="text/css" />    
	<!-- ICON -->
	<link rel="shortcut icon" href="<c:url value="/resources/img/favicon.ico" />">

	</head>
  <body class="skin-blue">
    <div class="wrapper">
      
      <header class="main-header">
        <!-- Logo -->
        <a href="<c:url value="/"/>" class="logo"><img src="<c:url value="/resources/img/EZmalteria_logo-2.png"/>"/></a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
		  <table>
		    <tr>
		      <td width="15%">
                <!-- Sidebar toggle button-->
                <a href="<c:url value="#"/>" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                  <span class="sr-only">Toggle navigation</span>
                </a>
		      </td>
		      <td id="logout" width="84%">
		        <a href="<c:url value="/login"/>">Logout</a>
		      </td>
		    </tr>
		  </table>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel" style="height:60px !important">
            <div class="pull-left image">
              <img src="<c:url value="/resources/dist/img/user2-160x160.jpg"/>" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p>Alexander Pierce</p>
			  <br/>
            </div>
          </div>
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="active treeview">
              <a href="<c:url value="#top"/>" class="current">
                <i class="fa fa-home"></i> <span>Painel principal</span>
              </a>
            </li>
			<li class="treeview">
              <a href="<c:url value="#"/>">
                <i class="fa fa-plus"></i>
                <span>Cadastro</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
				<li><a href="<c:url value="#"/>"><i class="fa fa-user"></i> Usuário</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-users"></i> Cliente</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-user-plus"></i> Funcionário</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-briefcase"></i> Serviço</a></li>
			  </ul>
            </li>
            <li class="treeview">
              <a href="<c:url value="#"/>">
                <i class="fa fa-pie-chart"></i> <span>Relatório</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
				<li><a href="<c:url value="#"/>"><i class="fa fa-money"></i> Financeiro</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-users"></i> Cliente</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-user-plus"></i> Funcionário</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-briefcase"></i> Serviço</a></li>
			  </ul>
            </li>
            <li class="treeview">
              <a href="<c:url value="pages/forms/agendamento.html"/>">
                <i class="fa fa-calendar"></i> <span>Agendamento</span>
              </a>
            </li>
			<li class="treeview">
              <a href="<c:url value="#"/>">
                <i class="fa fa-search"></i>
                <span>Pesquisa</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
				<li><a href="<c:url value="#"/>"><i class="fa fa-user"></i> Usuário</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-users"></i> Cliente</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-user-plus"></i> Funcionário</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-dropbox"></i> Estoque</a></li>
				<li><a href="<c:url value="#"/>"><i class="fa fa-briefcase"></i> Serviço</a></li>
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
          <h1>
            Dashboard
            <small>Control panel</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="<c:url value="#"/>"><i class="fa fa-home"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

		<!-- Main content -->
        <section class="content">
          <!-- Small boxes (Stat box) -->
          <!-- Main row -->
          <div class="row">
            <!-- Left col -->
          </div><!-- /.row (main row) -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Copyright &copy; 2014-2015 <a>EZmalteria</a>.</strong> All rights reserved.
      </footer>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="<c:url value="/resources/plugins/jQuery/jQuery-2.1.3.min.js"/>" type="text/javascript"></script>
    <!-- jQuery UI 1.11.2 -->
    <script src="<c:url value="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js"/>"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    </script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>    
    <!-- Morris.js charts -->
    <script src="<c:url value="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"/>"></script>
    <script src="<c:url value="/resources/plugins/morris/morris.min.js"/>" type="text/javascript"></script>
    <!-- Sparkline -->
    <script src="<c:url value="/resources/plugins/sparkline/jquery.sparkline.min.js"/>" type="text/javascript"></script>
    <!-- jvectormap -->
    <script src="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"/>" type="text/javascript"></script>
    <!-- jQuery Knob Chart -->
    <script src="<c:url value="/resources/plugins/knob/jquery.knob.js"/>" type="text/javascript"></script>
    <!-- daterangepicker -->
    <script src="<c:url value="/resources/plugins/daterangepicker/daterangepicker.js"/>" type="text/javascript"></script>
    <!-- datepicker -->
    <script src="<c:url value="/resources/plugins/datepicker/bootstrap-datepicker.js"/>" type="text/javascript"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="<c:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="<c:url value="/resources/plugins/iCheck/icheck.min.js"/>" type="text/javascript"></script>
    <!-- Slimscroll -->
    <script src="<c:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js"/>" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='<c:url value="/resources/plugins/fastclick/fastclick.min.js"/>'></script>
    <!-- AdminLTE App -->
    <script src="<c:url value="/resources/dist/js/app.min.js"/>" type="text/javascript"></script>

    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="<c:url value="/resources/dist/js/pages/dashboard.js"/>" type="text/javascript"></script>

    <!-- AdminLTE for demo purposes -->
    <script src="<c:url value="/resources/dist/js/demo.js"/>" type="text/javascript"></script>
  </body>
</html>