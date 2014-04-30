using System;
using System.Web.UI;
using GisoFramework;
using GisoFramework.Item;

public partial class Departments : Page
{
    private Company company;
    private ApplicationUser user;

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

    public string CompanyDepartments
    {
        get
        {
            return new CompanyActions().GetDepartments(this.company.Id);
        }
    }

    /// <summary>
    /// Page's load event
    /// </summary>
    /// <param name="sender">Loaded page</param>
    /// <param name="e">Event's arguments</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            this.Response.Redirect("Login.aspx");
        }

        this.user = (ApplicationUser)Session["user"];
        if (Session["Company"] != null)
        {
            this.company = (Company)Session["Company"];
            this.LtCompanyName.Text = this.company.Name;
        }
    }
}