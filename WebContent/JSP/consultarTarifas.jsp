<!DOCTYPE html>
<html lang="en">

<head>


 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['gauge']});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart(kw,potencia,ampers) {

            var data = google.visualization.arrayToDataTable([
                ['Graficos', 'Valores'],
                ['kw/h', kw],
                ['Ampers', ampers],
                ['Potencia', potencia]
            ]);

            var options = {
                width: 400, height: 250,
                redFrom: 90, redTo: 100,
                yellowFrom:75, yellowTo: 90,
                greenFrom:0, greenTo:20,
                
                minorTicks: 5
                
                };

            var chart = new google.visualization.Gauge(document.getElementById('chart_div'));

            chart.draw(data, options);

            setInterval(function() {
                data.setValue(0, 1, 40 + Math.round(20 * Math.random()));
                chart.draw(data, options);
            }, 150);
            setInterval(function() {
                data.setValue(1, 1, 40 + Math.round(20 * Math.random()));
                chart.draw(data, options);
            }, 150);
            setInterval(function() {
                data.setValue(2, 1, 60 + Math.round(20 * Math.random()));
                chart.draw(data, options);
            }, 150);
        }
        
        //-----------------------Inicio do ajax/Arduino------------------------
        var data;
        var url = 'http://192.168.0.130:9091';

          $(document).ready(function(){

          	function fazerRequisicao(){
          		$.ajax({
          		    url: url,
          		    dataType: 'jsonp',
          		    crossDomain: true,
          		    jsonp: false,
          		    jsonpCallback: 'dados',
          		    success: function(data) {
          				$('#ampers').text(data.ampers);
          				$('#potencia').text(data.potencia);
          				$('#kw').text(data.kw);
        					console.log(data);
        					drawChart(data.kw,data.potencia,data.ampers);
          		    }
          		  });
          	    return false;
              }
              // A cada 1000 milis (1 segundo), faça uma nova requisição.
              setInterval(fazerRequisicao, 500);
          });		
    //-----------------------Fim do ajax/Arduino------------------------
    </script>



    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Tarifas</title>
   

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/usuario.css" rel="stylesheet">

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
                        <h1>Painel de Tarifas</h1>
                        <p>Aqui você pode consultar o andamento de seu consumo!</p>
                        <p>Consulte a qualquer momento</code>.</p>
                       
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->


<!-- Div chart grafico -->

<div id="chart_div" style="width: 400px; height: 120px;"></div>

<!-- Fecnhando div chat grafico -->
    









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
