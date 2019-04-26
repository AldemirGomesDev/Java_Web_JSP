<%@page import="com.infopower.controladores.ControladorTarifa"%>
<%@page import="com.infopower.controladores.ControladorCliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.infopower.entidades.Tarifa"%>
<% String i = request.getParameter("id");
int id = Integer.parseInt(i);
ControladorTarifa controletarifa = new ControladorTarifa();
Tarifa tarifa = controletarifa.procurarId(id);
%>
<!DOCTYPE html>
<html lang="en">

<head>

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    
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
                        <h1>Alterar Tarifa</h1><br/> <br/>
                                               
                        
                        <!-------------------FORMULARIO  usuario -------------------------->

<div class="col-md-5 col-sm-5">


<form class="form-horizontal" action="/InfoPower/TarifaControle?acao=alt" method="post">
    <fieldset>

<!-- Form Name -->

            <!-- Nome input-->
            <div class="form-group">
            	<input id="idTarifa" type="hidden" value="<%= tarifa.getIdTarifa()%>" name="id_tarifa">
            	
                <label class="col-md-4 control-label" for="Nomeinput">Tipo da Tarifa </label>
                <div class="col-md-8">

                    <input id="Nomeinput" value="<%=tarifa.getNome()%>" name="nome" type="text" placeholder="Seu Usuario" class="form-control input-md" required>

                </div>
            </div>
            
	        <!--CPF input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="CpfInput">Valor</label>
                <div class="col-md-8">
                    <input id="cefInput" value="<%=tarifa.getValor()%>" name="valor" type="text" placeholder="Cpf" class="form-control input-md" required>
                </div>
            </div>


            <!-- Button (Double) -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="button1id"></label>
                <div class="col-md-8">
                    <button type="submit" id="button1id" name="button1id" class="btn btn-success"><i class="fa fa-floppy-o"></i> Alterar</button>
                    <a id="button2id" class="btn btn-danger" href="listaTarifa.jsp">Cancelar</a>
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

