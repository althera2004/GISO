<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Id" DataSourceID="SqlDataSource1" 
            EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" 
                    SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="SubscriptionStar" HeaderText="SubscriptionStar" 
                    SortExpression="SubscriptionStar" />
                <asp:BoundField DataField="SubscriptionEnd" HeaderText="SubscriptionEnd" 
                    SortExpression="SubscriptionEnd" />
                <asp:BoundField DataField="MailContact" HeaderText="MailContact" 
                    SortExpression="MailContact" />
                <asp:BoundField DataField="Web" HeaderText="Web" SortExpression="Web" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:GISOConnectionString1 %>" 
            DeleteCommand="DELETE FROM [Companies] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [Companies] ([Name], [SubscriptionStar], [SubscriptionEnd], [MailContact], [Web]) VALUES (@Name, @SubscriptionStar, @SubscriptionEnd, @MailContact, @Web)" 
            ProviderName="<%$ ConnectionStrings:GISOConnectionString1.ProviderName %>" 
            SelectCommand="SELECT [Id], [Name], [SubscriptionStar], [SubscriptionEnd], [MailContact], [Web] FROM [Companies]" 
            UpdateCommand="UPDATE [Companies] SET [Name] = @Name, [SubscriptionStar] = @SubscriptionStar, [SubscriptionEnd] = @SubscriptionEnd, [MailContact] = @MailContact, [Web] = @Web WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter DbType="Date" Name="SubscriptionStar" />
                <asp:Parameter DbType="Date" Name="SubscriptionEnd" />
                <asp:Parameter Name="MailContact" Type="String" />
                <asp:Parameter Name="Web" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter DbType="Date" Name="SubscriptionStar" />
                <asp:Parameter DbType="Date" Name="SubscriptionEnd" />
                <asp:Parameter Name="MailContact" Type="String" />
                <asp:Parameter Name="Web" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
