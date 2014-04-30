<%@ Page Title="" Language="C#" MasterPageFile="~/Giso.master" AutoEventWireup="true" CodeFile="CompanyProfile.aspx.cs" Inherits="CompanyProfile" %>

<asp:Content ID="PageStyle" ContentPlaceHolderID="PageStyles" Runat="Server">
    <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageScripts" Runat="Server">
    <script type="text/javascript">
        var addresses= <%=this.Addresses %>;
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptHeadContentHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Contentholder1" Runat="Server">
                            <form class="form-horizontal" role="form">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Nombre o Razón social </label>
                                        
										<div class="col-sm-6">
											<input type="text" id="TxtName" placeholder="Nombre o razón social" class="col-xs-10 col-sm-10" value="<%=this.Company.Name %>" />
										</div>
										<div class="col-sm-3">
											<input type="text" id="TxtNif" placeholder="NIF/CIF" class="col-xs-10 col-sm-6" value="<%=this.Company.Nif %>" />
										</div>
									</div>

									<div class="space-4"></div>
                                    
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">Adreça</label>
                                        <div class="col-sm-6">										
										    <select class="form-control col-xs-10 col-sm-10" id="CmbAddress" data-placeholder="Trïi una adreça...">
											    <asp:Literal runat="server" ID="LtAddressOptions"></asp:Literal>
										    </select>
                                        </div>
                                        <div class="col-sm-1">	
                                            <span class="btn btn-light" style="height:30px;" id="BtnAddAddress">...</span>
                                        </div>

									</div>

									<div class="space-4"></div>
                                    
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-input-readonly"> Código postal </label>

										<div class="col-sm-1">
											<input readonly="" type="text" class="col-xs-10 col-sm-12" id="TxtPostalCode" value="<%=this.CompanyDefaultAddress.PostalCode %>" />
										</div>

										<label class="col-sm-1 control-label no-padding-right" for="form-input-readonly"> Localidad </label>

										<div class="col-sm-6">
											<input readonly="" type="text" class="col-xs-10 col-sm-5" id="TxtCity" value="<%=this.CompanyDefaultAddress.City %>" />
										</div>
									</div>

									<div class="space-4"></div>
                                    
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-input-readonly"> Provincia </label>

										<div class="col-sm-3">
											<input readonly="" type="text" class="col-xs-10 col-sm-12" id="TextProvince" value="<%=this.CompanyDefaultAddress.Province %>" />
										</div>

										<label class="col-sm-1 control-label no-padding-right" for="form-input-readonly"> País </label>

										<div class="col-sm-3">
											<input readonly="" type="text" class="col-xs-10 col-sm-12" id="TxtCountry" value="<%=this.CompanyDefaultAddress.Country %>" />
										</div>
									</div>

									<div class="space-4"></div>
                                    
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-input-readonly"> Teléfono </label>

										<div class="col-sm-2">
											<input readonly="" type="text" class="col-xs-10 col-sm-12" id="TxtPhone" value="<%=this.CompanyDefaultAddress.Phone %>" />
										</div>

										<label class="col-sm-1 control-label no-padding-right" for="form-input-readonly"> Fax </label>

										<div class="col-sm-2">
											<input readonly="" type="text" class="col-xs-10 col-sm-12" id="TxtFax" value="<%=this.CompanyDefaultAddress.Fax %>" />
										</div>

										<label class="col-sm-1 control-label no-padding-right" for="form-input-readonly"> Móvil </label>

										<div class="col-sm-2">
											<input readonly="" type="text" class="col-xs-10 col-sm-12" id="TxtMobile" value="<%=this.CompanyDefaultAddress.Mobile %>" />
										</div>
									</div>

									<div class="space-4"></div>
                                    
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-input-readonly"> Email </label>

										<div class="col-sm-9">
											<input readonly="" type="text" class="col-xs-10 col-sm-12" id="TxtEmail" value="<%=this.CompanyDefaultAddress.Email %>" />
										</div>
									</div>

									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="button" id="BtnSave">
												<i class="icon-ok bigger-110"></i>
												Desar canvis
											</button>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="Cancel·lar canvis">
												<i class="icon-undo bigger-110"></i>
												Reset
											</button>
										</div>
									</div>
								</form>
                            <div id="dialogAddAddress" class="hide" style="width:800px;">
								<form class="form-horizontal" role="form" id="FormNewAddressDialog">                                    
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right" for="TxtNewAddress"> Dirección </label>
										<div class="col-sm-9">
											<input type="TxtNewAddressPostalCode" class="col-xs-10 col-sm-12" id="TxtNewAddress" value="" />
										</div>
									</div>
									<div class="space-4"></div>                                    
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right" for="TxtNewAddressPostalCode"> Código postal </label>
										<div class="col-sm-2">
											<input  type="text" class="col-xs-10 col-sm-12" id="TxtNewAddressPostalCode" value="" />
										</div>
										<label class="col-sm-2 control-label no-padding-right" for="TxtNewAddressCity"> Localidad </label>
										<div class="col-sm-6">
											<input type="text" class="col-xs-10 col-sm-12" id="TxtNewAddressCity" value="" />
										</div>
									</div>
									<div class="space-4"></div>                                    
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right" for="TxtNewAddressProvince"> Provincia </label>
										<div class="col-sm-3">
											<input type="text" class="col-xs-10 col-sm-12" id="TxtNewAddressProvince" value="" />
										</div>
										<label class="col-sm-1 control-label no-padding-right" for="TxtNewAddressCountry"> País </label>
										<div class="col-sm-3">
											<input type="text" class="col-xs-10 col-sm-12" id="TxtNewAddressCountry" value="" />
										</div>
									</div>
									<div class="space-4"></div>                                    
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right" for="TxtNewAddressPhone"> Teléfono </label>
										<div class="col-sm-2">
											<input type="text" class="col-xs-10 col-sm-12" id="TxtNewAddressPhone" value="" />
										</div>
										<label class="col-sm-1 control-label no-padding-right" for="TxtNewAddressFax"> Fax </label>
										<div class="col-sm-2">
											<input type="text" class="col-xs-10 col-sm-12" id="TxtNewAddressFax" value="" />
										</div>
										<label class="col-sm-1 control-label no-padding-right" for="TxtNewAddressMobile"> Móvil </label>
										<div class="col-sm-2">
											<input type="text" class="col-xs-10 col-sm-12" id="TxtNewAddressMobile" value="" />
										</div>
									</div>
									<div class="space-4"></div>                                    
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right" for="TxtNewAddressEmail"> Email </label>
										<div class="col-sm-9">
											<input type="text" class="col-xs-10 col-sm-12" id="TxtNewAddressEmail" value="" />
										</div>
									</div>
								</form>
						    </div><!-- #dialog-message -->



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
        <script type="text/javascript">
            function AddressChanged() {
                var addressId = $('#CmbAddress')[0].selectedOptions[0].value;
                for (var x = 0; x < addresses.length; x++) {
                    if (addresses[x].Id == addressId) {
                        $('#TxtPostalCode').val(addresses[x].PostalCode);
                        $('#TxtCity').val(addresses[x].City);
                        $('#TxtProvince').val(addresses[x].Province);
                        $('#TxtCountry').val(addresses[x].Country);
                        $('#TxtPhone').val(addresses[x].Phone);
                        $('#TxtMobile').val(addresses[x].Mobile);
                        $('#TxtFax').val(addresses[x].Fax);
                        $('#TxtEmail').val(addresses[x].Email);
                    }
                }
            }

            function SaveCompany() {
                var addressId = 0;
                for (var x = 0; x < $('#CmbAddress')[0].length; x++) {
                    if ($('#CmbAddress')[0][x].selected === true) {
                        addressId = $('#CmbAddress')[0][x].value;
                    }
                }                

                var webMethod = "/Async/CompanyActions.asmx/Save";
                var data = {
                    'id': company.Id,
                    'name': $('#TxtName').val(),
                    'nif': $('#TxtNif').val(),
                    'address': addressId,
                    'userId': user.Id
                };

                $.ajax({
                    type: "POST",
                    url: webMethod,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(data, null, 2),
                    success: function (response) {
                        if (response.d.Success === true) {
                            alert('ok');
                        }
                        if (response.d.Success !== true) {
                            alert(response.d.MessageError);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert(jqXHR.responseText);
                    }
                });
            }
            
            var SaveAndSelect = 0;

            jQuery(function ($) {

                $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
                    _title: function (title) {
                        var $title = this.options.title || '&nbsp;'
                        if (("title_html" in this.options) && this.options.title_html == true)
                            title.html($title);
                        else title.text($title);
                    }
                }));

                $('#BtnSave').click(SaveCompany);
                $('#CmbAddress').change(AddressChanged);
                $("#BtnAddAddress").on('click', function (e) {
                    e.preventDefault();

                    var dialog = $("#dialogAddAddress").removeClass('hide').dialog({
                        resizable: false,
                        modal: true,
                        title: "<div class='widget-header'><h4 class='smaller'><i class='icon-list blue'></i> Inserir nova adreça per la companyia</h4></div>",
                        title_html: true,
                        width: 800,
                        buttons: [
							{
							    id: 'BtnNewAddresSave',
							    html: "<i class='icon-ok bigger-110'></i>&nbsp; Afegir",
							    "class": "btn btn-success btn-xs",
							    click: function () {
							        SaveAndSelect = 0;
							        Save();
							    }
							}
							,
							{
							    id: 'BtnNewAddrwsSaveAndSelect',
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


                $('[data-rel=tooltip]').tooltip({ container: 'body' });
                $('[data-rel=popover]').popover({ container: 'body' });

            });

            function Save() {
                alert(SaveAndSelect);
            }
		</script>

</asp:Content>

