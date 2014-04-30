<%@ Page Title="" Language="C#" MasterPageFile="~/Giso.master" AutoEventWireup="true" CodeFile="ProcesosView.aspx.cs" Inherits="ProcesosView" %>

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
													<a data-toggle="tab" href="#home"><%=this.Dictionary["Proceso"] %></a>
												</li>

												<li class="" id="Li1">
													<a data-toggle="tab" href="#trazas"><%=this.Dictionary["Trazas"] %></a>
												</li>
											</ul>
											<div class="tab-content no-border padding-24">
												<div id="home" class="tab-pane active">                                                
                                                    <form class="form-horizontal" role="form">
									                        <div class="form-group">
										                        <div class="col-sm-6"><input type="text" id="TxtName" placeholder="<%=this.Dictionary["Nombre"] %>" class="col-xs-12 col-sm-12" value="<%=this.Proceso.Description %>" /></div>                                                                
									                        </div>
                                                            <div class="form-group">  
										                        <div class="col-sm-7">										
										                            <select class="form-control col-xs-10 col-sm-10" id="CmbCargo" data-placeholder="<%=this.Dictionary["Cargo"] %>">
                                                                        <option value="">Seleccionar càrrec...</option>
											                            <asp:Literal runat="server" ID="LtCargos"></asp:Literal>
										                            </select>
                                                                </div>
                                                                <div class="col-sm-1"><span class="btn btn-light" style="height:30px;" id="BtnCargo">...</span></div>
									                        </div>
                                                            <div class="form-group"> 
                                                                <div class="col-sm-6">										
										                            <select class="form-control col-xs-12 col-sm-12" id="CmbTipo" data-placeholder="<%=this.Dictionary["Tipo"] %>">
                                                                        <option value="">Seleccionar tipus...</option>
											                            <asp:Literal runat="server" ID="LtTipos"></asp:Literal>
										                            </select>
                                                                </div> 
                                                            </div>
                                                            <div class="for-group">
                                                                <label class="col-sm-8">1.- <%=this.Dictionary["Inicio"] %></label>
                                                            </div>
                                                            <div class="form-group">
										                        <div class="col-sm-8"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtResponsabilidades"><%=this.Proceso.Startdate %></textarea></div>
									                        </div>
                                                            <div class="for-group">
                                                                <label class="col-sm-8">2.- <%=this.Dictionary["Desarrollo"] %></label>
                                                            </div>
                                                            <div class="form-group">
										                        <div class="col-sm-8"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtFormacionAcademicaDeseada"><%=this.Proceso.Work %></textarea></div>
									                        </div>
                                                            <div class="for-group">
                                                                <label class="col-sm-8">3.- <%=this.Dictionary["Fin"] %></label>
                                                            </div>
                                                            <div class="form-group">
										                        <div class="col-sm-8"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtExperienciaLaboral"><%=this.Proceso.EndDate %></textarea></div>
									                        </div>  
									                        <div class="clearfix form-actions">
										                        <div class="col-md-6"><%=this.Dictionary["Modificado por"] %>:&nbsp;<asp:Literal runat="server" ID="LtModificado"></asp:Literal></div>
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
								                        </form>
												</div>
												</div>
										</div>
									</div>
								</div>
							</div>

                             <div id="dialogDepartment" class="hide" style="width:800px;">
								<div class="table-responsive">
									<table class="table table-bordered table-striped">
										<thead class="thin-border-bottom">
											<tr>
												<th><%=this.Dictionary["Departamento"] %></th>
												<th class="hidden-480">&nbsp;</th>													
											</tr>
										</thead>
										<tbody>
											<asp:Literal runat="server" ID="LtDepartamentosTable"></asp:Literal>
										</tbody>
									</table>
								</div><!-- /.table-responsive -->
						    </div><!-- #dialog-message -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptBodyContentHolder" Runat="Server">
</asp:Content>

