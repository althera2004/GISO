using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using GisoFramework;
using GisoFramework.Item;
using GisoFramework.UserInterface;

public partial class Employees : Page
{
    private Company company;
    private ApplicationUser user;
    private Dictionary<string, string> dictionary;

    public string UserLogin { get { return this.user.Login; } }
    public string UserName { get { return this.user.Name; } }

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

    public new string User
    {
        get
        {
            return this.user.Json;
        }
    }

    public string CompanyId
    {
        get
        {
            return this.company.Id.ToString();
        }
    }

    public string CompanyData
    {
        get
        {
            return Company.ToJson(this.company);
        }
    }

    public Company Company { get { return this.company; } }

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

        this.user = new ApplicationUser(Convert.ToInt32(Session["UserId"]));
        this.company = (Company)Session["Company"];
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>;
        this.LeftMenu.Text = new LeftMenu(this.user, this.dictionary).Render();
        this.RenderEmployeeData();
    }

    private void RenderEmployeeData()
    {
        StringBuilder res = new StringBuilder();
        foreach (Employee employee in this.company.Employees)
        {
            res.Append(employee.GetEmployeeRow);
        }

        this.EmployeeData.Text = res.ToString();
    }
}