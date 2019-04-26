<%@page import="com.infopower.entidades.Administrador"%>
<%@page import="com.infopower.controladores.ControladorAdmin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.infopower.entidades.Cliente"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Painel Cliente</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/admin.css" rel="stylesheet">

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
							if(sessao.getAttribute("clienteLogado")!=null){
								%>
								<jsp:include page="menuCliente.jsp" flush="true" />
							<% }%>
        </div>
        
        
        
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Saiba Mais!</h1>
                        
                        
                    </div>


                </div>
            </div>
            
             <div class="contact-page2">
            <div class="container2">
            
                <div class="row"><!-- first row -->
                
                	<div class="col-md-6"><!-- first column -->
                        <div class="widget-item">
                            <h3 class="widget-title">Economy Energy</h3>
                            <div class="sample-thumb">
                                <img src="../images/Imagemlogo2.jpg" alt="about us" title="about us">
                            </div> <!-- /.sample-thumb -->
                            <h4 class="consult-title">Sobre nossa equipe</h4>
                            <p>Saiba mais sobre a InfoPower :  Nossa equipe conta hoje com 4 integrantes em diversas areas da tecnologia.
                            todos os administradores são competentes e estão dispostos á melhorar a experiência do cliente cada vez mais.<br><br>
						</p>
                        </div> <!-- /.widget-item -->
                    </div> <!-- /.col-md-4 -->

                    <div class="col-md-6"><!-- second column -->
                        <div class="widget-item">
                            <h3 class="widget-title">O que fazemos?</h3>
                            <div class="sample-thumb">
                                <img src="../images/SalveEnergia.jpg" alt="company" title="company">
                            </div> <!-- /.sample-thumb -->
                            <h4 class="consult-title"> Mais sobre a equipe</h4>
                            <p> Trabalhamos com o projeto Economy Energy para ajudar as pessoas á utilizar melhor sua energia de maneira que não consuma em execesso.
                                .<br><br>
                                Estamos trabalhando com um sistema inteligente Arduino e sensores capaz de fazer a medição do consumo de sua residência e mostrar esse consumo
                                de uma forma mais clara e rápida ao usuário.
                                .</p>
                        </div> <!-- /.widget-item -->
                    </div> <!-- /.col-md-4 -->
                    
                    
                    
                </div> <!-- /.row first -->
                
                
                
            </div> <!-- /.container -->
        </div> <!-- /.middle-content -->
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
