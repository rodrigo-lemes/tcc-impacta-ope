<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="UTF-8">
    <title>EZmalteria - Acesso Restrito</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<!--EZmalteria CSS-->
	<link href="<c:url value="/resources/css/styletest.css" />"rel="stylesheet">
  </head>
  <body id="loginbody">
    <div class="format">
      <div class="logindiv">
        <!-- Logo -->
        <img src="<c:url value="/resources/img/EZmalteria_logo-2.png"/>" />
		<br/>
		<br/>
		<p class="fontCadastro">Erro!<br>O acesso à este conteúdo é restrito.</p>
        <br/>
        <input type="button" name="back" class="loginbtn" onclick="history.back()" value="Voltar"/>
        <br/>
	</div>
  </body>
</html>