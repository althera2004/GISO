<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Departments.aspx.cs" Inherits="Departments" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" type="text/css" href="css/common.css" />
    <script type="text/javascript" src="js/const.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="js/Departments.js"></script>
    <script type="text/javascript">
        var CompanyId = <%=this.CompanyId %>;
        var CompanyData = <%=this.CompanyData %>;
        var Departments = <%=this.CompanyDepartments %>;
        var User = <%=this.User %>;
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1><asp:Literal runat="server" ID="LtCompanyName"></asp:Literal></h1>
        <table>
            <thead>
                <tr>
                    <th>Departamento</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody id="TableBody">
            </tbody>
        </table>
    </div>

    </form>
</body>
</html>
