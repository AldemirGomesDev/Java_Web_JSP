<%@page import="javax.websocket.SendResult"%>
<%@page import="org.apache.catalina.ha.backend.Sender"%>
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

    <title>Painel Administrador</title>

     <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">


	<link rel="stylesheet" href="../css/style.css">

  
  <!-- BOOTSTRAP STYLES-->
    <link href="../css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="../css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
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
							<% }else{
								response.sendRedirect("Usuario.jsp");
							}%>
        </div>
        
        <div id="clientes" class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="#" >
 <i class="fa fa-users fa-5x"></i>
                      <h4>Clientes</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="#" >
 <i class="fa fa-key fa-5x"></i>
                      <h4>Admins</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="#" >
 <i class="fa fa-list-alt fa-5x"></i>
                      <h4>Tarifas</h4>
                      </a>
                      </div>
                     
                
             </div>

<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="https://github.com/InfoPower-tec/Economy-Energy" >
 <i class="fa fa-github fa-5x"></i>
                      <h4>GitHub</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  


<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
                      <div class="div-square">
                           <a href="#" >
 <i class="fa fa-sign-out fa-5x"></i>
                      <h4>Logout</h4>
                      </a>
                      </div>
                     
                     
                  </div>
                  
                 
                 
                 <div class="row bootstrap-admin-no-edges-padding">
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="text-muted bootstrap-admin-box-title"> Economy Energy</div>
                </div>
                <div class="bootstrap-admin-panel-content">
                    <p> InfoPower</p>
                    <p> Copyright © 2016 - <a href="https://github.com/InfoPower-tec/Economy-Energy">Git Economy Energy</a></p>
                    <p>O software desenvolvido tem por finalidade ajudar as pessoas á ter um controle melhor em seu consumo de energia. O código do Economy Energy está disponivel para estudos academicos, Acesse o GitHub de nossa empresa para download de versões atualizadas.</p>
                    <p>Infopower Tecnology.</p>
                   
                </div>
            </div>
        </div>
</div>

	 <!-- Modal -->

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
