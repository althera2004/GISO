using System;
using System.Collections.Generic;
using System.Web.UI;
using GisoFramework;
using GisoFramework.Item;
using GisoFramework.UserInterface;

public partial class MainPanel : Page
{
    private Company company;
    private ApplicationUser user;
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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            this.Response.Redirect("Index.aspx");
        }

        this.user = new ApplicationUser(Convert.ToInt32(Session["UserId"]));
        this.company = (Company)Session["Company"];
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>;
        this.LeftMenu.Text = new LeftMenu(this.user, this.dictionary).Render();
    }
}