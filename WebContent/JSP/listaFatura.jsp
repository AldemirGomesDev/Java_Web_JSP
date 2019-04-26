<%@page import="com.infopower.controladores.ControladorFatura"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.infopower.entidades.Fatura"%>
<%@ page import="com.infopower.controladores.ControladorFatura"%>
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

    <title>Lista Fatura</title>

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
                        <h1>Lista Fatura</h1>
                        
                       


                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
         <!-- inicio da lista -->
         <div class = "container" div style="overflow:auto; width: 100%;"> 


     <table border="1" class="table table-bordered">

<tr class="linha_listar" bgcolor="#EAEAEA">
	<th>ID</th> <th>DATA</th> <th>CONSUMO_DIA</th> <th>CONSUMO_KW</th> <th>CONSUMO_MÊS</th> <th>CONSUMO_R$</th>  <th>AÇÃO</th>
</tr>


</div>

<%
//Scriptlet
ControladorFatura faturaControler = new ControladorFatura();
List<Fatura> lista = faturaControler.listar();

for(Fatura fatura : lista){
	%>
		<tr>
			<td class="coluna_listar"><% out.print(fatura.getId()); %></td>
			<td class="coluna_listar"><% out.print(fatura.getData()); %></td>
			<td class="coluna_listar"><% out.print(fatura.getConsumoDia()); %></td>
			<td class="coluna_listar"><% out.print(fatura.getConsumoKw()); %></td>
			<td class="coluna_listar"><% out.print(fatura.getConsumoMes()); %></td>
			<td class="coluna_listar"><% out.print(fatura.getConsumoRs()); %></td>
	
		 	<td class="actions">
		 	
		 	<form  action="/InfoPower/GerarFaturaServlet" method="get">
			
			<input type="hidden" name="acao" value="visualizar">
			<input type="hidden" name="id" value="<%=fatura.getId() %>">
			<input type="hidden" name="data_fatura" value="<%=fatura.getData() %>">
			<input type="hidden" name="consumo_dia" value="<%=fatura.getConsumoDia() %>">
			<input type="hidden" name="consumo_kw" value="<%=fatura.getConsumoKw() %>">
			<input type="hidden" name="consumo_rs" value="<%=fatura.getConsumoRs() %>">
			<input type="hidden" name="consumo_mes" value="<%=fatura.getConsumoMes()%>">
			
			<button type="submit" class="btn btn-warning btn-xs" value="">Visualizar</button>
			
			</form>
		
			</td>
			
		</tr>
<%}%>

</table>
</div>
                 
		<!-- fim da lista -->
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
