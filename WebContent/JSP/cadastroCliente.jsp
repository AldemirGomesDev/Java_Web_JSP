<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.infopower.entidades.Cliente"%>
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

<%
Cliente cliente = (Cliente) request.getAttribute("cliente");
%>

                
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
                        <h1>Cadastrar Cliente</h1><br/>
                        
                        <h5 style="overflow:auto; color: red; " >(*) Preenchimento Obrigatório !</h5><br/>
                                               
                        
                        <!-------------------FORMULARIO  usuario -------------------------->

<div class="col-md-5 col-sm-5">


<form name="cadastro" class="form-horizontal" action="/InfoPower/ClienteServlet?acao=salv" method="post" onsubmit="return ValNumber()">
    <fieldset>

<!-- Form Name -->

            <!-- Nome input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Nomeinput">Nome Cliente * </label>
                <div class="col-md-8">

                    <input id="Nomeinput" name="nomeUser" type="text" placeholder="Seu Usuario" autofocus="autofocus" class="form-control input-md" >

                </div>
            </div>
            
	        <!--CPF input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="CpfInput">CPF *</label>
                <div class="col-md-8">
                    <input id="cpfUser" name="cpfUser" type="text" placeholder="Cpf" class="form-control input-md" >
                </div>
            </div>

                      
            <!-- Login input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Logininput">Login Cliente *</label>
                <div class="col-md-8">

                    <input id="Nomeinput"  name="loginUser" type="text" placeholder="Seu Login" class="form-control input-md">

                </div>
            </div>
            
             <!-- Password input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="passwordinput">Senha *</label>
                <div class="col-md-8">
                    <input id="passwordinput"  name="senhaUser" type="password" placeholder="Digite uma Senha" class="form-control input-md" >

                </div>
            </div>

            <!-- Telefone input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Telefoneinput">Telefone *</label>
                <div class="col-md-8">
                    <input id="telefoneUser" name="telefoneUser" type="tel" placeholder="0 0000-0000" class="form-control input-md">

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Enderecoinput">Logradouro *</label>
                <div class="col-md-8">
                    <input id="Enderecoinput"  name="enderecoUser" type="text" placeholder="Endereço" class="form-control input-md" >

                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Bairroinput">Bairro *</label>
                <div class="col-md-8">
                    <input id="Bairroinput"   name="bairroUser" type="text" placeholder="Bairro" class="form-control input-md">

                </div>
            </div>
			      
			        <!--Numero input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="cepinput1">Numero *</label>
                <div class="col-md-8">
                    <input id="cepinput1"  name="numeroUser" type="number" placeholder="Numero" class="form-control input-md" >
                </div>
            </div>

                   <!--CEP input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="cepinput">CEP *</label>
                <div class="col-md-8">

                    <input id="cepUser"  name="cepUser" type="" placeholder="Cep" class="form-control input-md">

                </div>
            </div>

                 <!--Cidade input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="cepinput1">Cidade *</label>
                <div class="col-md-8">
                    <input id="cepinput1"  name="cidadeUser" type="text" placeholder="Cidade" class="form-control input-md" >
                </div>
            </div>

                    <!-- Estado input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Estadoinput">Estado *</label>
                <div class="col-md-8">
                    <input id="Estadoinput"  name="estadoUser" type="text" placeholder="Estado" class="form-control input-md">

                </div>
            </div>

      <!-- País input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Paisinput">País</label>
                <div class="col-md-8">
                    <input id="Paisinput" name="paisUser" type="text" placeholder="Pais" class="form-control input-md">

                </div>
            </div>

            <!-- Button (Double) -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="button1id"></label>
                <div class="col-md-8">
                    <input class="btn btn-success" type="submit" name="cadastro" id="button3id" onclick="return validaForm()" value="Salvar" />
                    <button type="reset" id="button2id" name="button2id" class="btn btn-danger"><i class="fa fa-times"></i> Cancelar</button>
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
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../js/jquery.js"></script>
	<script src="../js/MaskJquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
    
    <!-- VALIDAÇÃO DOS CAMPOS OBRIGATORIOS -->
		<script type="text/javascript">
 
function validaForm(){
           d = document.cadastro;
           
           //validar nome
           if (d.nomeUser.value == ""){
        	  		 $("#myModal").modal({backdrop:"static"});
        	  		 $("#myModal").modal();
        	  		 $("#modalNome").text("O campo NOME  deve ser preenchido!");
                     d.nomeUser.style.backgroundColor="#E9967A";
                     d.nomeUser.style.color="#ffffff";
                     d.nomeUser.focus();
                     return false;
           }
           if (d.cpfUser.value == ""){
       		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo CPF  deve ser preenchido!");
	               d.cpfUser.style.backgroundColor="#E9967A";
	               d.cpfUser.style.color="#ffffff";
	               d.cpfUser.focus();
              return false;
   		 }
           //validar login
            if (d.loginUser.value == ""){
            		$("#myModal").modal({backdrop:"static"});
   	  		 		$("#myModal").modal();
   	  				$("#myModal").text("O campo LOGIN  deve ser preenchido!");
                   d.loginUser.style.backgroundColor="#E9967A";
                   d.loginUser.style.color="#ffffff";
                   d.loginUser.focus();
                   return false;
      	   }
            if (d.senhaUser.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo SENHA  deve ser preenchido!");
	               d.senhaUser.style.backgroundColor="#E9967A";
	               d.senhaUser.style.color="#ffffff";
	               d.senhaUser.focus();
               return false;
    		 }
            if (d.telefoneUser.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo TELEFONE  deve ser preenchido!");
	               d.telefoneUser.style.backgroundColor="#E9967A";
	               d.telefoneUser.style.color="#ffffff";
	               d.telefoneUser.focus();
               return false;
    		 }
            
            if (d.enderecoUser.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo ENDEREÇO  deve ser preenchido!");
	               d.enderecoUser.style.backgroundColor="#E9967A";
	               d.enderecoUser.style.color="#ffffff";
	               d.enderecoUser.focus();
               return false;
    		 }
            if (d.bairroUser.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo BAIRRO  deve ser preenchido!");
	               d.bairroUser.style.backgroundColor="#E9967A";
	               d.bairroUser.style.color="#ffffff";
	               d.bairroUser.focus();
               return false;
    		 }
            if (d.numeroUser.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo NUMERO  deve ser preenchido!");
	               d.numeroUser.style.backgroundColor="#E9967A";
	               d.numeroUser.style.color="#ffffff";
	               d.numeroUser.focus();
               return false;
    		 }
            if (d.cepUser.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo CEP  deve ser preenchido!");
	               d.cepUser.style.backgroundColor="#E9967A";
	               d.cepUser.style.color="#ffffff";
	               d.cepUser.focus();
               return false;
    		 }
            if (d.cidadeUser.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo CIDADE  deve ser preenchido!");
	               d.cidadeUser.style.backgroundColor="#E9967A";
	               d.cidadeUser.style.color="#ffffff";
	               d.cidadeUser.focus();
               return false;
    		 }
            if (d.estadoUser.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo ESTADO  deve ser preenchido!");
	               d.estadoUser.style.backgroundColor="#E9967A";
	               d.estadoUser.style.color="#ffffff";
	               d.estadoUser.focus();
               return false;
    		 }
            
            else{
            	
            	return true;
            }
        
	document.cadastro.submit();
         
}
  
 </script>

    <!-- Menu Toggle Script -->
    <script type="text/javascript">
    function cadastroSucesso(){
    	
    		$("#myModal2").modal();
    		
    		return true;
    }
    
    </script>
    
    <script type="text/javascript">
		//mascaras de telefone, cep e cpf
		$(document).ready(function(){
			$("#telefoneUser").mask("(99)99999-9999");
			$("#cepUser").mask("99999-999");
			$("#cpfUser").mask("999.999.999-99");
			});
	
	</script>
    
    <script>
                        $(function(){
                        	
                            $('#myModal').on('show.bs.modal', function(){
                                var myModal = $(this);
                                clearTimeout(myModal.data('hideInterval'));
                                myModal.data('hideInterval', setTimeout(function(){
                                    myModal.modal('hide');
                                }, 6000));
                            });
                        });
                    </script>
    
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>

