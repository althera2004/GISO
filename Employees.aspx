<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employees.aspx.cs" Inherits="Employees" %>

<!DOCTYPE html>
<html lang="es">
<head>
		<meta charset="utf-8" />
		<title>Cuadro de mando</title>
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->

		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

		<link rel="stylesheet" href="assets/css/ace-fonts.css" />

		<!-- ace styles -->

		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="assets/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
        <script type="text/javascript">
        </script>
	</head>
	<body>
		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
			    try { ace.settings.check('navbar', 'fixed') } catch (e) { }
			</script>
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand"><small>Gotika - Gestión ISO 9000</small></a>
				</div><!-- /.navbar-header -->
				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-bell-alt icon-animated-bell"></i>
								<span class="badge badge-important">8</span>
							</a>
							<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-warning-sign"></i>3 Alertas</li>
								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-pink icon-user"></i>Acceso no válido
											</span>
											<span class="pull-right badge badge-info">Hace 5 min</span>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-success icon-user"></i>Documento obsoleto
											</span>
											<span class="pull-right badge badge-success">Hace 1 hora</span>
										</div>
									</a>
								</li>
								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-xs no-hover btn-success icon-user"></i>Usuario bloqueado
											</span>
											<span class="pull-right badge badge-success">Hace 2 días</span>
										</div>
									</a>
								</li>
								<li></li>
							</ul>
						</li>
						<li class="green">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-envelope icon-animated-vertical"></i>
								<span class="badge badge-success">5</span>
							</a>
							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="icon-envelope-alt"></i>5 usuario conectados
								</li>
								<li>
									<a href="#">
										<img src="assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Admin</span>
											</span>
											<span class="msg-time">
												<i class="icon-time"></i>
												<span>Hace 1 hora</span>
											</span>
										</span>
									</a>
								</li>
								<li>
									<a href="#">
										<img src="assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">SVazquez</span>
											</span>
											<span class="msg-time">
												<i class="icon-time"></i>
												<span>Hace 20 min</span>
											</span>
										</span>
									</a>
								</li>
								<li>
									<a href="#">
										<img src="assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">JCastilla</span>
											</span>
											<span class="msg-time">
												<i class="icon-time"></i>
												<span>Hace 5 min</span>
											</span>
										</span>
									</a>
								</li>
								<li></li>
							</ul>
						</li>
                        <!-- Current User -->
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info"><small>Bienvenido,</small>Juan</span>
								<i class="icon-caret-down"></i>
							</a>
							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li><a href="#"><i class="icon-cog"></i>Configuración</a></li>
								<li><a href="Profile.html"><i class="icon-user"></i>Perfil</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="icon-off"></i>Logout</a></li>
							</ul>
						</li>
                        <!-- /Current User -->
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>
		<div class="main-container" id="main-container">
			<script type="text/javascript">
			    try { ace.settings.check('main-container', 'fixed') } catch (e) { }
			</script>
			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
					    try { ace.settings.check('sidebar', 'fixed') } catch (e) { }
					</script>
					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success" onclick="document.location='DashBoard.aspx';" title="<%=this.Dictionary["Cuadro de mandos"] %>">
								<i class="icon-signal"></i>
							</button>
							<button class="btn btn-info" onclick="document.location='Documents.aspx';" title="<%=this.Dictionary["Documentos"] %>">
								<i class="icon-book"></i>
							</button>
							<button class="btn btn-warning" onclick="document.location='ProfileActual.aspx';" title="<%=this.Dictionary["Perfil de usuario"] %>">
								<i class="icon-user"></i>
							</button>
							<button class="btn btn-danger" onclick="document.location='AdminPanel.aspx';" title="<%=this.Dictionary["Administración"] %>">
								<i class="icon-cogs"></i>
							</button>
						</div>
						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>
							<span class="btn btn-info"></span>
							<span class="btn btn-warning"></span>
							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">
						<asp:Literal runat="server" ID="LeftMenu"></asp:Literal>
					</ul><!-- /.nav-list -->
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
					<script type="text/javascript">
					    try { ace.settings.check('sidebar', 'collapsed') } catch (e) { }
					</script>
				</div>

				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
						    try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-group home-icon"></i>
								<a href="#">Inicio</a>
							</li>
							<li class="active"><%=this.Dictionary["Empleados"] %></li>
						</ul><!-- .breadcrumb -->

						<!-- Buscador -->
						<div class="nav-search" id="nav-search">
							<form class="form-search" action="Search.aspx" method="post">
								<span class="input-icon">
									<input type="text" placeholder="<%=this.Dictionary["Buscar"] %>" ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div>
                        <!-- /Buscador -->
                        <!-- #nav-search -->
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								<%= this.Company.Name %>
								<small>
									<i class="icon-double-angle-right"></i>
									<%=this.Dictionary["Empleados"] %>
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
                                <h4 class="pink">
									<i class="icon-hand-right icon-animated-hand-pointer blue"></i>
									<a href="EmployeeNew.aspx" class="green"> <%=this.Dictionary["AddNewEmployee"] %> </a>
								</h4>
								<hr />
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered table-striped">
														<thead class="thin-border-bottom">
															<tr>
																<th>
																	<i class="icon-caret-right blue"></i><%=this.Dictionary["Nombre"] %>
																</th>
																<th class="hidden-480">
                                                                	<i class="icon-caret-right blue"></i><%=this.Dictionary["Cargo"] %>
																</th>
																<th class="hidden-480">
                                                                	<i class="icon-caret-right blue"></i><%=this.Dictionary["Departamentos"] %>
																</th>
																<th>
                                                                	<i class="icon-caret-right blue"></i><%=this.Dictionary["Email"] %>
																</th>
																<th class="hidden-480">
                                                                	<i class="icon-caret-right blue"></i><%=this.Dictionary["Teléfono"] %>
																</th>													
															</tr>
														</thead>

														<tbody>
															<asp:Literal runat="server" ID="EmployeeData"></asp:Literal>
														</tbody>
													</table>
										</div><!-- /.table-responsive -->
									</div><!-- /span -->
								</div><!-- /row -->								
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

				<div class="ace-settings-container" id="ace-settings-container" style="display:none;">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="default" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; Choose Skin</span>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
							<label class="lbl" for="ace-settings-add-container">
								Inside
								<b>.container</b>
							</label>
						</div>
					</div>
				</div><!-- /#ace-settings-container -->
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->

		<script type="text/javascript">
		    window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
		    if ("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/jquery.slimscroll.min.js"></script>
		<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="assets/js/jquery.sparkline.min.js"></script>
		<script src="assets/js/flot/jquery.flot.min.js"></script>
		<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="assets/js/flot/jquery.flot.resize.min.js"></script>

		<!-- ace scripts -->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
		    jQuery(function ($) {
		        $('.easy-pie-chart.percentage').each(function () {
		            var $box = $(this).closest('.infobox');
		            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
		            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
		            var size = parseInt($(this).data('size')) || 50;
		            $(this).easyPieChart({
		                barColor: barColor,
		                trackColor: trackColor,
		                scaleColor: false,
		                lineCap: 'butt',
		                lineWidth: parseInt(size / 10),
		                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
		                size: size
		            });
		        })

		        $('.sparkline').each(function () {
		            var $box = $(this).closest('.infobox');
		            var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
		            $(this).sparkline('html', { tagValuesAttribute: 'data-values', type: 'bar', barColor: barColor, chartRangeMin: $(this).data('min') || 0 });
		        });

		        $('#pieChart1').click(function () { UpdatePieChart(1); });
		        $('#pieChart2').click(function () { UpdatePieChart(2); });


		        function UpdatePieChart(index) {
		            var d = null;
		            var t = '';
		            var r = null;
		            if (index == 1) {
		                d = data;
		                t = 'Esta semana';
		                r = Resume1;
		            }
		            if (index == 2) {
		                d = data2;
		                t = 'La semana anterior';
		                r = Resume2;
		            }

		            if (d != null) {
		                drawPieChart(placeholder, d);
		                $('#PieChartButton').html(t + '<i class="icon-angle-down icon-on-right bigger-110"></i>');
		                $('#PieChartFooter1').html(r[0]);
		                $('#PieChartFooter2').html(r[1]);
		                $('#PieChartFooter3').html(r[2]);
		            }
		        }


		        var placeholder = $('#piechart-placeholder').css({ 'width': '90%', 'min-height': '150px' });
		        var data = [
				{ label: "Documentos", data: 68.7, color: "#68BC31" },
				{ label: "Informes", data: 24.5, color: "#2091CF" },
				{ label: "Departamentos", data: 8.2, color: "#AF4E96" },
				{ label: "Empleados", data: 18.6, color: "#DA5430" },
				{ label: "Usuarios", data: 10, color: "#FEE074" }
			  ];
		        var data2 = [
				{ label: "Documentos", data: 168.7, color: "#68BC31" },
				{ label: "Informes", data: 64.5, color: "#2091CF" },
				{ label: "Departamentos", data: 18.2, color: "#AF4E96" },
				{ label: "Empleados", data: 48.6, color: "#DA5430" },
				{ label: "Usuarios", data: 50, color: "#FEE074" }
			  ];

		        var Resume1 = [19, 8, 5];
		        var Resume2 = [23, 4, 12];

		        function drawPieChart(placeholder, data, position) {
		            $.plot(placeholder, data, {
		                series: {
		                    pie: {
		                        show: true,
		                        tilt: 0.8,
		                        highlight: { opacity: 0.25 },
		                        stroke: { color: '#fff', width: 2 },
		                        startAngle: 2
		                    }
		                },
		                legend: {
		                    show: true,
		                    position: position || "ne",
		                    labelBoxBorderColor: null,
		                    margin: [-30, 15]
		                }
					,
		                grid: { hoverable: true, clickable: false }
		            })
		        }
		        drawPieChart(placeholder, data);

		        /**
		        we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
		        so that's not needed actually.
		        */
		        placeholder.data('chart', data);
		        placeholder.data('draw', drawPieChart);



		        var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
		        var previousPoint = null;

		        placeholder.on('plothover', function (event, pos, item) {
		            if (item) {
		                if (previousPoint != item.seriesIndex) {
		                    previousPoint = item.seriesIndex;
		                    var tip = item.series['label'] + " : " + item.series['percent'].toFixed(2) + '%';
		                    $tooltip.show().children(0).text(tip);
		                }
		                $tooltip.css({ top: pos.pageY + 10, left: pos.pageX + 10 });
		            } else {
		                $tooltip.hide();
		                previousPoint = null;
		            }

		        });






		        var d1 = [];
		        for (var i = 0; i < Math.PI * 2; i += 0.5) {
		            d1.push([i, Math.sin(i)]);
		        }

		        var d2 = [];
		        for (var i = 0; i < Math.PI * 2; i += 0.5) {
		            d2.push([i, Math.cos(i)]);
		        }

		        var d3 = [];
		        for (var i = 0; i < Math.PI * 2; i += 0.2) {
		            d3.push([i, Math.tan(i)]);
		        }


		        var sales_charts = $('#sales-charts').css({ 'width': '100%', 'height': '220px' });
		        $.plot("#sales-charts", [
					{ label: "Domains", data: d1 },
					{ label: "Hosting", data: d2 },
					{ label: "Services", data: d3 }
				], {
				    hoverable: true,
				    shadowSize: 0,
				    series: {
				        lines: { show: true },
				        points: { show: true }
				    },
				    xaxis: {
				        tickLength: 0
				    },
				    yaxis: {
				        ticks: 10,
				        min: -2,
				        max: 2,
				        tickDecimals: 3
				    },
				    grid: {
				        backgroundColor: { colors: ["#fff", "#fff"] },
				        borderWidth: 1,
				        borderColor: '#555'
				    }
				});


		        $('#recent-box [data-rel="tooltip"]').tooltip({ placement: tooltip_placement });
		        function tooltip_placement(context, source) {
		            var $source = $(source);
		            var $parent = $source.closest('.tab-content')
		            var off1 = $parent.offset();
		            var w1 = $parent.width();

		            var off2 = $source.offset();
		            var w2 = $source.width();

		            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
		            return 'left';
		        }


		        $('.dialogs,.comments').slimScroll({
		            height: '300px'
		        });


		        //Android's default browser somehow is confused when tapping on label which will lead to dragging the task
		        //so disable dragging when clicking on label
		        var agent = navigator.userAgent.toLowerCase();
		        if ("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
		            $('#tasks').on('touchstart', function (e) {
		                var li = $(e.target).closest('#tasks li');
		                if (li.length == 0) return;
		                var label = li.find('label.inline').get(0);
		                if (label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation();
		            });


		    })

		</script>
	</body>
</html>