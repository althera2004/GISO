using System;
using System.Collections.Generic;
using System.Web.UI;
using GisoFramework.Item;

public partial class FormacionView : Page
{
    private Giso master;
    private int processId;
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
            this.processId = Convert.ToInt32(this.Request.QueryString["id"].ToString());
        }

        this.company = (Company)Session["company"];
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>;

        string label = this.processId == -1 ? "Nueva formación" : "Editar formación";
        this.master = this.Master as Giso;
        string serverPath = this.Request.Url.AbsoluteUri.Replace(this.Request.RawUrl.Substring(1), string.Empty);
        this.master.AddBreadCrumb("Formación", "FormacionList.aspx", false);
        this.master.AddBreadCrumb(label);
        this.master.Titulo = label;
    }
}