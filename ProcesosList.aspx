<%@ Page Title="" Language="C#" MasterPageFile="~/Giso.master" AutoEventWireup="true" CodeFile="ProcesosList.aspx.cs" Inherits="ProcesosList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageStyles" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageScripts" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHeadContentHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Contentholder1" Runat="Server">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
                                <h4 class="pink">
									<i class="icon-hand-right icon-animated-hand-pointer blue"></i>
									<a href="ProcesosView.aspx?id=-1" class="green" id="BtnNewCargo"> <%=this.Dictionary["Añadir proceso"]%> </a>
								</h4>
								<hr />
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered table-striped">
														<thead class="thin-border-bottom">
															<tr>
																<th><%=this.Dictionary["Nombre"] %></th>
																<th><%=this.Dictionary["Responsable directo"] %></th>
																<th style="width:180px;"><%=this.Dictionary["Tipo"] %></th>												
															</tr>
														</thead>
														<tbody>
															<asp:Literal runat="server" ID="ProcesosData"></asp:Literal>
														</tbody>
													</table>
										</div><!-- /.table-responsive -->
									</div><!-- /span -->
								</div><!-- /row -->								
							</div><!-- /.col -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptBodyContentHolder" Runat="Server">
</asp:Content>

