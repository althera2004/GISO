<%@ Page Title="" Language="C#" MasterPageFile="~/Giso.master" AutoEventWireup="true" CodeFile="FormacionView.aspx.cs" Inherits="FormacionView" %>

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
													<a data-toggle="tab" href="#home"><%=this.Dictionary["Formación"] %></a>
												</li>

												<li class="" id="Li1">
													<a data-toggle="tab" href="#trazas"><%=this.Dictionary["Trazas"] %></a>
												</li>
											</ul>
											<div class="tab-content no-border padding-24">
												<div id="home" class="tab-pane active">                                                
                                                    <form class="form-horizontal" role="form">
									                        <div class="form-group">
										                        <div class="col-sm-1"><input type="text" id="TxtName" placeholder="Any" class="col-xs-12 col-sm-12" value="" /></div> 
										                        <div class="col-sm-1"><input type="radio" id="Text2" class="col-xs-12 col-sm-12" /></div>           
                                                                <label class="col-sm-1 control-label no-padding-right" for="form-input-readonly">Pendiente</label>
										                        <div class="col-sm-1"><input type="radio" id="Text1" class="col-xs-12 col-sm-12" /></div> 
                                                                <label class="col-sm-1 control-label no-padding-right" for="form-input-readonly">Realizada</label>                                                     
                                                                <div class="col-sm-7">&nbsp;</div>
									                        </div>
									                        <div class="form-group">
										                        <div class="col-sm-12"><input type="text" id="TxtNombre" placeholder="<%=this.Dictionary["Nombre"] %>" class="col-xs-10 col-sm-10" /></div>
                                                            </div>
									                        <div class="space-4"></div>
									                        <div class="form-group">
                                                                <label class="col-sm-1 control-label" for="form-input-readonly"><%=this.Dictionary["Participantes"] %></label>
										                        <div class="col-sm-1"><span class="btn btn-light" style="height:30px;" id="BtnProcedencia">...</span></div>
                                                            </div>                                                            
								                            <div class="row">
									                            <div class="col-xs-12">
										                            <div class="table-responsive">
											                            <table class="table table-bordered table-striped">
														                            <thead class="thin-border-bottom">
															                            <tr>
																                            <th><%=this.Dictionary["Participante"] %></th>
																                            <th><%=this.Dictionary["Cargo"] %></th>
															                            </tr>
														                            </thead>

														                            <tbody>
                                                                                        <tr>
                                                                                            <td>Juan Castilla Calderón</td>
                                                                                            <td>Técnico mantenimiento</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>Marino Acevedo</td>
                                                                                            <td>Técnico mantenimiento</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>Julián Matertínez Andreu</td>
                                                                                            <td>Recursos humanos</td>
                                                                                        </tr>
														                            </tbody>
													                            </table>
										                            </div><!-- /.table-responsive -->
									                            </div><!-- /span -->
								                            </div><!-- /row -->	
									                        <div class="space-4"></div>
									                        <div class="form-group">
                                                                <label class="col-sm-2 control-label" for="form-input-readonly">Data prevista</label>
                                                                <div class="col-sm-2">
                                                                    <select class="col-xs-12 col-sm-12">
                                                                        <option value="0">Mes</option>
                                                                        <option value="1"><%=this.Dictionary["Enero"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Febrero"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Marzo"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Abril"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Mayo"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Junio"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Julio"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Agosto"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Septiembre"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Octubre"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Noviembre"] %></option>
                                                                        <option value="1"><%=this.Dictionary["Diciembre"] %></option>
                                                                    </select>
                                                                </div>
										                        <div class="col-sm-2"><input type="text" id="Text3" placeholder="Any" class="col-xs-10 col-sm-10" /></div>
                                                            </div>
									                        <div class="form-group">
										                        <div class="col-sm-6"><input type="text" id="Text4" placeholder="Formador" class="col-xs-12 col-sm-12" /></div>
										                        <div class="col-sm-3"><input type="text" id="Text5" placeholder="Hores" class="col-xs-12 col-sm-12" /></div>
										                        <div class="col-sm-3"><input type="text" id="Text6" placeholder="Cost" class="col-xs-12 col-sm-12" /></div>
                                                            </div>
									                        <div class="form-group">
										                        <div class="col-sm-2"><input type="text" id="Text8" placeholder="Inici real" class="col-xs-12 col-sm-12" /></div>
										                        <div class="col-sm-2"><input type="text" id="Text9" placeholder="Data fi real" class="col-xs-12 col-sm-12" /></div>
                                                            </div>
                                                            <div class="for-group">
                                                                <label class="col-sm-12"><%=this.Dictionary["Notas"] %></label>
                                                            </div>
                                                            <div class="form-group">
										                        <div class="col-sm-12"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtResponsabilidades"></textarea></div>
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
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptBodyContentHolder" Runat="Server">
</asp:Content>

