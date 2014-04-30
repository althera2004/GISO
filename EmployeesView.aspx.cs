using System;
using System.Collections.Generic;
using System.Web.UI;
using GisoFramework.Item;

public partial class EmployeesView : Page
{
    private Giso master;
    private int employeeId;
    private Employee employee;
    private Company company;
    private Dictionary<string, string> dictionary;

    /// <summary>
    /// Gets the dictionary for interface texts
    /// </summary>
    public Dictionary<string, string> Dictionary
    {
        get
        {
            return this.dictionary;
        }
    }

    /// <summary>
    /// Page's load event
    /// </summary>
    /// <param name="sender">Loaded page</param>
    /// <param name="e">Event's arguments</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            this.Response.Redirect("Default.aspx");
        }

        if (this.Request.QueryString["id"] != null)
        {
            this.employeeId = Convert.ToInt32(this.Request.QueryString["id"].ToString());
        }

        this.company = (Company)Session["company"];
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>; 
        string label = this.employeeId == -1 ? "Añadir nuevo empleado" : "Detalle del empleado";
        this.master = this.Master as Giso;
        string serverPath = this.Request.Url.AbsoluteUri.Replace(this.Request.RawUrl.Substring(1), string.Empty);
        this.master.AddBreadCrumb("Documentos", "Employees.aspx", false);
        this.master.AddBreadCrumb(label);
        this.master.Titulo = label;
        
        if (employeeId > 0)
        {
            this.employee = new Employee(this.employeeId);            
        }
        else
        {
            this.employee = Employee.Empty;
        }
    }
}