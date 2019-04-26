<%@page import="com.infopower.controladores.ControladorCliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.infopower.entidades.*"%>
<% String i = request.getParameter("id");
int id = Integer.parseInt(i);
ControladorCliente controlecliente = new ControladorCliente();
Cliente cliente = controlecliente.procurarId(id);
%>
<!DOCTYPE html>
<html lang="en">

<head>

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Painel Administrador</title>

<!-- Bootstrap Core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="../css/admin.css" rel="stylesheet">
<link href="./css/admin.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<%HttpServletRequest httpServletRequest = (HttpServletRequest) request;
							HttpSession sessao = httpServletRequest .getSession();
							if(sessao.getAttribute("adminLogado")!=null){
								%>
			<jsp:include page="menu.jsp" flush="true" />
			<% }%>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>Alterar Cliente</h1>
						<br /> <br />


						<!-------------------FORMULARIO  usuario -------------------------->

						<div class="col-md-5 col-sm-5">


							<form class="form-horizontal"
								action="/InfoPower/ClienteServlet?acao=alt" method="post">
								<fieldset>

									<!-- Form Name -->

									<!-- Nome input-->
									<div class="form-group">
										<input id="idCliente" type="hidden"
											value="<%= cliente.getId()%>" name="id_cliente"> <label
											class="col-md-4 control-label" for="Nomeinput">Nome
											Cliente </label>
										<div class="col-md-8">

											<input id="Nomeinput" value="<%=cliente.getNome()%>"
												name="nomeUser" type="text" placeholder="Seu Usuario"
												class="form-control input-md" required>

										</div>
									</div>

									<!--CPF input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="CpfInput">CPF</label>
										<div class="col-md-8">
											<input id="cefInput" value="<%=cliente.getCpf()%>"
												name="cpfUser" type="text" placeholder="Cpf"
												class="form-control input-md" required>
										</div>
									</div>


									<!-- Login input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="Logininput">Login
											Cliente</label>
										<div class="col-md-8">

											<input id="Nomeinput" value="<%=cliente.getLogin()%>"
												name="loginUser" type="text" placeholder="Seu Login"
												class="form-control input-md" required>

										</div>
									</div>

									<!-- Telefone input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="Telefoneinput">Telefone</label>
										<div class="col-md-8">
											<input id="Telefoneinput" value="<%=cliente.getTelefone()%>"
												name="telefoneUser" type="tel" placeholder="0 0000-0000"
												class="form-control input-md">

										</div>
									</div>

									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="Enderecoinput">Logradouro</label>
										<div class="col-md-8">
											<input id="Enderecoinput"
												value="<%=cliente.getLogradouro()%>" name="enderecoUser"
												type="text" placeholder="Endereço"
												class="form-control input-md">

										</div>
									</div>

									<!-- Text input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="Bairroinput">Bairro</label>
										<div class="col-md-8">
											<input id="Bairroinput" value="<%=cliente.getBairro()%>"
												name="bairroUser" type="text" placeholder="Bairro"
												class="form-control input-md">

										</div>
									</div>

									<!--Numero input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="cepinput1">Numero</label>
										<div class="col-md-8">
											<input id="cepinput1" value="<%=cliente.getNumero()%>"
												name="numeroUser" type="number" placeholder="Numero"
												class="form-control input-md" required>
										</div>
									</div>

									<!--CEP input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="cepinput">CEP</label>
										<div class="col-md-8">

											<input id="cepinput" value="<%=cliente.getCep()%>"
												name="cepUser" type="" placeholder="Cep"
												class="form-control input-md" required>

										</div>
									</div>

									<!--Cidade input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="cepinput1">Cidade</label>
										<div class="col-md-8">
											<input id="cepinput1" value="<%=cliente.getCidade()%>"
												name="cidadeUser" type="text" placeholder="Cidade"
												class="form-control input-md" required>
										</div>
									</div>

									<!-- Estado input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="Estadoinput">Estado</label>
										<div class="col-md-8">
											<input id="Estadoinput" value="<%=cliente.getEstado()%>"
												name="estadoUser" type="text" placeholder="Estado"
												class="form-control input-md">

										</div>
									</div>

									<!-- País input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="Paisinput">País</label>
										<div class="col-md-8">
											<input id="Paisinput" value="<%=cliente.getPais()%>"
												name="paisUser" type="text" placeholder="Pais"
												class="form-control input-md">

										</div>
									</div>

									<!-- Password input-->
									<div class="form-group">
										<label class="col-md-4 control-label" for="passwordinput">Senha</label>
										<div class="col-md-8">
											<input id="passwordinput" name="senhaUser" type="password"
												placeholder="Digite uma Senha" class="form-control input-md"
												required>

										</div>
									</div>

									<!-- Button (Double) -->
									<div class="form-group">
										<label class="col-md-4 control-label" for="button1id"></label>
										<div class="col-md-8">
											<button type="submit" id="button1id" name="button1id"
												class="btn btn-success">
												<i class="fa fa-floppy-o"></i> Alterar
											</button>
											<a id="button2id" class="btn btn-danger"
												href="listaCliente.jsp">Cancelar</a>
										</div>
									</div>

								</fieldset>
							</form>


						</div>
					</div>



					<!-------------------FORMULARIO -------------------------->

				</div>

			</div>


		</div>
	</div>
	</div>
	<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>

