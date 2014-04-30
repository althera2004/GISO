<%@ Page Title="" Language="C#" MasterPageFile="~/Giso.master" AutoEventWireup="true" CodeFile="Deparments.aspx.cs" Inherits="Deparments" %>

<asp:Content ID="PageStyle" ContentPlaceHolderID="PageStyles" runat="server">
    <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
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
									<a href="#" class="green" id="BtnNewDepartment"> <%=this.Dictionary["Añadir departamento"]%> </a>
								</h4>
								<hr />
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered table-striped">
														<thead class="thin-border-bottom">
															<tr>
																<th>
																	<i class="icon-list blue"></i><%=this.Dictionary["Nombre"] %>
																</th>
																<th class="hidden-480">
																	<i class="icon-group blue"></i><%=this.Dictionary["Empleados"] %>
																</th>													
															</tr>
														</thead>

														<tbody>
															<asp:Literal runat="server" ID="DepartmentData"></asp:Literal>
														</tbody>
													</table>
                                                    <div id="dialog-message" class="hide" style="width:500px;">
											            <p>
												            This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.
											            </p>

											            <div class="hr hr-12 hr-double"></div>

											            <p>
												            Currently using
												            <b>36% of your storage space</b>
												            .
											            </p>
										            </div><!-- #dialog-message -->
										</div><!-- /.table-responsive -->
									</div><!-- /span -->
								</div><!-- /row -->								
							</div><!-- /.col -->

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptBodyContentHolder" Runat="Server"> 

		<script src="assets/js/jquery-ui-1.10.3.full.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
  
		<script type="text/javascript">
		    jQuery(function ($) {


		        //override dialog's title function to allow for HTML titles
		        $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
		            _title: function (title) {
		                var $title = this.options.title || '&nbsp;'
		                if (("title_html" in this.options) && this.options.title_html == true)
		                    title.html($title);
		                else title.text($title);
		            }
		        }));

		        $("#id-btn-dialog1").on('click', function (e) {
		            e.preventDefault();

		            var dialog = $("#dialog-message").removeClass('hide').dialog({
		                resizable: false,
		                modal: true,
		                title: "<div class='widget-header'><h4 class='smaller'><i class='icon-warning-sign red'></i> Empty the recycle bin?</h4></div>",
		                title_html: true,
		                buttons: [
							{
							    html: "<i class='icon-trash bigger-110'></i>&nbsp; Delete all items",
							    "class": "btn btn-danger btn-xs",
							    click: function () {
							        $(this).dialog("close");
							    }
							}
							,
							{
							    html: "<i class='icon-remove bigger-110'></i>&nbsp; Cancel",
							    "class": "btn btn-xs",
							    click: function () {
							        $(this).dialog("close");
							    }
							}
						]

		            });

		            /**
		            dialog.data( "uiDialog" )._title = function(title) {
		            title.html( this.options.title );
		            };
		            **/
		        });


		        $("#BtnNewDepartment").on('click', function (e) {
		            e.preventDefault();

		            $("#dialog-message").removeClass('hide').dialog({
		                resizable: false,
		                modal: true,
		                title: "<div class='widget-header'><h4 class='smaller'><i class='icon-list blue'></i> Nuevo departamaneto</h4></div>",
		                title_html: true,
		                buttons: [
							{
							    html: "<i class='icon-ok bigger-110'></i>&nbsp; Afegir",
							    "class": "btn btn-success btn-xs",
							    click: function () {
							        $(this).dialog("close");
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
		    });
		</script>

</asp:Content>

