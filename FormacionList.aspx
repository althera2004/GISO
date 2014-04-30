<%@ Page Title="" Language="C#" MasterPageFile="~/Giso.master" AutoEventWireup="true" CodeFile="FormacionList.aspx.cs" Inherits="FormacionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageStyles" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageScripts" Runat="Server">
    <script type="text/javascript">
        var learning = <%=this.LearningData %>;
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHeadContentHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Contentholder1" Runat="Server">

							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
                                <h4 class="pink">
									<i class="icon-hand-right icon-animated-hand-pointer blue"></i>
									<a href="FormacionView.aspx?id=-1" class="green" id="BtnNewCargo"><%=this.Dictionary["Nueva acción formativa"] %> </a>
								</h4>
								<hr />

                                <table cellpadding="2" cellspacing="2">
                                    <tr>
                                        <td>
                                            <%=this.Dictionary["Año desde"] %>:
                                            <select>
                                                <option>2014</option>
                                            </select>
                                        </td>
                                        <td>
                                            <%=this.Dictionary["Año hasta"] %>:
                                            <select>
                                                <option>2014</option>
                                            </select>
                                        </td>
                                        <td>&nbsp;&nbsp;&nbsp;<input type="radio" name="status" /><%=this.Dictionary["Pendientes"] %></td>
                                        <td>&nbsp;&nbsp;&nbsp;<input type="radio" name="status" /><%=this.Dictionary["Realizadas"] %></td>
                                        <td>&nbsp;&nbsp;&nbsp;<input type="radio" name="status" checked="checked" /><%=this.Dictionary["Todas"] %></td>
                                    </tr>
                                </table>
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered table-striped">
														<thead class="thin-border-bottom">
															<tr>
                                                                <th style="width:20px;">&nbsp;</th>
																<th><%=this.Dictionary["Curso"] %></th>
																<th><%=this.Dictionary["Participante"] %></th>
																<th class="hidden-480" style="width:80px;" align="center"><%=this.Dictionary["Realizado"] %></th>
																<th class="hidden-480" style="width:80px;" align="center"><%=this.Dictionary["Apto"] %></th>
																<th class="hidden-480" style="width:150px;" align="center"><%=this.Dictionary["Fecha prevista"] %></th>
															</tr>
														</thead>
														<tbody>
                                                            <asp:Literal runat="server" ID="LtLearningTable"></asp:Literal>
														</tbody>
													</table>
										</div><!-- /.table-responsive -->
									</div><!-- /span -->
								</div><!-- /row -->	
                                
                                <div class="clearfix form-actions">
									<div class="col-md-12">
										<button class="btn btn-success" type="button" id="BtnSave">
											<i class="icon-ok bigger-110"></i><%=this.Dictionary["Realizado"] %>
										</button>
										&nbsp; &nbsp; &nbsp;
										<button class="btn btn-success" type="button" id="Button1">
											<i class="icon-ok bigger-110"></i><%=this.Dictionary["Apto"] %>
										</button>
										&nbsp; &nbsp; &nbsp;
										<button class="btn btn-danger" type="button" id="Button2" style="right:0;">
											<i class="icon-fail bigger-110"></i><%=this.Dictionary["Eliminar"] %>
										</button>
									</div>
								</div>							
							</div><!-- /.col -->
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptBodyContentHolder" Runat="Server">
</asp:Content>

