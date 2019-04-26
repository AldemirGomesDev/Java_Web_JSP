<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                        <h1>Cadastrar Tarifa</h1><br/>
                                              
                        <h5 style="overflow:auto; color: red; " >(*) Preenchimento Obrigatório !</h5><br/>
                        
                        <!-------------------FORMULARIO  usuario -------------------------->

<div class="col-md-6 col-sm-5">


<form name="cadastro" class="form-horizontal" action="/InfoPower/TarifaControle?acao=salv" method="post" onsubmit="return ValNumber()">
    <fieldset>
            <!-- NOME input-->
              
            <div class="form-group" align="center">
                <label  class="col-md-4 control-label" for="textinput1">Nome Tarifa *</label>
                <div class="col-md-8">

                    <input autofocus="autofocus"  id="nomeTarifa" name="nomeTarifa" type="text" placeholder="Tarifa" class="form-control input-md">

                </div>
            </div>

            <div class="form-group">
                <label class="col-md-4 control-label" for="logininput">Valor *</label>
                <div class="col-md-8">

                    <input id="valorTarifa" name="valorTarifa" step="0.01" type="number" placeholder="Valor" class="form-control input-md">

                </div>
            </div>
            
            <!-- Button (Double) -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="button1id"></label>
                <div class="col-md-8">
                <input class="btn btn-success" type="submit" name="cadastro" id="button3id" onclick="return validaForm()" value="Salvar" />
                  
                    <button type="reset" id="button4id" name="button2id" class="btn btn-danger"><i class="fa fa-times"></i> Cancelar</button>
                </div>
            </div>

    </fieldset>
</form>

</div>
        </div>

    </fieldset>
</form>

<!-- MODAL SUCESSO -->

<div class="modal fade"  id="myModal" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <div class ="alert-success">  <h4 id="modalNome" class="modal-title"></h4></div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-success btn-sm" data-dismiss="modal">Sair</button>

                </div>
            </div>
        </div>
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
    
		<script type="text/javascript">
 
function validaForm(){
           d = document.cadastro;
           
           //validar nome
           if (d.nomeTarifa.value == ""){
        	  		 $("#myModal").modal({backdrop:"static"});
        	  		 $("#myModal").modal();
        	  		 $("#modalNome").text("O campo NOME  deve ser preenchido!");
                     d.nomeTarifa.style.backgroundColor="#E9967A";
                     d.nomeTarifa.style.color="#ffffff";
                     d.nomeTarifa.focus();
                     return false;
           }
           //validar EMAIL
            if (d.valorTarifa.value == ""){
            		$("#myModal").modal({backdrop:"static"});
   	  		 		$("#myModal").modal();
   	  				$("#modalNome").text("O campo VALOR  deve ser preenchido!");
                   d.valorTarifa.style.backgroundColor="#E9967A";
                   d.valorTarifa.style.color="#ffffff";
                   d.valorTarifa.focus();
                   return false;
         }
            var regEx = /^\d{1,5}\.\d{1,5}$/;
            //var regEx = /^\d{2}\.\d{2}$/;
            bValid = document.cadastro.valorTarifa.value.match(regEx);
            if(!bValid){
            	$("#myModal").modal({backdrop:"static"});
	  		 	$("#myModal").modal();
	  			$("#modalNome").text("TIPO INVÁLIDO!");
              return false;         
            }
            else{
            	
            	return true;
            }
        
document.cadastro.submit();
         
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

