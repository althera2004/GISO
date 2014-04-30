using System;
using System.Collections.Generic;
using System.Web.UI;
using GisoFramework;
using GisoFramework.Item;

public partial class UserProfileView : Page
{
    private Giso master;
    private Company company;
    private Dictionary<string, string> dictionary;
    private int userId;
    private Employee employee;
    private ApplicationUser applicationUser;

    public string EmployeeJson
    {
        get
        {
            return this.employee.Json;
        }
    }

    public string UserJson
    {
        get
        {
            return this.applicationUser.Json;
        }
    }

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
    /// <param name="e">Event arguments</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            this.Response.Redirect("Default.aspx");
        }

        if (this.Request.QueryString["userid"] != null)
        {
            this.userId = Convert.ToInt32(this.Request.QueryString["userid"].ToString());
            this.applicationUser = new ApplicationUser(this.userId);
            this.employee = new Employee(this.applicationUser.Employee.Id, true);
        }

        this.company = (Company)Session["company"];
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>;
        this.master = this.Master as Giso;
        this.master.AddBreadCrumbInvariant(this.employee.FullName);
        this.master.Titulo = this.employee.FullName;
        this.master.TitleInvariant = true;
    }
}