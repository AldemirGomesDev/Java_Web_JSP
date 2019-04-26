<!DOCTYPE html>
<html lang="en">

<head>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

    function drawSort() {
    	  var data = new google.visualization.DataTable();
    	  data.addColumn('string', 'Name');
    	  data.addColumn('number', 'Salary');
    	  data.addColumn('boolean', 'Full Time');
    	  data.addRows(5);
    	  data.setCell(0, 0, 'John');
    	  data.setCell(0, 1, 10000);
    	  data.setCell(0, 2, true);
    	  data.setCell(1, 0, 'Mary');
    	  data.setCell(1, 1, 25000);
    	  data.setCell(1, 2, true);
    	  data.setCell(2, 0, 'Steve');
    	  data.setCell(2, 1, 8000);
    	  data.setCell(2, 2, false);
    	  data.setCell(3, 0, 'Ellen');
    	  data.setCell(3, 1, 20000);
    	  data.setCell(3, 2, true);
    	  data.setCell(4, 0, 'Mike');
    	  data.setCell(4, 1, 12000);
    	  data.setCell(4, 2, false);

    	  var formatter = new google.visualization.NumberFormat({prefix: '$'});
    	  formatter.format(data, 1); // Apply formatter to second column

    	  var view = new google.visualization.DataView(data);
    	  view.setColumns([0, 1]);

    	  var table = new google.visualization.Table(document.getElementById('table_sort_div'));
    	  table.draw(view, {width: '100%', height: '100%'});

    	  var chart = new google.visualization.BarChart(document.getElementById('chart_sort_div'));
    	  chart.draw(view);

    	  google.visualization.events.addListener(table, 'sort',
    	      function(event) {
    	        data.sort([{column: event.column, desc: !event.ascending}]);
    	        chart.draw(view);
    	      });
    	}
   
    
    
</script>








    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Faturas</title>

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
                        <h1>Painel de Faturas</h1>
                        <p>Aqui você pode consultar o andamento de seu consumo!</p>
                        <p>Consulte a qualquer momento</code>.</p>
                       
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
