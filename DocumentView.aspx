<%@ Page Title="" Language="C#" MasterPageFile="~/Giso.master" AutoEventWireup="true" CodeFile="DocumentView.aspx.cs" Inherits="DocumentView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageStyles" Runat="Server">
    <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageScripts" Runat="Server">
    <!-- Script de la página -->
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript">
        var documento = <%=this.DocumentoJson %>;
        var documentId = <%=this.DocumentId %>;
        var companyId = <%=this.CompanyId %>;
        var userId = <%=this.UserId %>;
        var userName = '<%=this.UserName %>';
        var categorias = [<%= this.CategoriasJson %>];
        var procedencias = [<%= this.ProcedenciasJson %>];
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHeadContentHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Contentholder1" Runat="Server">
                            <div>
								<div>
									<div id="user-profile-2" class="user-profile">
										<div class="tabbable">
											<ul class="nav nav-tabs padding-18">
												<li class="active">
													<a data-toggle="tab" href="#home"><%=this.Dictionary["Detalle del documento"] %></a>
												</li>

												<li class="" id="TabHistoricoSelector">
													<a data-toggle="tab" href="#feed"><%=this.Dictionary["Versiones"] %></a>
												</li>

												<li class="" id="Li1">
													<a data-toggle="tab" href="#trazas"><%=this.Dictionary["Trazas"] %></a>
												</li>

                                                <li style="float:right;">
                                                    <div class="col-sm-6">
                                                    <label class="control-label no-padding-right" for="form-input-readonly"><%=this.Dictionary["Activo"] %></label>
                                                    </div>
                                                </li>
											</ul>
											<div class="tab-content no-border padding-24">
												<div id="home" class="tab-pane active">                                                
                                                    <form class="form-horizontal" role="form">
									                        <div class="form-group">
										                        <div class="col-sm-2"><input type="text" id="TxtCodigo" placeholder="<%=this.Dictionary["Código"] %>" class="col-xs-10 col-sm-10" /></div>
										                        <div class="col-sm-6"><input type="text" id="TxtDocumento" placeholder="<%=this.Dictionary["Documento"] %>" class="col-xs-10 col-sm-10" /></div>
										                        <div class="col-sm-2"><input type="text" id="TxtFechaAlta" placeholder="<%=this.Dictionary["Fecha alta"] %>" class="col-xs-10 col-sm-10" readonly="" /></div>
										                        <div class="col-sm-2"><input type="text" id="TxtFechaBaja" placeholder="<%=this.Dictionary["Fecha baja"] %>" class="col-xs-10 col-sm-10" /></div>
									                        </div>
									                        <div class="space-4"></div>                                    
									                        <div class="form-group">
										                        <div class="col-sm-7">										
										                            <select class="form-control col-xs-10 col-sm-10" id="CmbCategoria" data-placeholder="<%=this.Dictionary["Categoría"] %>">
											                            <asp:Literal runat="server" ID="LtCategorias"></asp:Literal>
										                            </select>
                                                                </div>
                                                                <div class="col-sm-1"><span class="btn btn-light" style="height:30px;" id="BtnCategory">...</span></div>
										                        <div class="col-sm-2"><input type="text" readonly="" id="TxtFechaRevision" placeholder="<%=this.Dictionary["Fecha revisión"] %>" class="col-xs-10 col-sm-10" /></div>
										                        <div class="col-sm-2"><input type="text" readonly="" id="TxtRevision" placeholder="<%=this.Dictionary["Revisión"] %>" class="col-xs-10 col-sm-10" /></div>
									                        </div>
									                        <div class="space-4"></div>                                    
									                        <div class="form-group">
										                        <label class="col-sm-1 control-label no-padding-right" for="form-input-readonly"><%=this.Dictionary["Conservación"] %></label>
                                                                <div class="col-sm-1"><input type="text" class="col-xs-10 col-sm-12" id="TxtConservacion" /></div>
                                                                <div class="col-sm-2">										
										                            <select class="form-control col-xs-10 col-sm-10" id="CmbConservacion" data-placeholder="<%=this.Dictionary["Categoría"] %>">
											                            <asp:Literal runat="server" ID="LtConservacion"></asp:Literal>
										                            </select>
                                                                </div>
									                        </div>
									                        <div class="space-4"></div>                                    
									                        <div class="form-group">
                                                                <label class="col-sm-1 control-label no-padding-right" for="form-input-readonly"><%=this.Dictionary["Origen"] %></label>
                                                                <div class="col-sm-2">										
										                            <select class="form-control col-xs-10 col-sm-10" id="CmbOrigen" data-placeholder="<%=this.Dictionary["Categoría"] %>">
                                                                        <asp:Literal runat="server" ID="LtOrigen"></asp:Literal>
										                            </select>
                                                                </div>
                                                                <div class="col-sm-7">										
										                            <select class="form-control col-xs-10 col-sm-10" id="CmbProcedencia" data-placeholder="<%=this.Dictionary["Procedencia"] %>">
											                            <asp:Literal runat="server" ID="LtProcedencias"></asp:Literal>
										                            </select>
                                                                </div>
                                                                <div class="col-sm-1"><span class="btn btn-light" style="height:30px;" id="BtnProcedencia">...</span></div>
									                        </div>
									                        <div class="space-4"></div>                                    
									                        <div class="form-group">										                        
										                        <div class="col-sm-12"><input type="text" id="TxtUbicacion" placeholder="<%=this.Dictionary["Ubicación"] %>" class="col-xs-10 col-sm-10" /></div>
									                        </div>
									                        <div class="space-4"></div>                                    
									                        <div class="form-group">										                        
										                        <div class="col-sm-12"><input type="text" id="TxtMotivo" placeholder="<%=this.Dictionary["Motivo del cambio"] %>" class="col-xs-10 col-sm-10" /></div>
									                        </div>
									                        <div class="clearfix form-actions">
										                        <div class="col-md-6"><%=this.Dictionary["Modificado por"] %><strong>&nbsp;<asp:Literal runat="server" ID="LtUser"></asp:Literal></strong><br /><asp:Literal runat="server" ID="LtFecha"></asp:Literal></div>
										                        <div class="col-md-6">
											                        <button class="btn btn-info" type="button" id="BtnNewVersion">
												                        <i class="icon-ok bigger-110"></i>
												                        <%=this.Dictionary["Nueva versión"] %>
											                        </button>
											                        <button class="btn btn-success" type="button" id="BtnSave">
												                        <i class="icon-ok bigger-110"></i>
												                        <%=this.Dictionary["Guardar cambios"] %>
											                        </button>
											                        &nbsp; &nbsp; &nbsp;
											                        <button class="btn" type="button">
												                        <i class="icon-undo bigger-110"></i>
												                        <%=this.Dictionary["Cancelar"] %>
											                        </button>
										                        </div>
									                        </div>
								                        </form>
												</div>
												<div id="feed" class="tab-pane">													
											            <table class="table table-bordered table-striped">
														    <thead class="thin-border-bottom">
															    <tr>
																    <th style="width:80px;"><%= this.Dictionary["Revisión"] %></th>
																    <th><%=this.Dictionary["Fecha"] %></th>
																    <th><%=this.Dictionary["Motivo"] %></th>
																    <th style="width:80px;"><%= this.Dictionary["Aprobado por"] %></th>													
															    </tr>
														    </thead>
														    <tbody>
															    <asp:Literal runat="server" ID="LtHistorico"></asp:Literal>
														    </tbody>
													    </table>
													</div>
												<div id="trazas" class="tab-pane">													
											            <table class="table table-bordered table-striped">
														    <thead class="thin-border-bottom">
															    <tr>
																    <th style="width:150px;"><%=this.Dictionary["Fecha"] %></th>
																    <th><%=this.Dictionary["Motivo"] %></th>
																    <th><%=this.Dictionary["Trazas"] %></th>
																    <th style="width:250px;"><%= this.Dictionary["Usuario"] %></th>													
															    </tr>
														    </thead>
														    <tbody>
															    <asp:Literal runat="server" ID="LtTrazas"></asp:Literal>
														    </tbody>
													    </table>
													</div>
												</div>
										</div>
									</div>
								</div>
							</div>
                            <div id="dialogCategory" class="hide" style="width:800px;">
								<div class="table-responsive">
											<table class="table table-bordered table-striped">
														<thead class="thin-border-bottom">
															<tr>
																<th>
																	<i class="icon-caret-right blue"></i><%=this.Dictionary["Categoría"] %>
																</th>
																<th class="hidden-480">&nbsp;</th>													
															</tr>
														</thead>

														<tbody>
															<asp:Literal runat="server" ID="LtCategoriasTable"></asp:Literal>
														</tbody>
													</table>
										</div><!-- /.table-responsive -->
						    </div><!-- #dialog-message -->

                            <div id="dialogProcedencia" class="hide" style="width:800px;">
								<div class="table-responsive">
											<table class="table table-bordered table-striped">
														<thead class="thin-border-bottom">
															<tr>
																<th>
																	<i class="icon-caret-right blue"></i><%=this.Dictionary["Procedencia"] %>
																</th>
																<th class="hidden-480">&nbsp;</th>													
															</tr>
														</thead>

														<tbody>
															<asp:Literal runat="server" ID="LtProcedenciasTable"></asp:Literal>
														</tbody>
													</table>
										</div><!-- /.table-responsive -->
                            </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptBodyContentHolder" Runat="Server">
        <script type="text/javascript" src="assets/js/jquery-ui-1.10.3.full.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script type="text/javascript" src="assets/js/chosen.jquery.min.js"></script>
		<script type="text/javascript" src="assets/js/fuelux/fuelux.spinner.min.js"></script>
		<script type="text/javascript" src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script type="text/javascript" src="assets/js/date-time/bootstrap-timepicker.min.js"></script>
		<script type="text/javascript" src="assets/js/date-time/moment.min.js"></script>
		<script type="text/javascript" src="assets/js/date-time/daterangepicker.min.js"></script>
		<script type="text/javascript" src="assets/js/bootstrap-colorpicker.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.knob.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.autosize.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.maskedinput.min.js"></script>
		<script type="text/javascript" src="assets/js/bootstrap-tag.min.js"></script>
        <!-- page scripts -->
        <script type="text/javascript" src="js/DocumentView.js"></script>

        <script type="text/javascript">
            function SetCategoria(e) {
                var categoriaId = e.target.id.split('-')[1];
                var comboItems = document.getElementById('CmbCategoria').childNodes
                for (var x = 0; x < comboItems.length; x++) {
                    var item = comboItems[x];
                    if (item.tagName == 'OPTION') {
                        if (item.value == categoriaId) {
                            item.selected = true;
                        }
                        else {
                            item.selected = false;
                        }
                    }
                }
                $('#dialogCategory').dialog('close');
            }

            function SetProcedencia(e) {
                var procedenciaId = e.target.id.split('-')[1];
                var comboItems = document.getElementById('CmbProcedencia').childNodes
                for (var x = 0; x < comboItems.length; x++) {
                    var item = comboItems[x];
                    if (item.tagName == 'OPTION') {
                        if (item.value == procedenciaId) {
                            item.selected = true;
                        }
                        else {
                            item.selected = false;
                        }
                    }
                }
                $('#dialogProcedencia').dialog('close');
            }

            jQuery(function ($) {
                $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
                    _title: function (title) {
                        var $title = this.options.title || '&nbsp;'
                        if (("title_html" in this.options) && this.options.title_html == true)
                            title.html($title);
                        else title.text($title);
                    }
                }));

                $('.categoria').on('click', SetCategoria);
                $('.procedencia').on('click', SetProcedencia);

                $("#BtnCategory").on('click', function (e) {
                    e.preventDefault();

                    var dialog = $("#dialogCategory").removeClass('hide').dialog({
                        resizable: false,
                        modal: true,
                        title: "<div class='widget-header'><h4 class='smaller'><i class='icon-list blue'></i> Categorías del documento</h4></div>",
                        title_html: true,
                        width: 800,
                        buttons: [
							{
							    id: 'BtnNewCategorySave',
							    html: "<i class='icon-ok bigger-110'></i>&nbsp; Afegir",
							    "class": "btn btn-success btn-xs",
							    click: function () {
							        SaveAndSelect = 0;
							        Save();
							    }
							}
							,
							{
							    id: 'BtnNewCategorySaveAndSelect',
							    html: "<i class='icon-ok bigger-110'></i>&nbsp; Afegir i sel·leccionar",
							    "class": "btn btn-success btn-xs",
							    click: function () {
							        SaveAndSelect = 1;
							        Save();
							    }
							}
							,
							{
							    html: "<i class='icon-remove bigger-110'></i>&nbsp; Cancel·lar",
							    "class": "btn btn-xs",
							    click: function () {
							        $(this).dialog("close");
							    }
							}
						]

                    });
                });

                $("#BtnProcedencia").on('click', function (e) {
                    e.preventDefault();
                    var dialog = $("#dialogProcedencia").removeClass('hide').dialog({
                        resizable: false,
                        modal: true,
                        title: "<div class='widget-header'><h4 class='smaller'><i class='icon-list blue'></i> Procedencias del documento</h4></div>",
                        title_html: true,
                        width: 800,
                        buttons: [
                            {
                                id: 'BtnNewCategorySave',
                                html: "<i class='icon-ok bigger-110'></i>&nbsp; Afegir",
                                "class": "btn btn-success btn-xs",
                                click: function () {
                                }
                            },
                            /*{
                                id: 'BtnNewCategorySaveAndSelect',
                                html: "<i class='icon-ok bigger-110'></i>&nbsp; Afegir i sel·leccionar",
                                "class": "btn btn-success btn-xs",
                                click: function () {
                                }
                            },*/
                            {
                                html: "<i class='icon-remove bigger-110'></i>&nbsp; Cancel·lar",
                                "class": "btn btn-xs",
                                click: function () { $(this).dialog("close"); }
                            }
                        ]
                    });
                });
            });

            if (documentId != -1) {
                $('#TxtCodigo').val(documento.Codigo);
                $('#TxtDocumento').val(documento.Documento);
                $('#TxtFechaAlta').val(documento.FechaAlta);
                $('#TxtFechaBaja').val(documento.FechaBaja);
                $('#TxtFechaRevision').val(documento.FechaRevision);
                $('#TxtUbicacion').val(documento.Ubicacion);
                $('#TxtMotivo').val(documento.Motivo);
                $('#TxtRevision').val('Revision: ' + documento.Revision);
                $('#TxtConservacion').val(documento.Conservacion.cantidad);
            }
            else {
                $('#TabHistoricoSelector').hide();
                $('#TxtFechaAlta').val(FormatDate(new Date()));
                $('#BtnNewVersion').hide();
            }
        </script>
</asp:Content>

