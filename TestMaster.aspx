<%@ Page Title="" Language="C#" MasterPageFile="~/Giso.master" AutoEventWireup="true" CodeFile="TestMaster.aspx.cs" Inherits="TestMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptHeadContentHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contentholder1" Runat="Server">


								<div class="row">
									<div class="space-6"></div>
									<div class="col-sm-7 infobox-container">
										<div class="infobox infobox-green  ">
											<div class="infobox-icon">
												<i class="icon-book"></i>
											</div>
											<div class="infobox-data">
												<span class="infobox-data-number"><%=this.DocumentsNumber %></span>
												<div class="infobox-content"><%= this.Dictionary["Documentos"] %></div>
											</div>
										</div>
										<div class="infobox infobox-blue  ">
											<div class="infobox-icon">
												<i class="icon-book"></i>
											</div>
											<div class="infobox-data">
												<span class="infobox-data-number"><%=this.DocumentsRecentNumber %></span>
												<div class="infobox-content"><%= this.Dictionary["Nuevos documentos"] %></div>
											</div>
											<div class="stat stat-success"><%= this.DocumentsNumber == 0 ? 0 : this.DocumentsRecentNumber * 100 / this.DocumentsNumber%>%</div>
										</div>
										<div class="infobox infobox-pink  ">
											<div class="infobox-icon">
												<i class="icon-paperclip"></i>
											</div>
											<div class="infobox-data">
												<span class="infobox-data-number">8</span>
												<div class="infobox-content"><%= this.Dictionary["Informes"] %></div>
											</div>
										</div>
										<div class="infobox infobox-red  ">
											<div class="infobox-icon">
												<i class="icon-warning-sign"></i>
											</div>
											<div class="infobox-data">
												<span class="infobox-data-number">7</span>
												<div class="infobox-content">Login failed</div>
											</div>
										</div>
										<div class="infobox infobox-orange2  ">
											<div class="infobox-chart">
												<span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
											</div>
											<div class="infobox-data">
												<span class="infobox-data-number">6.251</span>
												<div class="infobox-content"><%= this.Dictionary["Visualizaciones"] %></div>
											</div>
										</div>
										<div class="infobox infobox-blue2  ">
											<div class="infobox-progress">
												<div class="easy-pie-chart percentage" data-percent="42" data-size="46">
													<span class="percent"><%=this.DocumentsNumber == 0 ? 0 : this.DocumentsDraftsNumber * 100 / this.DocumentsNumber%></span>%
												</div>
											</div>
											<div class="infobox-data">
												<span class="infobox-text"><%= this.Dictionary["Borradores"] %></span>
												<div class="infobox-content">
													<strong><span class="bigger-110"><%=this.DocumentsDraftsNumber %> <%= this.Dictionary["Documentos"] %></span></strong>
												</div>
											</div>
										</div>
										<div class="space-6"></div>

										<div class="infobox infobox-green infobox-small infobox-dark">
											<div class="infobox-progress">
												<div class="easy-pie-chart percentage" data-percent="61" data-size="39">
													<span class="percent">61</span>%
												</div>
											</div>

											<div class="infobox-data">
												<div class="infobox-content">Trabajo</div>
												<div class="infobox-content">Realizado</div>
											</div>
										</div>

										<div class="infobox infobox-blue infobox-small infobox-dark">
											<div class="infobox-chart">
												<span class="sparkline" data-values="3,4,2,3,4,4,2,2"></span>
											</div>

											<div class="infobox-data">
												<div class="infobox-content"><%=this.Dictionary["Espacio"] %></div>
												<div class="infobox-content">457 MB</div>
											</div>
										</div>

										<div class="infobox infobox-grey infobox-small infobox-dark">
											<div class="infobox-icon">
												<i class="icon-download-alt"></i>
											</div>

											<div class="infobox-data">
												<div class="infobox-content">Downloads</div>
												<div class="infobox-content">32</div>
											</div>
										</div>
									</div>

									<div class="vspace-sm"></div>

									<div class="col-sm-5">
										<div class="widget-box">
											<div class="widget-header widget-header-flat widget-header-small">
												<h5>
													<i class="icon-signal"></i>
													<%=this.Dictionary["Trazas de trabajo"] %>
												</h5>

												<div class="widget-toolbar no-border" style="margin-top:6px;">
													<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" id="PieChartButton">
														<%=this.Dictionary["esta semana"] %>
														<i class="icon-angle-down icon-on-right bigger-110"></i>
													</button>

													<ul class="dropdown-menu pull-right dropdown-125 dropdown-lighter dropdown-caret">
														<li class="active">
															<a href="#" class="blue" id="pieChart1">
																<i class="icon-caret-right bigger-110">&nbsp;</i>
																<%=this.Dictionary["esta semana"] %>
															</a>
														</li>

														<li>
															<a href="#" id="pieChart2">
																<i class="icon-caret-right bigger-110 invisible">&nbsp;</i>
																La semana anterior
															</a>
														</li>

														<li>
															<a href="#" id="pieChart3">
																<i class="icon-caret-right bigger-110 invisible">&nbsp;</i>
																Este mes
															</a>
														</li>

														<li>
															<a href="#" id="pieChart4">
																<i class="icon-caret-right bigger-110 invisible">&nbsp;</i>
																Mes anterior
															</a>
														</li>
													</ul>
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<div id="piechart-placeholder"></div>

													<div class="hr hr8 hr-double"></div>

													<div class="clearfix">
														<div class="grid2">
															<span class="grey"><%=this.Dictionary["Documentos"] %><br /><%=this.Dictionary["afectados"] %></span>
															<h4 class="bigger pull-right" id="PieChartFooter1">11</h4>
														</div>
														<div class="grid2">
															<span class="grey"><%=this.Dictionary["Usuarios"] %><br />intervinientes</span>
															<h4 class="bigger pull-right" id="PieChartFooter3">8</h4>
														</div>
													</div>
												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
									</div><!-- /span -->
								</div><!-- /row -->

								<div class="hr hr32 hr-dotted"></div>

								<div class="row">
									<div class="col-sm-5">
										<div class="widget-box transparent">
											<div class="widget-header widget-header-flat">
												<h4 class="lighter">
													<i class="icon-star orange"></i>
													<%=this.Dictionary["Últimos"] %> <%=this.Dictionary["Documentos"].ToString().ToLowerInvariant() %> (1 <%=this.Dictionary["semana"] %>)
												</h4>
												<div class="widget-toolbar" style="margin-top:12px;">
													<a href="#" data-action="collapse">
														<i class="icon-chevron-up"></i>
													</a>
												</div>
											</div>
											<div class="widget-body">
												<div class="widget-main no-padding">
													<table class="table table-bordered table-striped">
														<thead class="thin-border-bottom">
															<tr>
																<th>
																	<i class="icon-caret-right blue"></i><%=this.Dictionary["Documento"] %>
																</th>
																<th>
																	<i class="icon-caret-right blue"></i><%=this.Dictionary["Versión"] %>
																</th>
																<th class="hidden-480">
																	<i class="icon-caret-right blue"></i><%=this.Dictionary["Estado"] %>
																</th>
															</tr>
														</thead>
														<tbody>
															<%=this.UltimosDocumentos %>
														</tbody>
													</table>
												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
									</div>
									<div class="col-sm-7">
										<div class="widget-box transparent" id="recent-box">
											<div class="widget-header">
												<h4 class="lighter smaller">
													<i class="icon-rss orange"></i>
													<%=this.Dictionary["Acciones recientes"] %> (24 h.)
												</h4>

												<div class="widget-toolbar no-border">
													<ul class="nav nav-tabs" id="recent-tab">
														<li class="active">
															<a data-toggle="tab" href="#task-tab"><%=this.Dictionary["Documentos"] %></a>
														</li>

														<li>
															<a data-toggle="tab" href="#member-tab"><%=this.Dictionary["Usuarios"] %></a>
														</li>

														<li>
															<a data-toggle="tab" href="#comment-tab">Login failed</a>
														</li>
													</ul>
												</div>
											</div>

											<div class="widget-body">
												<div class="widget-main padding-4">
													<div class="tab-content padding-8 overflow-visible">
														<div id="task-tab" class="tab-pane active">
															<ul id="tasks" class="item-list">
																<li class="item-red clearfix">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"> DOC-0001.pdf</span>
																	</label>

																	<div class="pull-right action-buttons">
																		<a href="#" class="blue">
																			<i class="icon-pencil bigger-130"></i>
																			<%=this.Dictionary["Nueva versión"] %> <%=this.Dictionary["por"] %> <strong>Juan Castilla</strong>
																		</a>
																	</div>
																</li>

																<li class="item-red clearfix">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"> DOC-0002.pdf</span>
																	</label>

																	<div class="pull-right action-buttons">

																		<a href="#" class="red">
																			<i class="icon-trash bigger-130"></i>
																			<%=this.Dictionary["Eliminado"] %> <%=this.Dictionary["por"] %> <strong>Juan Castilla</strong>
																		</a>
																	</div>
																</li>

																<li class="item-red clearfix">
																	<label class="inline">
																		<input type="checkbox" class="ace" />
																		<span class="lbl"> DOC-0003.pdf</span>
																	</label>

																	<div class="pull-right action-buttons">

																		<a href="#" class="green">
																			<i class="icon-flag bigger-130"></i>
																			<%=this.Dictionary["Insertado"] %> <%=this.Dictionary["por"] %> <strong>Juan Castilla</strong>
																		</a>
																	</div>
																</li>
															</ul>
														</div>

														<div id="member-tab" class="tab-pane">
															<div class="clearfix">
																<div class="itemdiv memberdiv">
																	<div class="user">
																		<img alt="Bob Doe's avatar" src="assets/avatars/user.jpg" />
																	</div>

																	<div class="body">
																		<div class="name">
																			<a href="#">Bob Doe</a>
																		</div>

																		<div class="time">
																			<i class="icon-time"></i>
																			<span class="green">20 min</span>
																		</div>

																		<div>
																			<span class="label label-warning label-sm">pending</span>

																			<div class="inline position-relative">
																				<button class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle" data-toggle="dropdown">
																					<i class="icon-angle-down icon-only bigger-120"></i>
																				</button>

																				<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																					<li>
																						<a href="#" class="tooltip-success" data-rel="tooltip" title="Approve">
																							<span class="green">
																								<i class="icon-ok bigger-110"></i>
																							</span>
																						</a>
																					</li>

																					<li>
																						<a href="#" class="tooltip-warning" data-rel="tooltip" title="Reject">
																							<span class="orange">
																								<i class="icon-remove bigger-110"></i>
																							</span>
																						</a>
																					</li>

																					<li>
																						<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
																							<span class="red">
																								<i class="icon-trash bigger-110"></i>
																							</span>
																						</a>
																					</li>
																				</ul>
																			</div>
																		</div>
																	</div>
																</div>

																<div class="itemdiv memberdiv">
																	<div class="user">
																		<img alt="Joe Doe's avatar" src="assets/avatars/avatar2.png" />
																	</div>

																	<div class="body">
																		<div class="name">
																			<a href="#">Joe Doe</a>
																		</div>

																		<div class="time">
																			<i class="icon-time"></i>
																			<span class="green">1 hour</span>
																		</div>

																		<div>
																			<span class="label label-warning label-sm">pending</span>

																			<div class="inline position-relative">
																				<button class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle" data-toggle="dropdown">
																					<i class="icon-angle-down icon-only bigger-120"></i>
																				</button>

																				<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																					<li>
																						<a href="#" class="tooltip-success" data-rel="tooltip" title="Approve">
																							<span class="green">
																								<i class="icon-ok bigger-110"></i>
																							</span>
																						</a>
																					</li>

																					<li>
																						<a href="#" class="tooltip-warning" data-rel="tooltip" title="Reject">
																							<span class="orange">
																								<i class="icon-remove bigger-110"></i>
																							</span>
																						</a>
																					</li>

																					<li>
																						<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
																							<span class="red">
																								<i class="icon-trash bigger-110"></i>
																							</span>
																						</a>
																					</li>
																				</ul>
																			</div>
																		</div>
																	</div>
																</div>

																<div class="itemdiv memberdiv">
																	<div class="user">
																		<img alt="Alex Doe's avatar" src="assets/avatars/avatar5.png" />
																	</div>

																	<div class="body">
																		<div class="name">
																			<a href="#">Alex Doe</a>
																		</div>

																		<div class="time">
																			<i class="icon-time"></i>
																			<span class="green">3 hour</span>
																		</div>

																		<div>
																			<span class="label label-danger label-sm">blocked</span>
																		</div>
																	</div>
																</div>

																<div class="itemdiv memberdiv">
																	<div class="user">
																		<img alt="Bob Doe's avatar" src="assets/avatars/avatar2.png" />
																	</div>

																	<div class="body">
																		<div class="name">
																			<a href="#">Bob Doe</a>
																		</div>

																		<div class="time">
																			<i class="icon-time"></i>
																			<span class="green">6 hour</span>
																		</div>

																		<div>
																			<span class="label label-success label-sm arrowed-in">approved</span>
																		</div>
																	</div>
																</div>

																<div class="itemdiv memberdiv">
																	<div class="user">
																		<img alt="Susan's avatar" src="assets/avatars/avatar3.png" />
																	</div>

																	<div class="body">
																		<div class="name">
																			<a href="#">Susan</a>
																		</div>

																		<div class="time">
																			<i class="icon-time"></i>
																			<span class="green">yesterday</span>
																		</div>

																		<div>
																			<span class="label label-success label-sm arrowed-in">approved</span>
																		</div>
																	</div>
																</div>

																<div class="itemdiv memberdiv">
																	<div class="user">
																		<img alt="Phil Doe's avatar" src="assets/avatars/avatar4.png" />
																	</div>

																	<div class="body">
																		<div class="name">
																			<a href="#">Phil Doe</a>
																		</div>

																		<div class="time">
																			<i class="icon-time"></i>
																			<span class="green">2 days ago</span>
																		</div>

																		<div>
																			<span class="label label-info label-sm arrowed-in arrowed-in-right">online</span>
																		</div>
																	</div>
																</div>

																<div class="itemdiv memberdiv">
																	<div class="user">
																		<img alt="Alexa Doe's avatar" src="assets/avatars/avatar1.png" />
																	</div>

																	<div class="body">
																		<div class="name">
																			<a href="#">Alexa Doe</a>
																		</div>

																		<div class="time">
																			<i class="icon-time"></i>
																			<span class="green">3 days ago</span>
																		</div>

																		<div>
																			<span class="label label-success label-sm arrowed-in">approved</span>
																		</div>
																	</div>
																</div>
															</div>

															<div class="center">
																<i class="icon-group icon-2x green"></i>

																&nbsp;
																<a href="#">
																	Ver todos los usuarios &nbsp;
																	<i class="icon-arrow-right"></i>
																</a>
															</div>

															<div class="hr hr-double hr8"></div>
														</div><!-- member-tab -->

														<div id="comment-tab" class="tab-pane">
															<div class="comments">
																<div class="itemdiv commentdiv">
																	<div class="user">
																		<img alt="Bob Doe's Avatar" src="assets/avatars/avatar.png" />
																	</div>

																	<div class="body">
																		<div class="name">
																			<a href="#">jcastillo</a>
																		</div>

																		<div class="time">
																			<i class="icon-time"></i>
																			<span class="green">05-02-2014 16:34</span>
																		</div>

																		<div class="text">
																			<i class="icon-quote-left"></i>
																			IP:172.0.0.10 - Usuario no existe
																		</div>
																	</div>
																</div>

																
															</div>

															<div class="hr hr8"></div>

															<div class="center">
																<i class="icon-comments-alt icon-2x green"></i>

																&nbsp;
																<a href="#">
																	Ver todos los acceso no válidos &nbsp;
																	<i class="icon-arrow-right"></i>
																</a>
															</div>

															<div class="hr hr-double hr8"></div>
														</div>
													</div>
												</div><!-- /widget-main -->
											</div><!-- /widget-body -->
										</div><!-- /widget-box -->
									</div><!-- /span -->
								</div><!-- /row -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptBodyContentHolder" Runat="Server">
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
				{ label: "<%=this.Dictionary["Documentos"] %>", data: 68.7, color: "#68BC31" },
				{ label: "Informes", data: 24.5, color: "#2091CF" },
				{ label: "<%=this.Dictionary["Departamentos"] %>", data: 8.2, color: "#AF4E96" },
				{ label: "<%=this.Dictionary["Empleados"] %>", data: 18.6, color: "#DA5430" },
				{ label: "<%=this.Dictionary["Usuarios"] %>", data: 10, color: "#FEE074" }
			  ];
		        var data2 = [
				{ label: "<%=this.Dictionary["Documentos"] %>", data: 168.7, color: "#68BC31" },
				{ label: "<%=this.Dictionary["Departamentos"] %>", data: 18.2, color: "#AF4E96" },
				{ label: "<%=this.Dictionary["Empleados"] %>", data: 48.6, color: "#DA5430" },
				{ label: "<%=this.Dictionary["Usuarios"] %>", data: 50, color: "#FEE074" }
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
</asp:Content>

