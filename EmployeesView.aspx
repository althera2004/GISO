<%@ Page Title="" Language="C#" MasterPageFile="~/Giso.master" AutoEventWireup="true" CodeFile="EmployeesView.aspx.cs" Inherits="EmployeesView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageStyles" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageScripts" Runat="Server">
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
													<a data-toggle="tab" href="#home"><%=this.Dictionary["Datos principales"] %></a>
												</li>

												<li class="">
													<a data-toggle="tab" href="#departments"><%=this.Dictionary["Departamentos"] %></a>
												</li>

												<li class="" id="TabHistoricoSelector">
													<a data-toggle="tab" href="#feed"><%=this.Dictionary["Formación"] %></a>
												</li>

												<li class="" id="Li1">
													<a data-toggle="tab" href="#trazas"><%=this.Dictionary["Formación interna"] %></a>
												</li>

												<li class="" id="Li2">
													<a data-toggle="tab" href="#trazas"><%=this.Dictionary["Trazas"] %></a>
												</li>

                                                <li style="float:right;">
                                                    <div class="col-sm-6">
                                                    <label class="control-label no-padding-right" for="form-input-readonly"><%=this.Dictionary["Activo"] %></label>
                                                    </div>
                                                </li>
											</ul>
											<div class="tab-content no-border padding-24" style="height:500px;">
												<div id="home" class="tab-pane active">       
                                                    <div style="width:75%;float:left;">
                                                        <form class="form-horizontal" role="form">
									                        <div class="form-group">
										                        <div class="col-sm-3"><input type="text" id="TxtNombre" placeholder="<%=this.Dictionary["Nombre"] %>" class="col-xs-12 col-sm-12" /></div>
										                        <div class="col-sm-4"><input type="text" id="TxtApellido1" placeholder="Primer apellido" class="col-xs-12 col-sm-12" /></div>
										                        <div class="col-sm-3"><input type="text" id="TxtApellido2" placeholder="Segundo apellido" class="col-xs-12 col-sm-12"/></div>
										                        <div class="col-sm-2"><input type="text" id="TxtNif" placeholder="NIF" class="col-xs-12 col-sm-12"/></div>
									                        </div>
									                        <div class="form-group">
										                        <div class="col-sm-12"><input type="text" id="TxtDireccion" placeholder="Dirección" class="col-xs-12 col-sm-12" /></div>
									                        </div>
									                        <div class="form-group">
										                        <div class="col-sm-1"><input type="text" id="TxtCp" placeholder="C.P." class="col-xs-12 col-sm-12" /></div>
										                        <div class="col-sm-4"><input type="text" id="TxtPoblacion" placeholder="Poblacion" class="col-xs-12 col-sm-12" /></div>
										                        <div class="col-sm-4"><input type="text" id="TxtProvincia" placeholder="Provincia" class="col-xs-12 col-sm-12"/></div>
										                        <div class="col-sm-3"><input type="text" id="TxtPais" placeholder="Pais" class="col-xs-12 col-sm-12"/></div>
									                        </div>
                                                            <div class="for-group">
                                                                <label class="col-sm-12"><%=this.Dictionary["Notas"] %></label>
                                                            </div>
                                                            <div class="form-group">
										                        <div class="col-sm-12"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtNotas"></textarea></div>
									                        </div>
								                        </form>
                                                    </div>
                                                    <div style="width:20%;float:right;">
                                                        foto
                                                    </div>                                                    
								                    <hr />
								                    <div class="row">
									                    <div class="col-xs-12">
										                    <div class="table-responsive">
                                                                <h4>Informació profesional</h4>
											                    <table class="table table-bordered table-striped">
														                    <thead class="thin-border-bottom">
															                    <tr>
																                    <th><%=this.Dictionary["Cargo"] %></th>
																                    <th class="hidden-480"><%=this.Dictionary["Departamento"] %></th>
																                    <th class="hidden-480"><%=this.Dictionary["Responsable"] %></th>
																                    <th class="hidden-480" style="width:120px;"><%=this.Dictionary["Fecha alta"] %></th>
																                    <th class="hidden-480" style="width:120px;"><%=this.Dictionary["Fecha baja"] %></th>													
															                    </tr>
														                    </thead>
														                    <tbody>
															                    <tr>
                                                                                    <td>Mantenimiento alarmas</td>
                                                                                    <td>Infraestructuras</td>
                                                                                    <td>Marino Acevedo</td>
                                                                                    <td align="center">01/01/2013</td>
                                                                                    <td align="center">31/07/2013</td>
                                                                                </tr>
															                    <tr>
                                                                                    <td>Mantenimiento eléctrico</td>
                                                                                    <td>Infraestructuras</td>
                                                                                    <td>Juan Castilla Calderón</td>
                                                                                    <td align="center">31/07/2013</td>
                                                                                    <td align="center">-</td>
                                                                                </tr>
														                    </tbody>
													                    </table>
										                    </div><!-- /.table-responsive -->
									                    </div><!-- /span -->
								                    </div><!-- /row -->	
												</div>
												<div id="departments" class="tab-pane">	
                                                    <h4 class="pink">
									                    <i class="icon-hand-right icon-animated-hand-pointer blue"></i>
									                    <a href="#" class="green" id="BtnNewDepartment"> <%=this.Dictionary["Añadir departamento"]%> </a>
								                    </h4>
								                    <hr />
                                                    <h4 class="pink">
									                    <i class="icon-hand-right icon-animated-hand-pointer blue"></i>
									                    <a href="#" class="green" id="A1"> <%=this.Dictionary["Asociar a departamento existente"]%></a>
								                    </h4>
								                    <hr />												
											        <table class="table table-bordered table-striped">
														<thead class="thin-border-bottom">
															<tr>
																<th><%= this.Dictionary["Nombre"] %></th>
                                                                <th style="width:20px;">&nbsp;</th>												
															</tr>
														</thead>
														<tbody>
															<tr>
                                                                <td><a href="#">Infraestructuras</a></td>
                                                                <td>
															        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
																        <button class="btn btn-xs btn-danger">
																	        <i class="icon-trash bigger-120"></i>
																        </button>
															        </div>
														        </td>                                                                 
                                                            </tr>
															<tr>
                                                                <td><a href="#">Docencia</a></td> 
                                                                <td>
															        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
																        <button class="btn btn-xs btn-danger">
																	        <i class="icon-trash bigger-120"></i>
																        </button>
															        </div>
														        </td>                                                               
                                                            </tr>
														</tbody>
													</table>
												</div>
												<div id="feed" class="tab-pane">
                                                    <h4>Formación para el cargo de <strong>Ténico de mantenimiento</strong></h4>
                                                    <form class="form-horizontal" role="form">
                                                        <div class="for-group">
                                                            <label class="col-sm-5"><%=this.Dictionary["Responsabilidades"] %></label>
                                                            <label class="col-sm-7"><%=this.Dictionary["Notas"] %></label>
                                                        </div>
                                                        <div class="form-group">
										                    <div class="col-sm-5"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtResponsabilidades"></textarea></div>
										                    <div class="col-sm-5"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="Textarea1"></textarea></div>
                                                            <div class="col-sm-2>
                                                                <table>
                                                                    <tr>
                                                                        <td colspan="2">Válido<br /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Sí</td>
                                                                        <td><input type="radio" id="Radio4" value="a" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>No</td>
                                                                        <td><input type="radio" id="Radio5" value="a" /></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
									                    </div>
                                                        <div class="for-group">
                                                            <label class="col-sm-5"><%=this.Dictionary["Formación académica deseada"] %></label>
                                                            <label class="col-sm-7"><%=this.Dictionary["Formación específica deseada"] %></label>
                                                        </div>
                                                        <div class="form-group">
										                    <div class="col-sm-5"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtFormacionAcademicaDeseada"></textarea></div>
										                    <div class="col-sm-5"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtFormacionEspecificaDeseada"></textarea></div>
                                                            <div class="col-sm-2>
                                                                <table>
                                                                    <tr>
                                                                        <td colspan="2">Válido<br /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Sí</td>
                                                                        <td><input type="radio" id="Radio1" value="a" /></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>No</td>
                                                                        <td><input type="radio" id="Radio2" value="a" /></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
									                    </div>
                                                        <div class="for-group">
                                                            <label class="col-sm-5"><%=this.Dictionary["Experiencia laboral"] %></label>
                                                            <label class="col-sm-5"><%=this.Dictionary["Habilidades"] %></label>
                                                        </div>
                                                        <div class="form-group">
										                    <div class="col-sm-5"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtExperienciaLaboral"></textarea></div>
										                    <div class="col-sm-5"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtHabilidades"></textarea></div>
									                    </div> 
								                    </form>
												</div>
												<div id="trazas" class="tab-pane">		
                                                    <h4>Formació realitzada a l'empresa</h4>											
											        <table class="table table-bordered table-striped">
														<thead class="thin-border-bottom">
															<tr>
																<th>Nom de l'acció formativa</th>
																<th style="width:150px;">Data de realització</th>
                                                                <th style="width:30px;">Apte</th>												
															</tr>
														</thead>
														<tbody>
															<tr>
                                                                <td>Curso de riesgos laborales</td>
                                                                <td>04/04/2013</td>                                                                 
                                                                <td align="center">Sí</td>
                                                            </tr>
															<tr>
                                                                <td>Control de acceso biométrico</td>
                                                                <td>16/09/2013</td>                                                                 
                                                                <td align="center">Sí</td>
                                                            </tr>
														</tbody>
													</table>
													</div>
												</div>
                                                
									        <div class="clearfix form-actions">
										        <div class="col-md-6"><%=this.Dictionary["Modificado por"] %><strong>&nbsp;<asp:Literal runat="server" ID="LtUser"></asp:Literal></strong><br /><asp:Literal runat="server" ID="LtFecha"></asp:Literal></div>
										        <div class="col-md-6">
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
</asp:Content>

