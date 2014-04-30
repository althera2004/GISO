using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Web.UI;
using GisoFramework;
using GisoFramework.Item;
using GisoFramework.UserInterface;

public partial class EmployeeNew : Page
{
    #region Fields
    private Company company;
    private ApplicationUser user;
    private Dictionary<string, string> dictionary;
    #endregion

    #region Properties
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

    public Company Company
    {
        get
        {
            return this.company;
        }
    }
    #endregion

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
    }
}