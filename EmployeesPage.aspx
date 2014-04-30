<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeesPage.aspx.cs" Inherits="EmployessPage" %>

<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en"> <!--<![endif]-->
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <title>Esthetics Admin - Clean &amp; Responsive Admin Template</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/script.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript">
        var CompanyId = <%=this.CompanyId %>;
        var CompanyData = <%=this.CompanyData %>;
        var User = <%=this.User %>;
    </script>
</head>

<body>
  <nav style="width:95px;">
    <ul>
       <li>
         <a href="/MainPanel.aspx" title="Dashboard">
           <i class="icon-map-marker"></i>
           Dashboard
         </a>
       </li>
       
       <li>
         <a href="/CompanyPage.aspx" title="Compañía">
         <i class="icon-edit"></i>
           Forms Stuff
         </a>
       </li>
       
      <li>
        <a href="/DeparmenstPage.aspx" title="Departamentos">
           <i class="icon-random"></i>
           UI Elements
        </a>
      </li>
       
       <li>
         <a href="#" class="current" title="Empleados">
         <i class="icon-cogs"></i>
           Plugins
         </a>
      </li>
       
       <li>
         <a href="popup-alert.html" title="Notifications">
         <i class="icon-warning-sign"></i>
           Notifications
         </a>
       </li>
       
       <li>
         <a href="google-map.html" title="Error Pages" >
         <i class="icon-check"></i>
           Additional
         </a>
       </li>
    </ul>
  </nav><!--NAV ENDS HERE-->
  
  <div class="main" style="margin-left:100px;">
    <div class="non-shortable-content" style="width:50%;float:left;">
            <h1><span id="CompanyName"></span></h1>
            <h6>Gesti&oacute;n de empleados</h6> 
        </div>
        <div class="user" style="width:30%;float:right;border:none;">
            <img src="images/user.jpg" alt="Esthetics Admin"/>
            <span id="UserName"></span>
            <p>Administrador</p>
        </div> 
    
        <div class="shortable-content">  
            <div id="contact_list">
                <div class="slider-content">
                    <asp:Literal runat="server" id="EmployeesList"></asp:Literal>
                </div>
            </div>


        </div><!--SHORTABLECONTENT-ENDS-->

  </div><!--MAIN ENDS-->
</body>
</html>
