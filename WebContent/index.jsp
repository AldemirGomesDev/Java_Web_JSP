<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.infopower.entidades.Cliente"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Economy Energy</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- link de estilo modal e tabela-->

    <link href="css/estilo.css" rel="stylesheet">



    <!-- Custom CSS -->
    <link href="css/landing-page.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="sidebar-wrapper">
            <%HttpServletRequest httpServletRequest = (HttpServletRequest) request;
							HttpSession sessao = httpServletRequest .getSession();
							if(sessao.getAttribute("adminLogado")!=null){
								response.sendRedirect("JSP/adminLogado.jsp");
								%>
								<jsp:include page="JSP/menu.jsp" flush="true" />
							<% }if(sessao.getAttribute("clienteLogado") !=null){
								response.sendRedirect("JSP/Usuario.jsp");%>
								<jsp:include page="JSP/menuCliente.jsp" flush="true" />
								<%
							}%>
        </div>

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand topnav" href="#">InfoPower</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#about">Inicio</a>
                    </li>
                    <li>
                        <a href="#services">Sobre</a>
                    </li>
                    <li>
                        <a href="#contact">Contato</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>


    <!-- Header -->
    <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1>InfoPower</h1>
                        <h3>Economy Energy</h3>
                        <hr class="intro-divider">
                        <ul class="list-inline btn">
                            <li>
                                <a href="" class="btn btn-default btn-lg" data-toggle="modal" data-target="#login-modal-usuario"><i class="fa fa-users fa-fw" data-toggle="modal" data-target="#login-modal-usuario"></i> Cliente</span></a>
                            </li>
                            <li>
                                <a href="" class="btn btn-default btn-lg"data-toggle="modal" data-target="#login-modal-admin"><i class="fa fa-user fa-fw"> <i class="fa fa-lock fa-fw"></i> </i> <span class="network-name">Administrador</span></a>
                            </li>

                        </ul>
                    </div>






                    <!--MODAL LOGIN ACESSO USUARIO-->

                    <div class="modal fade" id="login-modal-usuario" tabindex="-1" role="dialog" aria-labelledby="meuModalLabel" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog">
                            <div class="loginmodal-container">
                                <h1><i class="fa fa-user"></i> Sua Conta de Cliente</h1><br>
                                <form method="post" action="/InfoPower/AutenticadorCliente">
                                    <input type="text" id="user" name="user" placeholder="Nome Login" autofocus="autofocus" autocomplete="on">
                                    <input type="password" name="pass" placeholder="Senha" required>
                                    <input type="submit" name="loginusuario" class="login loginmodal-submit" value="Logar Usuario">
                                </form>

                                <div class="modal-footer">

                                    <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Fechar</button>

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Fim login usuario-->

                    <!-- Inicio Login Modal Administrador -->


                    <div class="modal fade" id="login-modal-admin" tabindex="-1" role="dialog" aria-labelledby="meuModalLabel" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog">
                            <div class="loginmodal-container">
                                <h1><i class="fa fa-user"></i> Login Administrador</h1><br>
                                <form method="post" action="/InfoPower/AutenticadorAdministrador2">
                                    <input type="text" id="admin" name="admin" placeholder="Administrador" autofocus="autofocus" autocomplete="on">
                                    <input type="password" name="pass2" placeholder="Senha" required>
                                    <input type="submit" name="loginadmin" class="login loginmodal-submit" value="Logar Admin">
                                </form>



                                <div class="modal-footer">

                                    <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Fechar</button>

                                </div>
                            </div>
                        </div>
                    </div>

                    <!---------------------- fim login modal administrador--------------------------------------->
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>


    <!-- /.intro-header -->

    <!-- Page Content -->




	<a  name="services"></a>
    <div class="content-section-a">

        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">InfoPower<br>Energia Consciente</h2>
                    <p class="lead">Nossa empresa pensa no futuro e na economia de sua residência.
                        <a target="_blank" href="http://join.deathtothestockphoto.com/">Economia é importante</a> para o seu bolso e para a natureza,contrate nosso serviço entrando em contato conosco.</p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="img/economia.jpg" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->

    <div class="content-section-b">

        <div class="container">

            <div class="row">
                <div class="col-lg-5 col-lg-offset-1 col-sm-push-6  col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">Economy Energy<br>by InfoPower</h2>
                    <p class="lead">Economy Energy é o nosso primeiro sistema para automação residêncial,
                        e tem o intuito de fazer medição do consumo da energia e demostrar de forma clara e rápida ao nossos clientes, <a target="_blank" href="http://www.psdcovers.com/">Saiba mais!</a>Ou entre em contato com nossa equipe para tirar suas dúvidas</p>
                </div>
                <div class="col-lg-5 col-sm-pull-6  col-sm-6">
                    <img class="img-responsive" src="img/Untitled-2.png" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-b -->

    <div class="content-section-a">

        <div class="container">

            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">Contato<br>InfoPower</h2>
                    <p class="lead">Disponibilizamos contato através do email infopower.tecnology@gmail.com ou <a target="_blank" href="http://www.google.com/fonts">Nosso Facebook</a></p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="img/contato.jpg" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->

	<a  name="contact"></a>
    <div class="banner">

        <div class="container">

            <div class="row">
                <div class="col-lg-6">

                </div>
                <div class="col-lg-6">
                    <ul class="list-inline banner-social-buttons">
                        <li>
                            <a href="https://www.facebook.com/" class="btn btn-default btn-lg"><i class="fa fa-facebook-square fa-fw"></i> <span class="network-name">Facebook</span></a>
                        </li>
                        <li>
                            <a href="https://github.com/InfoPower-tec/Economy-Energy" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                        </li>

                    </ul>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.banner -->

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                            <a href="#">Inicio</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>

                            <a href="#services">Sobre</a>
                        </li>
                        <li class="footer-menu-divider">&sdot;</li>
                        <li>
                            <a href="#contact">Contato</a>
                        </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy;InfoPower 2016. Todos os direitos reservado</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<script type="text/javascript">


$('.modal').on('shown.bs.modal', function() {
	  $(this).find('[autofocus]').focus();
	});

var $exampleModal = $("#login-modal-usuario"),
$exampleModalClose = $(".modal-header button");

$exampleModal.on("shown.bs.modal", function() {
    document.activeElement.blur();
    $exampleModalClose.focus();
});

</script>

<script type="text/javascript">
$(document).ready(function(){
    $("#login-modal-usuario").on('shown.bs.modal', function(){
        $(this).find('#user').focus();
    });
});
</script>
</body>

</html>
