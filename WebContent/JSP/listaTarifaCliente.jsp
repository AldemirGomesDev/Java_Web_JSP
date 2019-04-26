<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.infopower.entidades.Tarifa"%>
<%@ page import="com.infopower.controladores.ControladorTarifa"%>
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
                        <h1>Lista Tarifa</h1>
                        
                       


                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->
         <!-- inicio da lista -->
         <div class = "container" div style="overflow:auto; width: 100%;"> 


     <table border="1" class="table table-bordered">

<tr class="linha_listar" bgcolor="#EAEAEA">
	<th>ID</th> <th>NOME</th> <th>VALOR</th>
</tr>


</div>

<%
//Scriptlet
ControladorTarifa tarifaControler = new ControladorTarifa();
List<Tarifa> lista = tarifaControler.listar();

for(Tarifa tarifa : lista){
	%>
		<tr>
			<td class="coluna_listar"><% out.print(tarifa.getIdTarifa()); %></td>
			<td class="coluna_listar"><% out.print(tarifa.getNome()); %></td>
			<td class="coluna_listar"><% out.print(tarifa.getValor()); %></td>
	
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
    	var valor2;
		function setaDadosModal(valor) {
			valor2 = valor;
		    return;
		}
		function confirmaExclusao(){
			
			location.href="/InfoPower/TarifaControle?acao=exc&id="+valor2;
		
		}
	</script>
    
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    
    </script>

</body>

</html>
