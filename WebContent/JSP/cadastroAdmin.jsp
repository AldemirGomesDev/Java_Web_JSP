<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.infopower.entidades.Administrador"%>
<%@ page import="com.infopower.controladores.ControladorAdmin"%>
<%@ page import="java.util.List"%>
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
    
    <link href="../css/estilocadastro/css" rel="stylesheet">
    
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<%
Administrador admin = (Administrador) request.getAttribute("admin");
%>
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
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1>Cadastrar Administrador</h1><br/>
                        
                <h5 style="overflow:auto; color: red; " >(*) Preenchimento Obrigatório !</h5><br/>
                        
                        
                        <div class="col-md-6 col-sm-5">


<form name="cadastro" class="form-horizontal" action="/InfoPower/admControle?acao=salv" method="post" onsubmit="return ValNumber()">
    <fieldset>

                    
            <!-- NOME input-->
              
       
            <div class="form-group">
                <label class="col-md-4 control-label" for="textinput1">Nome *</label>
                <div class="col-md-8">

                    <input id="textinput1" name="nomeAdm" type="text" placeholder="Seu Nome" autofocus="autofocus" class="form-control input-md">

                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label" for="logininput">Login *</label>
                <div class="col-md-8">

                    <input id="logininput" name="loginAdm" type="text" placeholder="Login Administrador" class="form-control input-md">

                </div>
            </div>
            
            
            <!-- Password input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="passwordinput1">Senha *</label >
                <div class="col-md-8">
                    <input id="passwordinput1" name="senhaAdm" type="password" placeholder="Digite uma Senha" class="form-control input-md">

                </div>
            </div>

            <!-- Telefone input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="numberinput1"  >Telefone *</label>
                <div class="col-md-8">
                    <input id="telefoneAdm" name="telefoneAdm" onkeypress="mascara(this, '## #####-####')" type="tel" placeholder="(00) 00000-0000" class="form-control input-md" maxlength=13 >

                </div>
            </div>



                   <!--CEP input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="cepinput1">CEP *</label>
                <div class="col-md-8">

                    <input id="cepAdm" name="cepAdm" onkeypress="mascara(this, '#####-###')" maxlength=9 type="text" placeholder="Cep Administrador" class="form-control input-md">

                </div>
            </div>



            <!-- Endereco input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Enderecoinput1">Endereco *</label>
                <div class="col-md-8">
                    <input id="Enderecoinput1" name="enderecoAdm" type="text" placeholder="Endereco" class="form-control input-md">

                </div>
            </div>

                   <!--Numero input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="cepinput1">Numero *</label>
                <div class="col-md-8">
                    <input id="cepinput1" name="numeroAdm" type="number" placeholder="Numero" class="form-control input-md">
                </div>
            </div>


            <!-- Bairro input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Bairroinput1">Bairro *</label>
                <div class="col-md-8">
                    <input id="Bairroinput1" name="bairroAdm" type="text" placeholder="Bairro" class="form-control input-md">

                </div>
            </div>


               <!-- Cidade input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Estadoinput1">Cidade *</label>
                <div class="col-md-8">
                    <input id="Estadoinput1" name="cidadeAdm" type="text" placeholder="Cidade" class="form-control input-md">

                </div>
            </div>


               <!-- Estado input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Estadoinput1">Estado *</label>
                <div class="col-md-8">
                    <input id="Estadoinput1" name="estadoAdm" type="text" placeholder="Estado" class="form-control input-md">

                </div>
            </div>


            <!-- País input-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="Paisinput1">Pais</label>
                <div class="col-md-8">
                    <input id="Paisinput1" name="paisAdm" type="text" placeholder="Pais" class="form-control input-md">

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


                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
    
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

<script type="text/javascript">
/*mascaras de telefone, cep e cpf
$(document).ready(function(){
	$("#telefoneAdm").mask("(99)99999-9999");
	$("#cepAdm").mask("99999-999");
	$("#cefInput").mask("999.999.999-99");
	});*/

	 function mascara(campo_passado, mask){
		 var campo = campo_passado.value.length;
		 var saida = mask.substring(0,1);
		 var texto = mask.substring(campo);
			 if (texto.substring(0,1) != saida){
			 campo_passado.value += texto.substring(0,1);
			 }
	}
</script>
		<!-- VALIDAÇÃO DOS CAMPOS OBRIGATORIOS -->
		<script type="text/javascript">
 
function validaForm(){
           d = document.cadastro;
           
           //validar nome
           if (d.nomeAdm.value == ""){
        	  		 $("#myModal").modal({backdrop:"static"});
        	  		 $("#myModal").modal();
        	  		 $("#modalNome").text("O campo NOME  deve ser preenchido!");
                     d.nomeAdm.style.backgroundColor="#E9967A";
                     d.nomeAdm.style.color="#ffffff";
                     d.nomeAdm.focus();
                     return false;
           }
           //validar login
            if (d.loginAdm.value == ""){
            		$("#myModal").modal({backdrop:"static"});
   	  		 		$("#myModal").modal();
   	  				$("#modalNome").text("O campo LOGIN  deve ser preenchido!");
                   d.loginAdm.style.backgroundColor="#E9967A";
                   d.loginAdm.style.color="#ffffff";
                   d.loginAdm.focus();
                   return false;
         }
            if (d.senhaAdm.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo SENHA  deve ser preenchido!");
	               d.senhaAdm.style.backgroundColor="#E9967A";
	               d.senhaAdm.style.color="#ffffff";
	               d.senhaAdm.focus();
               return false;
    		 }
            
            if (d.telefoneAdm.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo TELEFONE  deve ser preenchido!");
	               d.telefoneAdm.style.backgroundColor="#E9967A";
	               d.telefoneAdm.style.color="#ffffff";
	               d.telefoneAdm.focus();
               return false;
    		 }
            if (d.cepAdm.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo CEP  deve ser preenchido!");
	               d.cepAdm.style.backgroundColor="#E9967A";
	               d.cepAdm.style.color="#ffffff";
	               d.cepAdm.focus();
               return false;
    		 }
            
            if (d.enderecoAdm.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo ENDEREÇO  deve ser preenchido!");
	               d.enderecoAdm.style.backgroundColor="#E9967A";
	               d.enderecoAdm.style.color="#ffffff";
	               d.enderecoAdm.focus();
               return false;
    		 }
            
            if (d.numeroAdm.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo NUMERO  deve ser preenchido!");
	               d.numeroAdm.style.backgroundColor="#E9967A";
	               d.numeroAdm.style.color="#ffffff";
	               d.numeroAdm.focus();
               return false;
    		 }
            
            if (d.bairroAdm.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo BAIRRO  deve ser preenchido!");
	               d.bairroAdm.style.backgroundColor="#E9967A";
	               d.bairroAdm.style.color="#ffffff";
	               d.bairroAdm.focus();
               return false;
    		 }
            
            if (d.cidadeAdm.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo CIDADE  deve ser preenchido!");
	               d.cidadeAdm.style.backgroundColor="#E9967A";
	               d.cidadeAdm.style.color="#ffffff";
	               d.cidadeAdm.focus();
               return false;
    		 }
            if (d.estadoAdm.value == ""){
        		$("#myModal").modal({backdrop:"static"});
	  		 		$("#myModal").modal();
	  				$("#modalNome").text("O campo ESTADO  deve ser preenchido!");
	               d.estadoAdm.style.backgroundColor="#E9967A";
	               d.estadoAdm.style.color="#ffffff";
	               d.estadoAdm.focus();
               return false;
    		 }
            else{
            	
            	return true;
            }
        
	document.cadastro.submit();
         
}
  
 </script>


    <!-- jQuery -->
    <script src="../js/jquery.js"></script>
    <script src="../js/MaskJquery.js"></script>

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
    