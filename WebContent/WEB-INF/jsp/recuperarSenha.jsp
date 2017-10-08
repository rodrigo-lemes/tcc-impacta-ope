<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>EZmalteria - Recuperação de Senha</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<!--EZmalteria CSS-->
	<link href="<c:url value="/resources/css/styletest.css"/>" rel="stylesheet" type="text/css" />
  </head>
  <body id="loginbody">
    <div class="format">
      <div class="logindiv">
        <!-- Logo -->
        <img src="<c:url value="/resources/img/EZmalteria_logo-2.png"/>" />
		<br/>
		<br/>
        <form:form name="loginform" method="POST" action="enviarEmailSenha" >
		<div class="form-group">
		  <div>
		    <form:label for="inputEmail" path="email">E-mail <font class="ast">*</font></form:label>
            <form:input class="form-control" id="inputEmail" path="email" required="required"/>
		  </div>
		  
        </div>
		<br/>
        <input type="submit" class="loginbtn" value="Recuperar senha" />
		</form:form>
		<br/>
        <input type="button" name="back" class="loginbtn" onclick="history.back()" value="Voltar"/>
	  </div>
	</div>
    <footer id="loginfooter">
      <div class="loginfooter">
        <b>Version</b> 1.0
      </div>
      <strong>Copyright &copy; 2015 <a>EZmalteria</a>.</strong> All rights reserved.
    </footer>
  </body>
</html>