<%@ Page Title="" Language="C#" MasterPageFile="~/Giso.master" AutoEventWireup="true" CodeFile="CargosView.aspx.cs" Inherits="CargosView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageStyles" Runat="Server">
    <link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.full.min.css" />
    <script type="text/javascript">
        
        var departments = <%=this.Deparments %>;
        var employeeDepartmentMemberShip = <%=this.EmployeeDepartmentMemberShip %>;
        var SelectedEmployee;
        var SelectedDepartment;
    </script>
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
													<a data-toggle="tab" href="#home"><%=this.Dictionary["Cargo"] %></a>
												</li>

												<li class="" id="Li1">
													<a data-toggle="tab" href="#trazas"><%=this.Dictionary["Trazas"] %></a>
												</li>
											</ul>
											<div class="tab-content no-border padding-24">
												<div id="home" class="tab-pane active">                                                
                                                    <form class="form-horizontal" role="form">
									                        <div class="form-group">
										                        <div class="col-sm-6"><input type="text" id="TxtName" placeholder="<%=this.Dictionary["Nombre"] %>" class="col-xs-12 col-sm-12" value="<%=this.Cargo.Description %>" /></div>                                                                
										                        <div class="col-sm-6">										
										                            <select class="form-control col-xs-12 col-sm-12" id="CmbEmpleados" data-placeholder="<%=this.Dictionary["Empleados"] %>" onchange="CmbEmpleadosChange();">
											                            <asp:Literal runat="server" ID="LtEmpleados"></asp:Literal>
										                            </select>
                                                                </div>
									                        </div>
                                                            <div class="form-group">                                                            
										                        <div class="col-sm-5"><input type="text" id="TxtDepartmentName" placeholder="<%=this.Dictionary["Departamento"] %>" class="col-xs-12 col-sm-12" value="<%=this.Cargo.Department.Name %>" /></div>
                                                                <div class="col-sm-1"><span class="btn btn-light" style="height:30px;" id="BtnDepartamentos">...</span></div>
                                                            </div>
                                                            <div class="for-group">
                                                                <label class="col-sm-6"><%=this.Dictionary["Responsabilidades"] %></label>
                                                                <label class="col-sm-6"><%=this.Dictionary["Notas"] %></label>
                                                            </div>
                                                            <div class="form-group">
										                        <div class="col-sm-6"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtResponsabilidades"><%=this.Cargo.Responsibilities %></textarea></div>
										                        <div class="col-sm-6"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtNotas"><%=this.Cargo.Notes %></textarea></div>
									                        </div>
                                                            <div class="for-group">
                                                                <label class="col-sm-6"><%=this.Dictionary["Formación académica deseada"] %></label>
                                                                <label class="col-sm-6"><%=this.Dictionary["Formación específica deseada"] %></label>
                                                            </div>
                                                            <div class="form-group">
										                        <div class="col-sm-6"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtFormacionAcademicaDeseada"><%=this.Cargo.AcademicSkillsDesired %></textarea></div>
										                        <div class="col-sm-6"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtFormacionEspecificaDeseada"><%=this.Cargo.SpecificSkillsDesired %></textarea></div>
									                        </div>
                                                            <div class="for-group">
                                                                <label class="col-sm-6"><%=this.Dictionary["Experiencia laboral"] %></label>
                                                                <label class="col-sm-6"><%=this.Dictionary["Habilidades"] %></label>
                                                            </div>
                                                            <div class="form-group">
										                        <div class="col-sm-6"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtExperienciaLaboral"><%=this.Cargo.ExperienceDesired %></textarea></div>
										                        <div class="col-sm-6"><textarea rows="5" class="form-control col-xs-12 col-sm-12" maxlength="100" id="TxtHabilidades"><%=this.Cargo.DesiredHabilities %></textarea></div>
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
												<th>
													<i class="icon-caret-right blue"></i><%=this.Dictionary["Departamento"] %>
												</th>
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
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptBodyContentHolder" Runat="Server"><script type="text/javascript" src="assets/js/jquery-ui-1.10.3.full.min.js"></script>
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
            function SetDepartment(e) {
                var departmentId = e.target.id.split('-')[1];
                var departmentName = '';

                for (var x = 0; x < departments.length; x++) {
                    if (departments[x].Id == departmentId) {
                        departmentName = departments[x].Name;
                        cargo.Department.Id = departmentId;
                        break;
                    }
                }

                $('#TxtDepartmentName').val(departmentName);
                $('#dialogDepartment').dialog('close');

                var ok = false;
                for (var x = 0; x < employeeDepartmentMemberShip.length; x++) {
                    var item = employeeDepartmentMemberShip[x];
                    if(item.Employee == SelectedEmployee && item.Department == departmentId) {
                        ok = true;
                        break;
                    }
                }

                if (SelectedEmployee == 0) {
                    ok = true;
                }

                if (ok === false) {
                    alert('El empleado no pertenece al departamento seleccionado');
                    $('#TxtDepartmentName').val(getDepartmentName(SelectedDepartment));
                }
                else {
                    SelectedDepartment = departmentId;
                    cargo.Department.Id = departmentId;
                }
            }

            function CmbEmpleadosChange() {
                var ok = false;
                var employeeId = document.getElementById('CmbEmpleados').value;
                for (var x = 0; x < employeeDepartmentMemberShip.length; x++) {
                    var item = employeeDepartmentMemberShip[x];
                    if (item.Employee == employeeId && item.Department == SelectedDepartment) {
                        ok = true;
                        break;
                    }
                }

                if (SelectedDepartment == 0) {
                    ok = true;
                }

                if (ok === true) {
                    SelectedEmployee = employeeId;
                }
                else {
                    alert('El empleado no pertenece al departamento seleccionado');
                }

                SetEmployee(SelectedEmployee);
            }

            function getDepartmentName(id) {
                for (var x = 0; x < departments.length; x++) {
                    if (departments[x].Id == id) {
                        SelectedDepartment = departments[x].Id;
                        return departments[x].Name;
                    }
                }
            }

            function SetEmployee(id) {                
                var comboItems = document.getElementById('CmbEmpleados').childNodes
                for (var x = 0; x < comboItems.length; x++) {
                    var item = comboItems[x];
                    if (item.tagName == 'OPTION') {
                        if (item.value == id) {
                            item.selected = true;
                        }
                        else {
                            item.selected = false;
                        }
                    }
                }
                $('#dialogCategory').dialog('close');
            }
               
            SelectedEmployee = cargo.Employee.Id;
            SelectedDepartment = cargo.Department.Id;
            SetEmployee(SelectedEmployee);


            jQuery(function ($) {
                $('#TxtDepartmentName').val(getDepartmentName(SelectedDepartment));

                $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
                    _title: function (title) {
                        var $title = this.options.title || '&nbsp;'
                        if (("title_html" in this.options) && this.options.title_html == true)
                            title.html($title);
                        else title.text($title);
                    }
                }));

                $('.department').on('click', SetDepartment);

                $("#BtnDepartamentos").on('click', function (e) {
                    e.preventDefault();

                    var dialog = $("#dialogDepartment").removeClass('hide').dialog({
                        resizable: false,
                        modal: true,
                        title: "<div class='widget-header'><h4 class='smaller'><i class='icon-list blue'></i> Departamentos</h4></div>",
                        title_html: true,
                        width: 800,
                        buttons: [
							{
							    id: 'BtnNewDepartmentSave',
							    html: "<i class='icon-ok bigger-110'></i>&nbsp; Afegir",
							    "class": "btn btn-success btn-xs",
							    click: function () {
							        SaveAndSelect = 0;
							        Save();
							    }
							}
							,
							{
							    id: 'BtnNewDepartmentSaveAndSelect',
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
            });
        </script>
</asp:Content>

